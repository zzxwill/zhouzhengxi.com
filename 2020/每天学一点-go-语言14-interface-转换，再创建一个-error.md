---
title: "每天学一点 Go 语言|14. interface{} 转换，再创建一个 error"
date: "2020-08-01"
---

#### interface

interface 转换为 string

<table class=""><tbody><tr><td><strong>var</strong> x <strong>interface</strong>{} = "abc"<br>str := fmt.Sprintf("%v", x)</td></tr></tbody></table>

## 创建 error 

<table class=""><tbody><tr><td><strong>func</strong> <strong>main</strong>() {<br>&nbsp; <em>// simple string-based error</em><br>&nbsp; err1 := errors.New("math: square root of negative number")<br>&nbsp; fmt.Println(err1)<br>&nbsp; <em>// with formatting</em><br>&nbsp; x := 123<br>&nbsp; err2 := fmt.Errorf("math: square root of negative number %g", x)<br>&nbsp; fmt.Println(err2)<br>}</td></tr></tbody></table>
