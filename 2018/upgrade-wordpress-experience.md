---
title: "当我升级WordPress时我在考虑哪些？"
date: "2018-03-31"
categories: 
  - "wordpress-tips"
---

最近将WordPress从3.8.5升级到4.9.4，主要做了这些工作：

1. WordPress本身版本升级（手动）
2. 插件升级
3. http到https升级

当我升级时，考虑了这些点：

- PHP的web server需要更新。

3.8.5版本的WordPress是由当时最新的xampp 1.8.3-2版本运行，升级后，发现.htaccess加载的主页一直出现问题，新酒还是得装在新瓶里，于是升级xampp版本，问题解决。

- 插件升级需要配置ftp

通过编译安装的proftpd，使用用户xxx，升级时1）xxx用户的默认目录应该是/xxx/htdocs目录，wordpress的升级机制可以读取.htaccess文件；2）xxx用户需要可以读写wordpress文件，所以，需要chown wordpress文件owner到xxx。

- 升级https

升级https的CA证书使用的阿里云提供的[证书服务](https://www.aliyun.com/product/cas)，配置很简单。

发布的文章存储的表wp\_posts的链接字段guid和内容字段post\_content还是http://www.zhouzhengxi.com的链接，需要更改。

并且，需要配置http到https的跳转，可以在.htaccess配置。
