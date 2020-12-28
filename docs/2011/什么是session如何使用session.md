---
title: "什么是Session?如何使用Session?"
date: "2011-04-08"
categories: 
  - "java"
---

Session的意思是“会话“，表示客户端和服务器进行交互的时间间隔。Session开始于用户进入网站，结束于关闭浏览器离开网站。在客户和服务器”会话“期间，可以利用Session保存用户的信息，实现用户信息在系统各页面之间的传递。

Session对象存储于Web服务器内存中，并与用户相关，不同用户具有不同的Session对象，每个Session对象的信息只能有特定用户使用。

1.使用Session存取信息

在JSP中Session可以通过session内建对象直接使用，而在Servlet中，可使用下列代码：

HttpSession session=request.getSesssion();

写入Session的示例代码如下：

Session.setAttribute(“name”,”tom”);//写入一个String类型的值

Session.setAttribute(“list”,new ArrayList());

//写入一个ArrayList对象

读取Session的示例代码如下：

String n=(String)Session.getAttribute(“name”);//获取String类型的值

ArrayList l=(ArrayList)session.getAttribute(“list”);//获取ArrayList对象

 

2.设置Session有效期

Session对象存储在服务器内存中，用于跟踪存储用户信息。Session对象默认有效期一边在30分钟左右，如果用户在该时间内不做任何操作，服务器会将Session对象自动销毁。开发者可以对Session对象的有效期进行设定，具体方法如下：

(1)在Tomcat的Server.xml中定义

通过Tomcat的conf/server.xml文件，可以修改服务器上所有程序的默认有效期，设置单位为毫秒，定义代码如下：

<Context path=”/livsorder”doeBase=”/home/httpd/html/livsorder”

defaultSessionTimeOut=”3600”isWARExpanded=”true”isWARValidated=”false”isInvokerEnabled=”true”isWorkDirPersisent=”false”>

(2)在工程的Web.xml中定义

通过工程的web.xml文件，可以修改当前程序的默认有效期，设置单位为分钟，定义代码如下：

<session-config>

<session-timeout>30<session-timeout>

<session-config>

(3)通过Java代码设定

通过HttpSession类的setMaxInactiveInternal()方法可以设定Session对象的有效期，设置单位为秒，设置为-1，永不过期。示例代码如下：

HttpSession ses=request.getSession();

Ses. setMaxInactiveInternal(10);

 

4.判断Session是否失效

通过request对象的getSession()方法可以获取Session对象，getSession()

方法的定义如下：

HttpSession getSession()

HttpSession getSession(Boolean create)

getSession()方法的作用是返回一个Session对象，如果Session不存在则创建一个并返回。而getSession(Boolean create)方法当参数值为true时，如果Session不存在则创建一个并返回；当参数值为false时，如果Session不存在在返回null.

通过getSession(Boolean create)方法的返回值是否为null来判断Session是否过期。示例代码如下：

If（request.getSession(false)==null）

System.out.println(“Session has been invalidated!”);

Else

System.out.println(“Session is active!”);

 

在用户进入和退出系统之间，各页面都共享同一个Session对象。在写入Session时，任何类型的信息都变成为Object类型，在读取Session时，需要经过强制转化才能变为原来类型。
