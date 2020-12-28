---
title: "每天学一点 Go 语言|16. 更新 slice 元素"
date: "2020-08-24"
---

更新 slice 元素

方案一：直接操作 slice 的元素

<table class=""><tbody><tr><td><strong>package</strong> main<br><br><strong>import</strong> "fmt"<br><br><strong>type</strong> Response <strong>struct</strong> {<br>&nbsp; Code <strong>int</strong> `json:"code"`<br>}<br><br><strong>func</strong> <strong>main</strong>() {<br>&nbsp; responses := []Response{{Code: 200}, {Code: 500}}<br>&nbsp; <strong>var</strong> newCode = 400<br>&nbsp; <strong>for</strong> i, _ := <strong>range</strong> responses {<br>&nbsp; &nbsp; responses[i].Code = newCode<br>&nbsp; }<br>&nbsp; fmt.Println(responses)<br>}</td></tr></tbody></table>

方案二：通过 slice 元素的指针操作  

<table class=""><tbody><tr><td><strong>package</strong> main<br><br><strong>import</strong> "fmt"<br><br><strong>type</strong> Response <strong>struct</strong> {<br>&nbsp; Code <strong>int</strong> `json:"code"`<br>}<br><br><strong>func</strong> <strong>main</strong>() {<br>&nbsp; responses := []Response{{Code: 200}, {Code: 500}}<br>&nbsp; <strong>var</strong> newCode = 400<br>&nbsp; <strong>for</strong> i, _ := <strong>range</strong> responses {<br>&nbsp; &nbsp; r := &amp;responses[i]<br>&nbsp; &nbsp; r.Code = newCode<br>&nbsp; }<br>&nbsp; fmt.Println(responses)<br>}</td></tr></tbody></table>
