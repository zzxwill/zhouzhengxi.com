---
title: "由“tomcat随机启动”想到的"
date: "2014-02-18"
---

**由“tomcat随机启动”想到的**

  

我是这样设置tomcat随机启动的。

建立文件/etc/rc.d/rc2.d/S72tomcat。

#!/bin/sh  
touch /tmp/zhouzhengxi/test\_20130911  
export JAVA\_HOME=/usr/java5  
/tmp/zhouzhengxi/apache-tomcat-6.0.37/bin/startup.sh

发现每次重启机器，都能创建test\_20130911文件，但是，tomcat却无法启动。

  

问题持续两周都没有解决，于是，我开始每天就过上了这样的日子。

![](images/1392712470.png)

  

mentor了解我的问题后，给我提供了一个全新的思路——开机启动不成功，为什么不每天都将tomcat启动一次？

  

以下是具体的解决办法：

crontab命令可以管理(添加，删除，修改，显示)cron jobs. 每一个cron job是一个被cron进程定时启动的命令。

参考：[http://publib.boulder.ibm.com/infocenter/aix/v6r1/index.jsp?topic=%2Fcom.ibm.aix.cmds%2Fdoc%2Faixcmds1%2Fcrontab.htm](http://publib.boulder.ibm.com/infocenter/aix/v6r1/index.jsp?topic=%2Fcom.ibm.aix.cmds%2Fdoc%2Faixcmds1%2Fcrontab.htm)

<table border="0" cellpadding="4" cellspacing="0" style="border: 1px solid rgb(140, 177, 209); padding: 1px; border-collapse: collapse; font-size: 13px; background-color: rgb(255, 255, 255);"><tbody><tr style="border-color: rgb(140, 177, 209);"><td style="font-size: 10pt; border: rgb(140, 177, 209);" valign="top" width="33.89830508474576%"><strong><font face="Candara">/var/spool/cron/crontabs</font></strong></td><td style="font-size: 10pt; border: rgb(140, 177, 209);" valign="top" width="66.10169491525424%"><font face="Candara">Specifies the crontab spool area.</font></td></tr><tr style="border-color: rgb(140, 177, 209);"><td style="font-size: 10pt; border: rgb(140, 177, 209);" valign="top" width="33.89830508474576%"><font face="Candara">/<strong>var/adm/cron/cron.allow</strong></font></td><td style="font-size: 10pt; border: rgb(140, 177, 209);" valign="top" width="66.10169491525424%"><font face="Candara">Specifies a list of users allowed access to the&nbsp;<strong>crontab</strong>&nbsp;command.</font></td></tr><tr style="border-color: rgb(140, 177, 209);"><td style="font-size: 10pt; border: rgb(140, 177, 209);" valign="top" width="33.89830508474576%"><strong><font face="Candara">/var/adm/cron/cron.deny</font></strong></td><td style="font-size: 10pt; border: rgb(140, 177, 209);" valign="top" width="66.10169491525424%"><font face="Candara">Specifies a list of users denied access to the&nbsp;<strong>crontab</strong>&nbsp;command. &nbsp;</font></td></tr></tbody></table>

  
~superuserabc/cronjobs/startTool里是tomcat的启动命令。  

#!/bin/csh -f  
/usr/tools/bin/rem -h targetsystemabc nohup /tmp/apache-tomcat-7.0.40/bin/shutdown.sh > /dev/null  
sleep 60  
/usr/tools/bin/rem -h targetsystemabc nohup /tmp/apache-tomcat-7.0.40/bin/startup.sh > /dev/null

启动rem是用来在远程机器上执行命令的命令。

  

~superuserabc/cronjobs/crontab.userabc是cron jobs的命令。

\# min hr  Day-of-Month Month-of-year day-of-week       shell-name  
\# 1     2   3                  4                    5(Sun thru Sat)  6 

00 20 \* \* 4 ~superuserabc/cronjobs/startTool

30 02 \* \* 5 ~superuserabc/cronjobs/startTool

07 00 \* \* 4 ~superuserabc/cronjobs/startTool

  

将crontab.userabc加到系统的cron jobs里。

crontab crontab.userabc

  

启发如下：

1\. 虚心听取别人的建议和方案。从你去向别人请教的那一刻，认真听取别人的分析和想法，能解决问题更好，不能解决问题，也或许可以受到启发。

赞一句，mentor真牛！

2\. 山穷水尽时，何不想想打个飞的过去呢？穷则思变！
