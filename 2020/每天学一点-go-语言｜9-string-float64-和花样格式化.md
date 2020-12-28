---
title: "每天学一点 Go 语言｜9. string --> float64 和花样格式化"
date: "2020-07-13"
categories: 
  - "golang"
tags: 
  - "golang"
---

各种转换函数，真实傻傻记不清。

v, \_ := strconv.ParseFloat("12.3", 64)  
print(v)

## 格式化

<table class=""><tbody><tr><td>a := "Will"<br>b := 1<br>msg := fmt.Sprintf("The student %s got No. %d", a, b)<br>fmt.Println(msg)<br><br>fmt.Println("The student", a, "got No.", b)<br><br><br><br>API server listening at: [::]:59716<br>The student Will got No. 1<br>The student Will got No. 1<br><br>// 注意，a 与 "The student" 和 "got No." 前后都自动加了空格，Golang 很赞！</td></tr></tbody></table>
