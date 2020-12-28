---
title: "从IBM小型机AIX向Windows传输文件"
date: "2011-10-19"
---

**从IBM小型机AIX向Windows传输文件**

1. ftp 小机IP
    
    用户名，密码(默认账号吧是系统的用户名密码)
    
2. cd 目录
    
3. get 文件
    
    就到传到机器的当前路径上了
    

C:\\Documents and Settings\\NCUT>ftp 192.168.0.\*

Connected to 192.168.0.\*.

220 ordb1 FTP server (Version 4.2 Thu Feb 4 12:47:50 CST 2010) ready.

User (192.168.0.\*:(none)): root

331 Password required for root.

Password:

230-2 unsuccessful login attempt since last login.

230-Last unsuccessful login: Wed Oct 12 11:18:43 BEIST 2011 on /dev/pts/3 from s

erv

230-Last login: Wed Oct 12 11:09:11 BEIST 2011 on /dev/dtlogin/\_0

230 User root logged in.

ftp> cd /usr

250 CWD command successful.

ftp> cd ./temp4ISBN

250 CWD command successful.

ftp> ls

200 PORT command successful.

150 Opening data connection for ..

AIX\_OracleStart

226 Transfer complete.

ftp: 收到 17 字节，用时 0.00Seconds 17000.00Kbytes/sec.

ftp> ls

200 PORT command successful.

150 Opening data connection for ..

AIX\_OracleStart

226 Transfer complete.

ftp: 收到 17 字节，用时 0.00Seconds 17000.00Kbytes/sec.

ftp> get AIX\_OracleStart

200 PORT command successful.

150 Opening data connection for AIX\_OracleStart (12521 bytes).

226 Transfer complete.

ftp: 收到 12897 字节，用时 0.00Seconds 12897000.00Kbytes/sec.

ftp> bye

221 Goodbye.
