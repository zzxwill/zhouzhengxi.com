---
title: "MyEclipse生成iBatis代码以及配置文件"
date: "2010-11-15"
tags: 
  - "abator"
  - "ibatis"
---

转自：[http://blog.csdn.net/luinstein/archive/2009/12/14/5003214.aspx](http://blog.csdn.net/luinstein/archive/2009/12/14/5003214.aspx)

一.安装插件 

从[http://ibatis.apache.org/abator.html](http://ibatis.apache.org/abator.html)下载Eclipse Plugin。

插件一共有2种安装方式. 1.远程安装. eclipse->Help>Software Updates>Find and Install->Search for new features to install-> New Remote Site(name:Abator for Eclipse Update Site ,URL:http://ibatis.apache.org/tools/abator) ->OK->Abator for Eclipse Update Site->OK 2.手动安装. [http://ibatis.apache.org/abator.html](http://ibatis.apache.org/abator.html)下载AbatorForEclipse1.1.0.zip,下载后在eclipse中进行操作 eclipse->Help>Software Updates>Find and Install->Search for new features to install(press "Next" )-> New Local Site->选种刚才下载的文件->OK 二.建立一个项目 新建一个Eclipse项目,输入名字，然后选择文件>新建>ABator for iBatis configuration File，选择Location，并且键入File Name：abatorCsonfig.xml。

点击“完成”，Eclipse会在程序根目录下建立abatorCsonfig.xml文件，打开编辑它，编辑成如下

<?xml version="1.0" encoding="UTF-8" ?>

<!DOCTYPE abatorConfiguration PUBLIC "-//Apache Software Foundation//DTD Abator for iBATIS Configuration 1.0//EN" "http://ibatis.apache.org/dtd/abator-config\_1\_0.dtd" >

<abatorConfiguration >

<abatorContext >

<jdbcConnection driverClass="oracle.jdbc.driver.OracleDriver" connectionURL="jdbc:oracle:thin:@10.17.40.198:1521:CLASSCASE2" userId="lab1107" password="lab1107" >

<classPathEntry location="F:\\Programming\\Java\\classcase--20101002\\WebRoot\\WEB-INF\\lib\\ojdbc14.jar" />

</jdbcConnection>

<javaModelGenerator targetPackage="com.classCase.bean" targetProject="Homework" />

<sqlMapGenerator targetPackage="com.classCase.sqlmap" targetProject="Homework" />

<table  tableName="CASEEXPERT" />

</abatorContext>

</abatorConfiguration>

<?xml version="1.0" encoding="UTF-8" ?><!DOCTYPE abatorConfiguration PUBLIC "-//Apache Software Foundation//DTD Abator for iBATIS Configuration 1.0//EN" "http://ibatis.apache.org/dtd/abator-config\_1\_0.dtd" ><abatorConfiguration >  <abatorContext >    <jdbcConnection driverClass="oracle.jdbc.driver.OracleDriver" connectionURL="jdbc:oracle:thin:@10.17.40.198:1521:CLASSCASE2" userId="lab1107" password="lab1107" >      <classPathEntry location="F:\\Programming\\Java\\classcase--20101002\\WebRoot\\WEB-INF\\lib\\ojdbc14.jar" />    </jdbcConnection>    <javaModelGenerator targetPackage="com.classCase.bean" targetProject="Homework" />    <sqlMapGenerator targetPackage="com.classCase.sqlmap" targetProject="Homework" />    <table  tableName="CASEEXPERT" />    </abatorContext></abatorConfiguration>
