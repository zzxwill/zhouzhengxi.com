---
title: "每天学一点 Go 语言｜7. 简洁的 switch"
date: "2020-07-09"
categories: 
  - "golang"
---

#### switch

每一个 case 后默认自带 break

跟 for 一样，可以在判断前执行一条语句。

<table class=""><tbody><tr><td><strong>switch</strong> os := runtime.GOOS; os {<br><strong>case</strong> "darwin":<br>&nbsp; fmt.Print("macOS")<br><strong>case</strong> "linux":<br>&nbsp; fmt.Println("Linux")<br>}</td></tr></tbody></table>

switch 可以代替多条件的 if-else。

今日份学习笔记：[https://docs.google.com/document/d/1G2\_YBa4hZA6huGzwFHNIiYPJ2qlCMZjmieNR\_WZoJaA/edit?usp=sharing](https://docs.google.com/document/d/1G2_YBa4hZA6huGzwFHNIiYPJ2qlCMZjmieNR_WZoJaA/edit?usp=sharing)
