---
title: "每天学一点 Go 语言|10. 字符串比较、拼接和 Cli 漂亮输出"
date: "2020-07-15"
---

##### case-insensitive 字符串比较

strings.EqualFold("Go", "go")

##### 字符串拼接

<table class=""><tbody><tr><td>names := []<strong>string</strong>{"Will", "Karen", "Time"}<br>fmt.Println(strings.Join(names, ", "))</td></tr></tbody></table>

## 格式化输出

### uitable

<table class=""><tbody><tr><td><strong>package</strong> main<br><br><strong>import</strong> (<br>&nbsp; "fmt"<br>&nbsp; "github.com/gosuri/uitable"<br>)<br><br><strong>type</strong> Student <strong>struct</strong> {<br>&nbsp; Name <strong>string</strong><br>&nbsp; Age <strong>int</strong><br>}<br><br><br><strong>func</strong> <strong>main</strong>() {<br>&nbsp; names := []Student{<br>&nbsp; &nbsp; {Name: "Will",<br>&nbsp; &nbsp; Age: 18},<br>&nbsp; {Name: "Kim",<br>&nbsp; &nbsp; Age: 91}}<br>&nbsp; table := uitable.New()<br>&nbsp; table.MaxColWidth = 60<br>&nbsp; table.AddRow("NAME", "AGE")<br>&nbsp; <strong>for</strong> _, n := <strong>range</strong> names {<br>&nbsp; &nbsp; table.AddRow(n.Name, n.Age)<br>&nbsp; }<br>&nbsp; fmt.Println(table.String())<br><br>}<br><br></td></tr></tbody></table>

![](images/image.png)

今日份学习笔记：[https://docs.google.com/document/d/1G2\_YBa4hZA6huGzwFHNIiYPJ2qlCMZjmieNR\_WZoJaA/edit?usp=sharing](https://docs.google.com/document/d/1G2_YBa4hZA6huGzwFHNIiYPJ2qlCMZjmieNR_WZoJaA/edit?usp=sharing)
