---
title: "There is no READABLE property named 'workid' in class 'java.lang.Integer'"
date: "2010-10-16"
tags: 
  - "ibatis"
---

## 1.1   There is no READABLE property named 'workid' in class 'java.lang.Integer'

错误原因：<!-- 获取三项费用的基本标准 -->

<select id="getThreeChargeStandard" parameterClass="java.lang.Integer"

resultClass="com.custody.bean.Code">

select d.STANDARDVALUE, d.PERIOD from CODE d

<dynamic prepend="where">

<isNotNull prepend="and" property="workid" >

d.codetype=#workid#

</isNotNull>

</dynamic>

</select>

而我在action里是直接传值的：

chargeService.getThreeChargeStandard(4)

parameterClass类型是 Integer，它是没有属性的，因此，应该改为

<isNotNull prepend="and" property="value" >

d.codetype=#value#

</isNotNull>

Value是默认传值的。

不过，当是从jsp页面传值的话，依然可以使用前面的变量。
