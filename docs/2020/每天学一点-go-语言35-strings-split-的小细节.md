---
title: "每天学一点 Go 语言|36. strings.Split 的小细节"
date: "2020-12-01"
---

a := "abc"

b := strings.Split(a, ",")

fmt.Println(b)  

如果不含某字符，返回字符串本身
