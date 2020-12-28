---
title: "仅用域名访问Wordpress"
date: "2010-08-09"
categories: 
  - "wordpress-tips"
tags: 
  - "wordpress-tips"
---

参考：[http://codex.wordpress.org/Giving\_WordPress\_Its\_Own\_Directory](http://codex.wordpress.org/Giving_WordPress_Its_Own_Directory)

1.[![](images/settings-300x192.png "settings")](https://www.zhouzhengxi.com/wordpress/wp-content/uploads/2010/08/settings.png)

2.Copy the index.php and .htaccess files from the WordPress directory into the root directory of your site (Blog address).

3.修改index.php：

将require('./wp-blog-header.php'); 改为require('./wordpress/wp-blog-header.php');

4.用你的域名(如zzxwill.info)访问你的博客。

5.OK?
