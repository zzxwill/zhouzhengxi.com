---
title: "每天学一点 Go 语言|27. float64 --> int"
date: "2020-10-22"
tags: 
  - "golang"
---

##### float → int

<table class=""><tbody><tr><td><strong>func</strong> <strong>main</strong>() {<br>&nbsp; <strong>var</strong> a = 1.6<br>&nbsp; b := <strong>int</strong>(a)<br>&nbsp; fmt.Println(b)<br>}</td></tr></tbody></table>

结果是 1，float64 类型变量转成 int 后，小数点丢失。
