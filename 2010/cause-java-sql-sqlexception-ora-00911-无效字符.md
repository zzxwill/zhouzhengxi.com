---
title: "Cause: java.sql.SQLException: ORA-00911: 无效字符"
date: "2010-10-05"
tags: 
  - "spring"
  - "sql"
  - "ssi"
---

## 1.1     Cause: java.sql.SQLException: ORA-00911: 无效字符

解决方案：

去掉sql语句后的“;”

报错信息：

\[DEBUG\] 2010-10-05 12:52:10 :{pstm-100001} Executing Statement:    select CODEID as codeID, CODENAME as codeName, STANDARDVALUE as   standardValue from CODE where CODEID = ?

\[DEBUG\] 2010-10-05 12:52:10 :{pstm-100001} Parameters: \[8\]

\[DEBUG\] 2010-10-05 12:52:10 :{pstm-100001} Types: \[java.lang.Integer\]

\[DEBUG\] 2010-10-05 12:52:11 :{rset-100002} ResultSet

\[DEBUG\] 2010-10-05 12:52:11 :{rset-100002} Header: \[CODEID, CODENAME, STANDARDVALUE\]

\[DEBUG\] 2010-10-05 12:52:11 :{rset-100002} Result: \[8, 保管费, 30.0\]

\[DEBUG\] 2010-10-05 12:52:11 :{conn-100003} Connection

\[DEBUG\] 2010-10-05 12:52:11 :{conn-100003} Preparing Statement:    select count(1) as count from code t, code u where t.codetype =   u.codetype and t.codetype = 1 and t.codeid = u.codeparentid;

\[DEBUG\] 2010-10-05 12:52:11 :{pstm-100004} Executing Statement:    select count(1) as count from code t, code u where t.codetype =   u.codetype and t.codetype = 1 and t.codeid = u.codeparentid;

\[DEBUG\] 2010-10-05 12:52:11 :{pstm-100004} Parameters: \[\]

\[DEBUG\] 2010-10-05 12:52:11 :{pstm-100004} Types: \[\]

\[INFO \] 2010-10-05 12:52:11 :Loading XML bean definitions from class path resource \[org/springframework/jdbc/support/sql-error-codes.xml\]

\[INFO \] 2010-10-05 12:52:11 :SQLErrorCodes loaded: \[DB2, Derby, H2, HSQL, Informix, MS-SQL, MySQL, Oracle, PostgreSQL, Sybase\]

SqlMapClient operation; bad SQL grammar \[\]; nested exception is com.ibatis.common.jdbc.exception.NestedSQLException:

\--- The error occurred in com/custody/map/CODE\_SqlMap.xml.

\--- The error occurred while applying a parameter map.

\--- Check the getChargeItemCount-InlineParameterMap.

\--- Check the statement (query failed).

\--- Cause: java.sql.SQLException: ORA-00911: 无效字符
