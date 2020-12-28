---
title: "索引中丢失  IN 或 OUT 参数:: 5"
date: "2010-11-13"
tags: 
  - "ibatis"
  - "存储过程"
---

### 1.1.1  索引中丢失  IN 或 OUT 参数:: 5

错误原因：？个数不匹配
```
<procedure id="insertAppraiserExpert"

parameterMap="appraiserExpertParameter">

{call PKG\_CLASSCASE.insertAppraiserExpert(?,?,?,?,?)}

</procedure>
```


上面是5个
```
<parameterMap

id="appraiserExpertParameter">

<parameter property="expert" jdbcType="VARCHAR"

javaType="String" mode="IN"></parameter>

<parameter property="operatorid" jdbcType="DECIMAL"

javaType="INTEGER" mode="IN"></parameter>

<parameter property="mechanismid" jdbcType="DECIMAL"

javaType="INTEGER" mode="IN"></parameter>

<parameter property="status" jdbcType="DECIMAL"

javaType="INTEGER" mode="IN"></parameter>

</parameterMap>
```

Sql\_Map里只有4个参数
