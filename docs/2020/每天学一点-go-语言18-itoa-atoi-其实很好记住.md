---
title: "每天学一点 Go 语言|18. Itoa, Atoi 其实很好记住"
date: "2020-08-25"
tags: 
  - "golang"
---

曾经在《[每天学一点 Go 语言 | 2. 类型转换](https://www.zhouzhengxi.com/2020/06/29/study-golang-every-day-2/)》里抱怨

「学习了一下 string 和 int 的转换，函数 Atoi 和 Itoa 的名字很难记住。」

其实很好记注

A：就是 Ascii，表示字符串

I：就是 Integer，表示整型

i, \_ := strconv.Atoi("123")  
fmt.Println(i)  
a := strconv.Itoa(456)  
fmt.Println(a)
