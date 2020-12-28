---
title: "老师，我再也没有借口了。。。"
date: "2014-06-05"
---

通过SSH转发稳定访问Google搜索

- 下载Cygwin运行包。

下载[Cygwin包](https://www.zhouzhengxi.com/temp/cygwin64.7z)，下载后，解压到C盘根目录下，出现C:\\\\cygwin64文件结构。

- 配置Cygwin运行的环境变量

Start-->Computer-->Properties-->Advanced System settings-->Advanced-->点击按钮”Environment Variables“-->System variables-->Path-->Edit-->在结尾处添加“;c:\\cygwin64\\bin”

[![1](images/1.png)](https://www.zhouzhengxi.com/wordpress/wp-content/uploads/2014/06/1.png) [![2](images/2-271x300.png)](https://www.zhouzhengxi.com/wordpress/wp-content/uploads/2014/06/2.png) [![5](images/5-300x128.png)](https://www.zhouzhengxi.com/wordpress/wp-content/uploads/2014/06/5.png)

-  测试SSH环境

在CMD命令行中输入ssh回车，看是否出现如下提示，如果出现代表Cygwin环境配置成功。

[![4](images/4-300x113.png)](https://www.zhouzhengxi.com/wordpress/wp-content/uploads/2014/06/4.png) 

- 开始运行ssh脚本

私信提供脚本文件
