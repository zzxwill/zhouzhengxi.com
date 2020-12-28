---
title: "Oracle字符串连接（存储过程）"
date: "2011-04-20"
categories: 
  - "oracle"
  - "technology_summary"
---

create or replace procedure MyProcedure3(a in string,b in string,s out string) as begin s:=a||b; end MyProcedure3;
