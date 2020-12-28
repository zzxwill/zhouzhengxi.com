---
title: "找出在text_new表中而不在text_old表（表中记录有空值）中的记录"
date: "2011-06-16"
categories: 
  - "database"
  - "oracle"
tags: 
  - "database"
  - "oracle"
---

text\_old表

[![](images/old.png "old")](https://www.zhouzhengxi.com/wordpress/wp-content/uploads/2011/06/old.png)

text\_new表

[![](images/new.png "new")](https://www.zhouzhengxi.com/wordpress/wp-content/uploads/2011/06/new.png) [](https://www.zhouzhengxi.com/wordpress/wp-content/uploads/2011/06/update-in.png)[](https://www.zhouzhengxi.com/wordpress/wp-content/uploads/2011/06/update-in.png) 

 

需求： 找出在text\_new表中而不在text\_old表（表中记录有空值）中的记录

结果一——使用in

[![](images/in.png "in")](https://www.zhouzhengxi.com/wordpress/wp-content/uploads/2011/06/in.png)

 

结果二——使用exist

[![](images/exists.png "exists")](https://www.zhouzhengxi.com/wordpress/wp-content/uploads/2011/06/exists.png)

 

可以看到使用in查询的结果错误，而用exists查询的结果正确，这是为什么呢？

修改in语句，首先排除text\_old中的空值，然后查询

[![](images/update-in.png "update in")](https://www.zhouzhengxi.com/wordpress/wp-content/uploads/2011/06/update-in.png)

结果也正确。

 

那么是text\_old表中的空值在作怪，但具体是为什么呢？
