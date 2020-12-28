---
title: "1.request.getParameter 和 request.getAttribute 区别"
date: "2010-11-22"
categories: 
  - "javaee"
tags: 
  - "request"
  - "传值"
---

1.request.getParameter 和 request.getAttribute 区别

request.getParameter

是用来接受来自get方法或post方法的参数

<form   method=post>

<form   method=get>

<a   href= "1.jsp?id=1 "> ok </a>

只能接受java.lang.String

也就是说String   hotel\_id   =   request.getParameter( "hotel\_id ");

request.getAttribute

是用来接受来自servlet的变量或Action(其实Action就是特殊的Servlet)

在Action中，request.setAttribute( "ret ",ret);

只能接受java.lang.Object

也就是说List   ret   =   (List)request.getAttribute( "ret ");

如果你只用JSP，根本用不到request.getAttribute()

1.request.getParameter 和 request.getAttribute 区别request.getParameter 是用来接受来自get方法或post方法的参数 <form   method=post> <form   method=get> <a   href= "1.jsp?id=1 "> ok </a> 只能接受java.lang.String 也就是说String   hotel\_id   =   request.getParameter( "hotel\_id "); request.getAttribute 是用来接受来自servlet的变量或Action(其实Action就是特殊的Servlet) 在Action中，request.setAttribute( "ret ",ret); 只能接受java.lang.Object 也就是说List   ret   =   (List)request.getAttribute( "ret "); 如果你只用JSP，根本用不到request.getAttribute()
