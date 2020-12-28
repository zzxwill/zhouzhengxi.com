---
title: "建立一个与表B结构一样的A表（不包含B表数据或包含B表数据）"
date: "2011-06-16"
categories: 
  - "database"
tags: 
  - "database"
  - "oracle"
---

1. 建立一个与表B结构一样的A表（不包含B表数据或包含B表数据）

表B：

[![](images/2new.png "2new")](https://www.zhouzhengxi.com/wordpress/wp-content/uploads/2011/06/2new.png) [](https://www.zhouzhengxi.com/wordpress/wp-content/uploads/2011/06/2text2.png) 

create table text nologging as

select \* from text\_new

where 1=2;

表A———不包含表B数据：

[![](images/2text1.png "2text1")](https://www.zhouzhengxi.com/wordpress/wp-content/uploads/2011/06/2text1.png)

表A———包含表B数据：

\[sql\]create table text nologging as

select \* from text\_new\[/sql\]

[![](images/2text2.png "2text2")](https://www.zhouzhengxi.com/wordpress/wp-content/uploads/2011/06/2text2.png)
