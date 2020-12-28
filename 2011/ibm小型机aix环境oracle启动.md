---
title: "IBM小型机AIX环境Oracle启动"
date: "2011-10-20"
categories: 
  - "database"
---

**IBM小型机AIX环境Oracle启动**

**IBM小型机和磁盘阵列启动关闭顺序**

<table style="border-collapse:collapse" border="0"><colgroup><col style="width:189px"><col style="width:189px"><col style="width:189px"></colgroup><tbody valign="top"><tr><td style="padding-left: 7px; padding-right: 7px; border-top:  solid black 0.5pt; border-left:  solid black 0.5pt; border-bottom:  solid black 0.5pt; border-right:  solid black 0.5pt">&nbsp;</td><td style="padding-left: 7px; padding-right: 7px; border-top:  solid black 0.5pt; border-left:  none; border-bottom:  solid black 0.5pt; border-right:  solid black 0.5pt"><p style="text-align: justify"><span style="font-family:华文楷体; font-size:10pt">启动顺序</span></p></td><td style="padding-left: 7px; padding-right: 7px; border-top:  solid black 0.5pt; border-left:  none; border-bottom:  solid black 0.5pt; border-right:  solid black 0.5pt"><p style="text-align: justify"><span style="font-family:华文楷体; font-size:10pt">关闭顺序</span></p></td></tr><tr><td style="padding-left: 7px; padding-right: 7px; border-top:  none; border-left:  solid black 0.5pt; border-bottom:  solid black 0.5pt; border-right:  solid black 0.5pt"><p style="text-align: justify"><span style="font-family:华文楷体; font-size:10pt">磁盘阵列</span></p></td><td style="padding-left: 7px; padding-right: 7px; border-top:  none; border-left:  none; border-bottom:  solid black 0.5pt; border-right:  solid black 0.5pt"><p style="text-align: justify"><span style="font-family:华文楷体; font-size:10pt">1</span></p></td><td style="padding-left: 7px; padding-right: 7px; border-top:  none; border-left:  none; border-bottom:  solid black 0.5pt; border-right:  solid black 0.5pt"><p style="text-align: justify"><span style="font-family:华文楷体; font-size:10pt">3</span></p></td></tr><tr><td style="padding-left: 7px; padding-right: 7px; border-top:  none; border-left:  solid black 0.5pt; border-bottom:  solid black 0.5pt; border-right:  solid black 0.5pt"><p style="text-align: justify"><span style="font-family:华文楷体; font-size:10pt">IBM小型机</span></p></td><td style="padding-left: 7px; padding-right: 7px; border-top:  none; border-left:  none; border-bottom:  solid black 0.5pt; border-right:  solid black 0.5pt"><p style="text-align: justify"><span style="font-family:华文楷体; font-size:10pt">2</span></p></td><td style="padding-left: 7px; padding-right: 7px; border-top:  none; border-left:  none; border-bottom:  solid black 0.5pt; border-right:  solid black 0.5pt"><p style="text-align: justify"><span style="font-family:华文楷体; font-size:10pt">2</span></p></td></tr><tr><td style="padding-left: 7px; padding-right: 7px; border-top:  none; border-left:  solid black 0.5pt; border-bottom:  solid black 0.5pt; border-right:  solid black 0.5pt"><p style="text-align: justify"><span style="color:black; font-family:华文楷体; font-size:10pt">双机热备（HA）</span></p></td><td style="padding-left: 7px; padding-right: 7px; border-top:  none; border-left:  none; border-bottom:  solid black 0.5pt; border-right:  solid black 0.5pt"><p style="text-align: justify"><span style="font-family:华文楷体"><span style="font-size:10pt">3（</span><span style="color:black; font-size:9pt">smitty clstart</span><span style="font-size:10pt">）</span></span></p></td><td style="padding-left: 7px; padding-right: 7px; border-top:  none; border-left:  none; border-bottom:  solid black 0.5pt; border-right:  solid black 0.5pt"><p style="text-align: justify"><span style="font-family:华文楷体"><span style="font-size:10pt">1（</span><span style="color:black; font-size:9pt">smitty clstop</span><span style="font-size:10pt">）</span></span></p></td></tr></tbody></table>

