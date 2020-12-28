---
title: "64位Windows通过pl/sql访问Oracle数据库出错"
date: "2012-06-27"
---

用pl/sql访问Oracle数据库时，Win 8 64位系统，也要下载32位的instantclient\_11\_2，可能是因为pl/sql只有32位的！

否则，会出现错误：

Initialization error  
Could not initialize "D:\\oracle\\product\\11.2.0\\dbhome\_1\\bin\\oci.dll"  
Make sure you have the 32 bits Oracle Client installed.  
  
OCIDLL forced to D:\\oracle\\product\\11.2.0\\dbhome\_1\\bin\\oci.dll  
LoadLibrary(C:\\oracle\\product\\11.2.0\\dbhome\_1\\bin\\oci.dll) returned 0
