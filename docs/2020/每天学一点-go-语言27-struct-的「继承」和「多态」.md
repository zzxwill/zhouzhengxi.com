---
title: "每天学一点 Go 语言|27. Struct 的「继承」和「多态」"
date: "2020-10-11"
categories: 
  - "golang"
tags: 
  - "golang"
---

有时候需要复用一个 struct 大部分字段，并且，还需要覆盖或增加部分字段。

<table class=""><tbody><tr><td><strong>package</strong> main<br><br><strong>import</strong> "fmt"<br><br><strong>type</strong> Student <strong>struct</strong> {<br>&nbsp; Name &nbsp; <strong>string</strong> `json:"name"`<br>&nbsp; Gender <strong>string</strong> `json:"gender"`<br>}<br><br><strong>type</strong> ForeignStudent <strong>struct</strong> {<br>&nbsp; Student<br>&nbsp; Name&nbsp; &nbsp; <strong>string</strong> `json:"name"`<br>&nbsp; Country <strong>string</strong> `json:"country"`<br>}<br><br><strong>func</strong> <strong>main</strong>() {<br>&nbsp; f := ForeignStudent{<br>&nbsp; &nbsp; Student: Student{<br>&nbsp; &nbsp; &nbsp; &nbsp; Name: &nbsp; "King",<br>&nbsp; &nbsp; &nbsp; &nbsp; Gender: "female",<br>&nbsp; &nbsp; },<br>&nbsp; &nbsp; Name:&nbsp; &nbsp; "MacDonald",<br>&nbsp; &nbsp; Country: "North Korean",<br>&nbsp; }<br>&nbsp; fmt.Println(f.Name)<br>&nbsp; fmt.Println(f.Student.Name)<br>&nbsp; fmt.Printf("Gender: %s", f.Gender)<br>}</td></tr></tbody></table>
