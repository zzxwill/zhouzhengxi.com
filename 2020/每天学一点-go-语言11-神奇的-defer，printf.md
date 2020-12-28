---
title: "每天学一点 Go 语言|11. 神奇的 defer，printf"
date: "2020-07-17"
---

#### defer

多个 defer 遵循栈结构——先进后出

<table class=""><tbody><tr><td><strong>package</strong> main<br><br><strong>import</strong> "fmt"<br><br><strong>func</strong> <strong>add</strong>(x <strong>int</strong>) <strong>int</strong> {<br>&nbsp; <strong>return</strong> x<br>}<br><br><strong>func</strong> <strong>main</strong>() {<br>&nbsp; x := 1<br>&nbsp; <strong>defer</strong> fmt.Println(add(x))<br><br>&nbsp; x = 2<br>&nbsp; <strong>defer</strong> fmt.Println(add(x))<br>}<br><br><br>API server listening at: [::]:5505221<br></td></tr></tbody></table>

### print vs fmt.print()

println is an built-in function (into the runtime) which may eventually be removed, while the fmt package is in the standard library, which will persist. See [the spec](http://golang.org/ref/spec#Bootstrapping) on that topic.quoted from: [https://stackoverflow.com/questions/14680255/difference-between-fmt-println-and-println-in-go](https://stackoverflow.com/questions/14680255/difference-between-fmt-println-and-println-in-go)

今日份学习笔记：https://docs.google.com/document/d/1G2\_YBa4hZA6huGzwFHNIiYPJ2qlCMZjmieNR\_WZoJaA/edit?usp=sharing
