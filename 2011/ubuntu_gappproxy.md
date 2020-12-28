---
title: "Ubuntu(Linux)下GAppProxy配置+错误处理"
date: "2011-12-18"
categories: 
  - "ubuntu"
tags: 
  - "gappproxy"
  - "gfw"
  - "googleappengine"
---

Ubuntu(Linux)下GAppProxy配置+错误处理

- 配置

       请参见如何在UBUNTU环境下使用GAPPProxy [http://luan.in/gappproxy-in-ubuntu.html](http://luan.in/gappproxy-in-ubuntu.html)

这篇blog讲的很详尽，但是，对于配置Google App Engine的配置、下载服务端程序和客户端程序的说明不明确，现做一点补充说明:

1\. Google App Engine配置 请于Google App Engine官方http://code.google.com/intl/zh-CN/appengine/downloads.html，选择Google App Engine SDK for Python，下载Linux平台[最新](http://code.google.com/intl/zh-CN/appengine/downloads.html)的服务端程序，如[google\_appengine\_1.6.1.zip](http://googleappengine.googlecode.com/files/google_appengine_1.6.1.zip) 2. 服务器程序 在[gappproxy官网](http://code.google.com/p/gappproxy/)[http://code.google.com/p/gappproxy/downloads/list](http://code.google.com/p/gappproxy/downloads/list) 上下载服务端程序，选择服务端源码，如fetchserver-2.0.0.zip。 2. 客户端程序 在[gappproxy官网](http://code.google.com/p/gappproxy/)[http://code.google.com/p/gappproxy/downloads/list](http://code.google.com/p/gappproxy/downloads/list) 上下载[GAppProxy的Python版客户端](http://code.google.com/p/gappproxy/downloads/detail?name=localproxy-2.0.0.tar.gz&can=2&q=)，如localproxy-2.0.0.tar.gz。

- 错误处理

如果出现如下错误：

root@zhouzhengxi-HP:/usr/local/google\_appengine# ./appcfg.py update fetchserver/

Traceback (most recent call last):

File "./appcfg.py", line 99, in <module>

run\_file(\_\_file\_\_, globals())

File "./appcfg.py", line 95, in run\_file

execfile(script\_path, globals\_)

IOError: \[Errno 2\] No such file or directory: '/usr/local/google\_appengine/google/appengine/tools/appcfg.py'

网上一般多说是python的版本过高，不能为3.0+,但是，我觉得是找不到Google的配置，所以，我将/usr/local下的google整个移动到了/usr/local/google\_appengine下,It worked!

root@zhouzhengxi-HP:/usr/local/google\_appengine# mv ../google ./

root@zhouzhengxi-HP:/usr/local/google\_appengine# ls

appcfg.py bulkload\_client.py demos fetchserver google lib new\_project\_template RELEASE\_NOTES tools

BUGS bulkloader.py dev\_appserver.py gen\_protorpc.py google\_sql.py LICENSE README remote\_api\_shell.py VERSION

root@zhouzhengxi-HP:/usr/local/google\_appengine# ./appcfg.py update fetchserver/

Application: gappproxy4web; version: 1

Host: appengine.google.com

Starting update of app: gappproxy4web, version: 1

Getting current resource limits.

Email: zzxwill#gmail.com

Password for zzxwill#gmail.com:

Use an application-specific password instead of your regular account password.

See http://www.google.com/support/accounts/bin/answer.py?answer=185833

Email: zzxwill#gmail.com

Password for zzxwill#gmail.com:

Scanning files on local disk.

Cloning 2 application files.

Uploading 1 files and blobs.

Uploaded 1 files and blobs

Compilation starting.

Compilation completed.

Starting deployment.

Checking if deployment succeeded.

Will check again in 1 seconds.

Checking if deployment succeeded.

Deployment successful.

Checking if updated app version is serving.

Completed update of app: gappproxy4web, version: 1

root@zhouzhengxi-HP:/usr/local/google\_appengine#

root@zhouzhengxi-HP:/usr/local/google\_appengine#
