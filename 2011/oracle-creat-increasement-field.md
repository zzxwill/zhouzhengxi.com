---
title: "Oracle creat increasement field"
date: "2011-11-10"
---

**Oracle创建自增字段**

Oracle数据库不能创建自增字段，可以通过创建序列+触发器实现：

- 序列
    

_\-- Create sequence_

create sequence EMPLOYEE\_SEQ

minvalue 1

maxvalue 10000

start with 1

increment by 1

nocache;

- 触发器
    

CREATE OR REPLACE TRIGGER EMPLOYEE\_TRIG

BEFORE INSERT

ON EMPLOYEE --数据库中表名

FOR EACH ROW

DECLARE

NEXTVAL INTEGER;

begin

select EMPLOYEE\_SEQ.NEXTVAL into NEXTVAL from dual;

:NEW.ID := NEXTVAL; --NEW:不变 ID:为EMPLOYEE的自增字段

end;
