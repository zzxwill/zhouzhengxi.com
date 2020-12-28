---
title: "MyEclipse里使用iBATIS操作Oracle"
date: "2010-09-22"
categories: 
  - "ibatis"
  - "oracle"
  - "技术体验"
tags: 
  - "ibatis"
  - "oracle"
---

# 1       MyEclipse里使用iBATIS操作数据库Oracle(入门，教程)

## 1.1     iBATIS是什么？

iBATIS是一个支持通用SQL、存储过程和高级映射的类。iBATIS省去了所有的JDBC代码、参数的手动配置以及结果的获取。iBATIS能使用简单的XML或注释来初始化配置和映射，将接口和java PLJOs连接到数据库记录中。

“iBATIS is a first class persistence framework with support for custom SQL, stored procedures and advanced mappings.  iBATIS eliminates almost all of the JDBC code and manual setting of parameters and retrieval of results.  iBATIS can use simple XML or Annotations for configuration and map primitives, Map interfaces and Java POJOs (Plain Old Java Objects) to database records.”

## 1.2     在Myeclipse里使用iBATIS

### 1.2.1  下载iBATIS的jar包。

建议下载[iBATIS Java 2.3.4](http://apache.etoak.com/ibatis/binaries/ibatis.java/ibatis-2.3.4.726.zip)， 其中包含了一个example,便于快速上手。

[![](images/2010-9-22-8-40-37.png "2010-9-22 8-40-37")](https://www.zhouzhengxi.com/wordpress/wp-content/uploads/2010/09/2010-9-22-8-40-37.png)

### 1.2.2  导入Myeclipse工程

### 1.2.3  配置iBATIS

- 建表Account

[![](images/2010-9-22-8-40-37.png "2010-9-22 8-40-37")](https://www.zhouzhengxi.com/wordpress/wp-content/uploads/2010/09/2010-9-22-8-40-37.png)

- 配置SqlMapConfig.xml

<?xml version="1.0" encoding="UTF-8" ?>

<!DOCTYPE sqlMapConfig

PUBLIC "-//ibatis.apache.org//DTD SQL Map Config 2.0//EN"

"http://ibatis.apache.org/dtd/sql-map-config-2.dtd">

<sqlMapConfig>

<!-- Configure a built-in transaction manager.  If you're using an

app server, you probably want to use its transaction manager

and a managed datasource -->

<transactionManager type="JDBC" commitRequired="false">

<dataSource type="SIMPLE">

//下面是Oracle的配置

<property name="JDBC.Driver" value="oracle.jdbc.driver.OracleDriver"/>

<property name="JDBC.ConnectionURL" value="jdbc:oracle:thin:@201.197.240.198:1521:lab1107"/>

<property name="JDBC.Username" value="lab1107"/>

<property name="JDBC.Password" value="lab1107"/>

</dataSource>

</transactionManager>

<!-- List the SQL Map XML files. They can be loaded from the

classpath, as they are here (com.domain.data...) -->

<sqlMap resource="com/mydomain/data/Account.xml"/>

<!-- List more here...

<sqlMap resource="com/mydomain/data/Order.xml"/>

<sqlMap resource="com/mydomain/data/Documents.xml"/>

\-->

</sqlMapConfig>

- 配置Account.xml

<?xml version="1.0" encoding="UTF-8" ?>

<!DOCTYPE sqlMap

PUBLIC "-//ibatis.apache.org//DTD SQL Map 2.0//EN"

"http://ibatis.apache.org/dtd/sql-map-2.dtd">

<sqlMap namespace="Account">

<!-- Use type aliases to avoid typing the full classname every time. -->

<typeAlias alias="Account" type="com.mydomain.domain.Account"/>

<!-- Result maps describe the mapping between the columns returned

from a query, and the class properties.  A result map isn't

necessary if the columns (or aliases) match to the properties

exactly. -->

<resultMap id="AccountResult">

<result property="id" column="ACC\_ID"/>

<result property="firstName" column="ACC\_FIRST\_NAME"/>

<result property="lastName" column="ACC\_LAST\_NAME"/>

<result property="emailAddress" column="ACC\_EMAIL"/>

</resultMap>

<!-- Select with no parameters using the result map for Account class. -->

<select id="selectAllAccounts" resultMap="AccountResult">

select \* from ACCOUNT

</select>

<!-- A simpler select example without the result map.  Note the

aliases to match the properties of the target result class. -->

<select id="selectAccountById" parameterClass="int" resultClass="Account">

select

ACC\_ID as id,

ACC\_FIRST\_NAME as firstName,

ACC\_LAST\_NAME as lastName,

ACC\_EMAIL as emailAddress

from ACCOUNT

where ACC\_ID = #id#

</select>

<!-- Insert example, using the Account parameter class -->

<insert id="insertAccount" parameterClass="Account">

insert into ACCOUNT (

ACC\_ID,

ACC\_FIRST\_NAME,

ACC\_LAST\_NAME,

ACC\_EMAIL

values (

#id#, #firstName#, #lastName#, #emailAddress#

)

</insert>

<!-- Update example, using the Account parameter class -->

<update id="updateAccount" parameterClass="Account">

update ACCOUNT set

ACC\_FIRST\_NAME = #firstName#,

ACC\_LAST\_NAME = #lastName#,

ACC\_EMAIL = #emailAddress#

where

ACC\_ID = #id#

</update>

<!-- Delete example, using an integer as the parameter class -->

<delete id="deleteAccountById" parameterClass="int">

delete from ACCOUNT where ACC\_ID = #id#

</delete>

</sqlMap>

- 实例应用

下载[iBATIS自带实例](http://cid-037df1c5e010c015.office.live.com/self.aspx/.Public/com.rar)

- 效果图

[![](images/2010-9-22-9-00-22-300x262.png "2010-9-22 9-00-22")](https://www.zhouzhengxi.com/wordpress/wp-content/uploads/2010/09/2010-9-22-9-00-22.png)

PS: 网上这边文章新手可参考：[http://futureinhands.javaeye.com/blog/213628](http://futureinhands.javaeye.com/blog/213628)
