---
title: "2.4.2 安装locate工具 —— OpenStack Heat从入门到实践"
date: "2015-09-26"
categories: 
  - "heat"
  - "openstack"
  - "云计算"
tags: 
  - "heat"
  - "iaas"
  - "openstack"
---

**安装locate工具** **—— OpenStack Heat从入门到实践**

locate命令可以在Linux下非常方便的查找文件。

具体的安装可以参考这边文章[http://www.liquidweb.com/kb/how-to-install-mlocate-locate-and-updatedb-commands-on-centos-7/](http://www.liquidweb.com/kb/how-to-install-mlocate-locate-and-updatedb-commands-on-centos-7/)。

One of the best tools for quickly finding files by filename is the **locate** command. The **locate** command reads one or more databases prepared by **updatedb** and writes file names matching at least one of the patterns to standard output, one per line.

Pre-Flight Check

- - These instructions are intended specifically for installing mlocate on CentOS 7.
    - I’ll be working from a Liquid Web Self Managed CentOS 7 server, and I’ll be logged in as root.

Step 1: Install mlocate

As a matter of best practice we’ll update our packages:

`yum -y update`

Then let’s install mlocate and any required packages:

`yum -y install mlocate`

Step 2: Updating mlocate

The following command will update the search databases:

`updatedb`

mlocate installs a cron job that will run daily to update search databases at:

/etc/cron.daily/mlocate.cron

使用方法：

locate config.py

![](images/1443275795.png)

更多《OpenStack Heat从入门到实践》系列文章，请关注

1）博客：[https://www.zhouzhengxi.com/wordpress/tag/Heat/](https://www.zhouzhengxi.com/wordpress/tag/Heat/)。

2）微信公众账号，Geek2014。

![](http://mmbiz.qpic.cn/mmbiz/AZ37fib0QltEAJAG0jb8ic7QmjxymctPGm5ll6l5wmX4icfaDnsFUPwJ4Gh7hIb7PcHsQLJicMwSlPqbWGaMAfKFYA/640?wx_fmt=jpeg&amp;wxfrom=5&amp;tp=webp&amp;wx_lazy=1)

ERROR: Request limit exceeded: You have reached the maximum stacks per tenant, 100. Please delete some stacks.
