---
title: "每天学一点 Go 语言|21. 神奇的 Iota"
date: "2020-09-01"
tags: 
  - "golang"
---

### Iota

常量计数器  

<table class=""><tbody><tr><td><strong>package</strong> main<br><br><strong>import</strong> (<br>&nbsp; "fmt"<br>)<br><br><strong>type</strong> Weekday <strong>int</strong><br><br><strong>const</strong> (<br>&nbsp; Sunday Weekday = iota + 1<br>&nbsp; Monday<br>&nbsp; _<br>&nbsp; Thursday<br>)<br><br><strong>func</strong> <strong>main</strong>() {<br>&nbsp; fmt.Printf("Sunday:%v\n", Sunday)<br>&nbsp; fmt.Printf("Monday:%v\n", Monday)<br>&nbsp; fmt.Printf("Thursday:%v\n", Thursday)<br>}<br><br># output<br>API server listening at: [::]:52463<br>Sunday:1<br>Monday:2<br>Thursday:4</td></tr></tbody></table>
