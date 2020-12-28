---
title: "JS中获取action中对象的属性值，select 下拉列表 默认选中"
date: "2010-11-23"
categories: 
  - "javaee"
tags: 
  - "request"
  - "select"
  - "struts2"
---

## 1.1     JS中获取action中对象的属性值

部分参考：[http://www.gangzi.org/article/394.htm](http://www.gangzi.org/article/394.htm) 这里讲“select 下拉列表 默认选中”我觉得是见过最好的。

document.getElementsByTagName("select")\[0\].value="<%=request.getAttribute("classcase.workclass")%>";

同时，这个例子也说明了如何给下拉列表选定选项。

<select id="workCategory" name="classcase.workclass"

style="WIDTH: 90%" >

<option value="0">

请选择作品类别

</option>

<option value="计算机软件">

计算机软件

</option>

<option value="文字作品">

文字作品

</option>

</select>
