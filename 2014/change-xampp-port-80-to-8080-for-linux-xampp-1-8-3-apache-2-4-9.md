---
title: "Change xampp port 80 to 8080 for Linux XAMPP 1.8.3 (Apache 2.4.9)"
date: "2014-05-30"
categories: 
  - "technology_summary"
tags: 
  - "apache"
  - "xampp"
---

**Change xampp port 80 to 8080 for Linux XAMPP 1.8.3 (Apache 2.4.9)**

Do not ask "Are you a fool, why do yo wanna change xampp port to 80 from 8080?". There are various requirement you might never know. Here is the solution:

Linux: CentOS release 6.5 (Final)

XAMPP location: /opt/lampp

1\. Update /opt/lampp/etc/httpd.conf

Listen 80

ServerName localhost:80

2\. Start apache

\[root@i-qg9pphar lampp\]# /opt/lampp/lampp startapache

XAMPP: Starting Apache...fail.

XAMPP: Another web server is already running.

What's up, man? Why? Apache still tries to use the same port 80 as tomcat on this server is using. I struggled hours on this and then I did this.

\[root@i-qg9pphar lampp\]# grep 80 \*

lampp: if testport 80

Binary file manager-linux-x64.run matches

properties.ini:apache\_server\_port=80

Binary file uninstall matches

Binary file uninstall.dat matches

xampp: if testport 80

\[root@i-qg9pphar lampp\]# pwd

/opt/lampp

In file, /opt/lampp/lampp, when starting, xampp tries to test whether 80 is used or not. If port 80 is used (by tomcat), it will return and won't start apache.

![](images/clipboard.png)

3\. Update /opt/lampp/lampp

if testport 80

        then

                $GETTEXT -s "fail."

                echo "XAMPP: " $($GETTEXT 'Another web server is already running.')

                return 1

4\. Start apache again

 [![xampp_startup](images/xampp_startup-300x268.png)](https://www.zhouzhengxi.com/wordpress/wp-content/uploads/2014/05/xampp_startup.png)

![](images/clipboard.png)

I have to admin that XAMPP is not perfect especially for the 80 port hardcoded in file /opt/lampp/lampp (I found someone has reported this issue to XAMPP official site [https://community.apachefriends.org/f/viewtopic.php?f=17&t=68341](https://community.apachefriends.org/f/viewtopic.php?f=17&t=68341), but without official response.)  and sometimes it will keep abusing you again and again.
