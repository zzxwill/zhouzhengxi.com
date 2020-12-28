---
title: "JSP的对象和action中对象不一致"
date: "2010-11-03"
tags: 
  - "ssi"
---

### 1.1.1 JSP的对象和action中对象不一致

错误详情：

java.lang.String, java.lang.String, java.lang.Integer\]

\[DEBUG\] 2010-11-03 16:18:10 :{conn-100032} Connection

SqlMapClient operation; uncategorized SQLException for SQL \[\]; SQL state \[null\]; error code \[0\];

\--- The error occurred in com/classcase/map/APPRAISEREXPERT\_SqlMap.xml.

\--- The error occurred while preparing the mapped statement for execution.

\--- Check the saveAppraiserexpert.

\--- Check the parameter map.

\--- Cause: java.lang.RuntimeException: Error getting property 'getExpert' of 'null'. Cause: java.lang.NullPointerException; nested exception is com.ibatis.common.jdbc.exception.NestedSQLException:

\--- The error occurred in com/classcase/map/APPRAISEREXPERT\_SqlMap.xml.

\--- The error occurred while preparing the mapped statement for execution.

\--- Check the saveAppraiserexpert.

\--- Check the parameter map.

\--- Cause: java.lang.RuntimeException: Error getting property 'getExpert' of 'null'. Cause: java.lang.NullPointerException

错误原因:

JSP代码：

<td class="table\_td" width="40%">

<s:textfield name="appraiseExpert.expert" cssStyle="WIDTH:90%" />

</td>

Action代码：

sqlMapClient.update("saveAppraiserexpert", appraiserExpert);

其中，对象的名称不一致，也就是传回action的对象没有没有被获取到。
