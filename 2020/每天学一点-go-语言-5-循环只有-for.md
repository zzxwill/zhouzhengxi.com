---
title: "每天学一点 Go 语言 | 5. 循环只有 for"
date: "2020-07-08"
categories: 
  - "golang"
---

### 流程控制——循环

只有 for，没有 while, do … while。  

<table class=""><tbody><tr><td><strong>package</strong> main<br><br><strong>import</strong> "fmt"<br><br><strong>func</strong> <strong>main</strong>() {<br><br>&nbsp; <strong>for</strong> i := 0; i &lt; 10; i += 1 {<br>&nbsp; &nbsp; fmt.Println(i)<br>&nbsp; }<br><br>&nbsp; // 这两种等价<br>&nbsp; i := 0<br>&nbsp; <strong>for</strong> i &lt; 10 {<br>&nbsp; &nbsp; fmt.Println(i)<br>&nbsp; &nbsp; i += 1<br>&nbsp; }<br><br>}</td></tr></tbody></table>

死循环

for {

  xxx

}  

今日份学习笔记：[https://docs.google.com/document/d/1G2\_YBa4hZA6huGzwFHNIiYPJ2qlCMZjmieNR\_WZoJaA/edit?usp=sharing](https://docs.google.com/document/d/1G2_YBa4hZA6huGzwFHNIiYPJ2qlCMZjmieNR_WZoJaA/edit?usp=sharing)
