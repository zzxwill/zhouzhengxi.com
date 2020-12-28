---
title: "每天学一点 Go 语言|20. 引用其他包的 struct 作为 type"
date: "2020-08-31"
tags: 
  - "golang"
---

### 引用其他包的 struct

**type** Student = k8s.Student  

<table class=""><tbody><tr><td><strong>package</strong> k8s<br><br><strong>import</strong> (<br>&nbsp; "fmt"<br>)<br><br><strong>type</strong> Student <strong>struct</strong> {<br>&nbsp; Name <strong>string</strong><br>&nbsp; Age&nbsp; <strong>int</strong><br>}</td></tr></tbody></table>

<table class=""><tbody><tr><td><strong>package</strong> main<br><br><strong>import</strong> (<br>&nbsp; "fmt"<br><br>&nbsp; "github.com/zzxwill/homework/k8s"<br>)<br><br><strong>type</strong> Student = k8s.Student<br><br><strong>func</strong> <strong>main</strong>() {<br>&nbsp; s := Student{<br>&nbsp; &nbsp; Name: "Will",<br>&nbsp; &nbsp; Age:&nbsp; 18,<br>&nbsp; }<br>&nbsp; fmt.Println(s)<br>}</td></tr></tbody></table>