**Oracle启动步骤**

**基础知识：**

1. 机器启动时自动启动数据库监听

1. IBM小型机不支持在线插USB
2. su - oracle
    
    ps -ef |grep oracle
    
    查看oracle 的进程
    
3. 查看ip
    
    \# ifconfig -a
    
    en0: flags=5e080863,c0<UP,BROADCAST,NOTRAILERS,RUNNING,SIMPLEX,MULTICAST,GROUPRT,64BIT,CHECKSUM\_OFFLOAD(ACTIVE),PSEG,LARGESEND,CHAIN>
    
    inet 192.168.10.11 netmask 0xffffff00 broadcast 192.168.10.255
    
    tcp\_sendspace 131072 tcp\_recvspace 65536 rfc1323 0
    
    en2: flags=1e080863,c0<UP,BROADCAST,NOTRAILERS,RUNNING,SIMPLEX,MULTICAST,GROUPRT,64BIT,CHECKSUM\_OFFLOAD(ACTIVE),LARGESEND,CHAIN>
    
    inet 192.168.20.11 netmask 0xffffff00 broadcast 192.168.20.255
    
    inet 192.168.0.6 netmask 0xffffff00 broadcast 192.168.0.255
    
    inet 192.168.0.4 netmask 0xffffff00 broadcast 192.168.0.255
    
    tcp\_sendspace 131072 tcp\_recvspace 65536 rfc1323 0
    
    lo0: flags=e08084b<UP,BROADCAST,LOOPBACK,RUNNING,SIMPLEX,MULTICAST,GROUPRT,64BIT>
    
    inet 127.0.0.1 netmask 0xff000000 broadcast 127.255.255.255
    
    inet6 ::1/0
    
    tcp\_sendspace 131072 tcp\_recvspace 131072 rfc1323 1
    
    **执行命令**
    

1. root用户登录
    
    su –
    
2. 重启
    
    1. smitty clstart
    2. 回车（默认在"start now, on system restart or both" ）
    3. 等待左上边，command状态变成OK
    
    COMMAND STATUS
    
    **Command: running** stdout: yes stderr: no
    
    Before command completion, additional instructions may appear below.
    
    \[MORE...12\]
    
    WARNING: Application monitors are required for detecting application failures
    
    in order for HACMP to recover from them. Application monitors are started
    
    by HACMP when the resource group in which they participate is activated.
    
    The following application(s), shown with their associated resource group,
    
    COMMAND STATUS
    
    Command: OK stdout: yes stderr: no
    
    Before command completion, additional instructions may appear below.
    
    \[TOP\]
    
    Verifying Cluster Configuration Prior to Starting Cluster Services.
    
    Verifying node(s): ordb2 against the running node ordb1
    
    WARNING: Network option "routerevalidate" is set to 0 on the following nodes:
    
    ordb2
    
    Starting Corrective Action: cl\_resource\_set\_net\_option.
    
    <01> Successfully set network option routerevalidate="1" on node ordb2
    
    WARNING: Application monitors are required for detecting application failures
    
    \[MORE...42\]
    
    F1=Help F2=Refresh F3=Cancel F6=Command
    
    F8=Image F9=Shell F10=Exit /=Find
    
    n=Find Next
    
3. 查看物理磁盘状态
    
    1. F3（退出来）
    2. lspv
    
    \# lspv
    
    hdisk0 00c01dd66a2a7972 rootvg active
    
    hdisk1 00c01dd66a49f8ba rootvg active
    
    hdisk2 00c01dd6114d8f2c datavg active
    
4. 连接到另外一台小型机

telnet ordb2的IP

\# telnet 192.168.0.5

Trying...

Connected to 192.168.0.5.

Escape character is '^\]'.

telnet (ordb2)

1. 指向第一台小型机上的命令
    
    运行步骤1—3。
