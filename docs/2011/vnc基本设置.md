---
title: "VNC基本设置"
date: "2011-10-30"
---

- 启动VNC服务：  
    执行命令：#vncserver 
- 默认情况下VNC Viewer只能看到 VNC Server的命令行。

 要VNC Viewer上可以看到Linux桌面需要做如下设置：

 在VNC Viewer所在的机器上，取消/root/.vnc/xstartup文件中下面两行的注释即可:

 unset SESSION\_MANAGER

 exec /etc/X11/xinit/xinitrc

- VNC Viewer登录
    
    输入服务器的IP和桌面编号：   
    如：192.168.0.10:1 
    

参考：[](http://soft.chinabyte.com/217/7726717.shtml)[http://soft.chinabyte.com/217/7726717.shtml](http://soft.chinabyte.com/217/7726717.shtml)[](http://soft.chinabyte.com/217/7726717.shtml)

[http://hi.baidu.com/jiangnanxiaodai/blog/item/fbe03cc6c093b4139d163df0.html](http://hi.baidu.com/jiangnanxiaodai/blog/item/fbe03cc6c093b4139d163df0.html)
