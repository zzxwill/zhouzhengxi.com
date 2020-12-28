---
title: "在MyEclipse里使用Spring(集成了iBATIS)"
date: "2010-09-24"
tags: 
  - "myeclipse"
  - "oracle"
  - "orm"
  - "spring"
---

# 1       Spring

## 1.1     Spring是什么？

Spring 是一个开源框架，是为了解决企业应用程序开发复杂性而创建的。框架的主要优势之一就是其分层架构，分层架构允许您选择使用哪一个组件，同时为 J2EE 应用程序开发提供集成的框架。

## 1.2     Spring 框架

[![](images/image009.gif "image009")](https://www.zhouzhengxi.com/wordpress/wp-content/uploads/2010/09/image009.gif)

- **核心容器**：核心容器提供 Spring 框架的基本功能。核心容器的主要组件是 BeanFactory，它是工厂模式的实现。BeanFactory 使用_控制反转_ （IOC） 模式将应用程序的配置和依赖性规范与实际的应用程序代码分开。
- **Spring** **上下文**：Spring 上下文是一个配置文件，向 Spring 框架提供上下文信息。Spring 上下文包括企业服务，例如 JNDI、EJB、电子邮件、国际化、校验和调度功能。
- **Spring AOP**：通过配置管理特性，Spring AOP 模块直接将面向方面的编程功能集成到了 Spring 框架中。所以，可以很容易地使 Spring 框架管理的任何对象支持 AOP。Spring AOP 模块为基于 Spring 的应用程序中的对象提供了事务管理服务。通过使用 Spring AOP，不用依赖 EJB 组件，就可以将声明性事务管理集成到应用程序中。
- **Spring DAO**：JDBC DAO 抽象层提供了有意义的异常层次结构，可用该结构来管理异常处理和不同数据库供应商抛出的错误消息。异常层次结构简化了错误处理，并且极大地降低了需要编写的异常代码数量（例如打开和关闭连接）。Spring DAO 的面向 JDBC 的异常遵从通用的 DAO 异常层次结构。
- **Spring ORM**：Spring 框架插入了若干个 ORM 框架，从而提供了 ORM 的对象关系工具，其中包括 JDO、Hibernate 和 iBatis SQL Map。所有这些都遵从 Spring 的通用事务和 DAO 异常层次结构。
- **Spring Web** **模块**：Web 上下文模块建立在应用程序上下文模块之上，为基于 Web 的应用程序提供了上下文。所以，Spring 框架支持与 Jakarta Struts 的集成。Web 模块还简化了处理多部分请求以及将请求参数绑定到域对象的工作。
- **Spring MVC** **框架**：MVC 框架是一个全功能的构建 Web 应用程序的 MVC 实现。通过策略接口，MVC 框架变成为高度可配置的，MVC 容纳了大量视图技术，其中包括 JSP、Velocity、Tiles、iText 和 POI。

## 1.3     在MyEclipse里使用Spring(集成了iBATIS)

- 创建Java工程TestSpring
- 选中工程TestSpring，MyEclipse -> Projects Capabilities -> Add Spring Capabilities

[![](images/image011.jpg "image011")](https://www.zhouzhengxi.com/wordpress/wp-content/uploads/2010/09/image011.jpg)

- 选择Spring版本

[![](images/image012.png "image012")](https://www.zhouzhengxi.com/wordpress/wp-content/uploads/2010/09/image012.png)

- 导入其他所需Jar包

请见 工程源码下载

- 配置log4j的日志文件

**log4j.properties**

log4j.rootLogger=DEBUG,stdout

log4j.appender.stdout=org.apache.log4j.ConsoleAppender

log4j.appender.stdout.layout=org.apache.log4j.PatternLayout

log4j.appender.stdout.layout.ConversionPattern=%d %5p (%F\\:%L) - %m%n

- 建表及相关的DAO类

见[https://www.zhouzhengxi.com/2010/09/22/myeclipse-ibatis-oracle/](https://www.zhouzhengxi.com/2010/09/22/myeclipse-ibatis-oracle/)

- 配置数据库配置文件

本工程用的是Oracle 10

**init.properties**

datasource.type=oracle10

datasource.url=jdbc\\:oracle\\:thin\\:@10.17.40.198\\:1521\\:lab875

datasource.driverClassName=oracle.jdbc.driver.OracleDriver

datasource.username=zzxfw

datasource.password=rqwrerf

datasource.maxActive=10

datasource.maxIdle=2

datasource.maxWait=120000

datasource.whenExhaustedAction=1

datasource.validationQuery=select 1 from dual

datasource.testOnBorrow=true

datasource.testOnReturn=false

c3p0.acquireIncrement=3

c3p0.initialPoolSize=3

c3p0.idleConnectionTestPeriod=900

c3p0.minPoolSize=2

c3p0.maxPoolSize=50

c3p0.maxStatements=100

c3p0.minStatements=0

c3p0.numHelperThreads=10

c3p0.maxIdleTime=36000

- Spring配置

**applicationContext.xml**

<?xml version="1.0" encoding="UTF-8"?>

<beans xmlns="http://www.springframework.org/schema/beans"

xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"

xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans-2.5.xsd">

<!-- 引入init.properties中属性 -->

<bean id="placeholderConfig"

\>

<property name="location">

<value>classpath:init.properties</value>

</property>

</bean>

<!-- 配置数据源,连接池使用c3p0 -->

<bean id="dataSource"

destroy-method="close" dependency-check="none">

<property name="driverClass">

<value>${datasource.driverClassName}</value>

</property>

<!-- 指定连接数据库的URL -->

<property name="jdbcUrl">

<value>${datasource.url}</value>

</property>

<!-- 指定数据库的用户名 -->

<property name="user">

<value>${datasource.username}</value>

</property>

<!-- 指定数据库的密码 -->

<property name="password">

<value>${datasource.password}</value>

</property>

<!--当连接池中的连接耗尽的时候c3p0一次同时获取的连接数。Default: 3 -->

<property name="acquireIncrement">

<value>${c3p0.acquireIncrement}</value>

</property>

<property name="initialPoolSize">

<value>${c3p0.initialPoolSize}</value>

</property>

<property name="minPoolSize">

<value>${c3p0.minPoolSize}</value>

</property>

<property name="maxPoolSize">

<value>${c3p0.maxPoolSize}</value>

</property>

<property name="maxIdleTime">

<value>${c3p0.maxIdleTime}</value>

</property>

<property name="idleConnectionTestPeriod">

<value>${c3p0.idleConnectionTestPeriod}</value>

</property>

<property name="maxStatements">

<value>${c3p0.maxStatements}</value>

</property>

<property name="numHelperThreads">

<value>${c3p0.numHelperThreads}</value>

</property>

</bean>

<!-- 与ibatis联系起来 -->

<bean id="sqlMapClient"

\>

<property name="dataSource" ref="dataSource"></property>

<property name="configLocation"

value="classpath:SqlMapConfig.xml">

</property>

</bean>

<bean id="sqlMapClientTemplate"

\>

<property name="sqlMapClient">

<ref bean="sqlMapClient" />

</property>

</bean>

<!--将上面的模版类织入到我们的DAO对象中-->

<bean id="accountDao"

\>

<property name="sqlMapClientTemplate">

<ref bean="sqlMapClientTemplate" />

</property>

</bean>

</beans>

- 建立DAO类与数据库的映射

**AccountDaoSqlMap.java**

**package** info.zzxwill.spring.test2;

**import** org.springframework.orm.ibatis.SqlMapClientTemplate;

**public** **class** AccountDaoSqlMap {

**private** SqlMapClientTemplate sqlMapClientTemplate;

**public** SqlMapClientTemplate getSqlMapClientTemplate() {

**return** sqlMapClientTemplate;

}

**public** **void** setSqlMapClientTemplate(

SqlMapClientTemplate sqlMapClientTemplate) {

**this**.sqlMapClientTemplate = sqlMapClientTemplate;

}

// 此方法的返回值与Account.xml的select元素的resultClass对应.

**public** Account getAccount(Integer id) {

**return** (Account) sqlMapClientTemplate.queryForObject("selectAccountById",

id);

// 注意:queryForObject方法返回一个Object,第一个参数与Account.xml的select元素

// 的id属性值对应,第二个参数的类型与Account.xml的select元素的parameterClass

// 属性值对应.

}

**public** Object insertAccount(Account account) {

**return** sqlMapClientTemplate.insert("insertAccount", account);

}

}

- 建立测试类

**Client.java**

package info.zzxwill.spring.test2;

import org.springframework.context.ApplicationContext;

import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Client {

public static void main(String\[\] args) {

ApplicationContext factory = new ClassPathXmlApplicationContext(

"/applicationContext.xml");

AccountDaoSqlMap dao = (AccountDaoSqlMap) factory.getBean("accountDao");

// 插入一个student

Account account = new Account();

account.setId(4);

account.setFirstName("Will");

account.setLastName("Zhou");

account.setEmailAddress("zzxwill@gamil.com");

dao.insertAccount(account);

account.setEmailAddress("Inserted successful.");

}

}

## 1.4     工程源码下载

http://cid-037df1c5e010c015.office.live.com/self.aspx/.Public/TestSpring.rar

## 1.5     参考网站：

1. [http://www.ibm.com/developerworks/cn/java/wa-spring1/](http://www.ibm.com/developerworks/cn/java/wa-spring1/)
2. [http://hi.baidu.com/gefforey520/blog/item/b214c14b89c6a3f483025c55.html](http://hi.baidu.com/gefforey520/blog/item/b214c14b89c6a3f483025c55.html)
3. [http://corrinejtt.javaeye.com/blog/561772](http://corrinejtt.javaeye.com/blog/561772)
