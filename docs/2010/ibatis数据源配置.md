---
title: "Ibatis数据源配置"
date: "2010-11-03"
tags: 
  - "c3p0"
  - "ibatis"
  - "转义"
---

## 1.1     数据源配置

配置数据源c3p0

### 1.1.1 方式一

通过读取init.properties文件

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

### 1.1.2 方式二

直接配置

<bean id="dataSource"

destroy-method="close" dependency-check="none">

<property name="driverClass">

<value>oracle.jdbc.driver.OracleDriver</value>

</property>

<property name="jdbcUrl">

<value>jdbc:oracle:thin:@10.17.40.198:1521:lab1107</value>

</property>

<property name="user">

<value>lab1107</value>

</property>

<property name="password">

<value>lab1107</value>

</property>

<property name="acquireIncrement">

<value>3</value>

</property>

<property name="initialPoolSize">

<value>3</value>

</property>

<property name="minPoolSize">

<value>2</value>

</property>

<property name="maxPoolSize">

<value>50</value>

</property>

<property name="maxIdleTime">

<value>36000</value>

</property>

<property name="idleConnectionTestPeriod">

<value>900</value>

</property>

<property name="maxStatements">

<value>100</value>

</property>

<property name="numHelperThreads">

<value>10</value>

</property>

</bean>

### 1.1.3  特别提示

<property name="jdbcUrl">

<value>jdbc:oracle:thin:@10.17.40.198:1521:lab1107</value>

</property>

中jdbc:oracle:thin:@10.17.40.198:1521:lab1107不能像init.properties中写成了jdbc\\:oracle\\:thin\\:@10.17.40.198\\:1521\\:lab1107

文件init.properties是为了转义
