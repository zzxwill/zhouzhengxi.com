---
title: "Declaration of wpdb_mysqli::db_connect() should be compatible with wpdb::db_connect("
date: "2018-03-31"
categories: 
  - "wordpress-tips"
---

 

将博客从3.8.5升级到4.9.4只有，主页和后台管理页面都报错：

> **Warning**: Declaration of wpdb\_mysqli::db\_connect() should be compatible with wpdb::db\_connect($allow\_bail = true) in **/xxx/wp-content/db.php** on line **308**

搜索发现不少基于WordPress的网站都有这个情况。

解决办法：删掉**wp-content/db.php或者不使用原生wpdb类的扩展类wpdb\_mysqli。**
