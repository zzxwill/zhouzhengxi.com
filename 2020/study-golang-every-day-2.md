---
title: "每天学一点 Go 语言 | 2. 类型转换"
date: "2020-06-28"
categories: 
  - "golang"
---

学习了一下 string 和 int 的转换，函数 Atoi 和 Itoa 的名字很难记住。

**package** main

**import** (  
  "fmt"  
  "strconv"  
)

**func main**() {  
_// string --> int_  
  a := "123"  
  b, err := strconv.Atoi(a)  
  fmt.Println(b, err)

_// int --> string_  
  c := strconv.Itoa(b)  
  fmt.Println(c)

_// string --> byte_  
  d := \[\]**byte**(a)  
  fmt.Println(d)

}

学习笔记在这里：[https://docs.google.com/document/d/1G2\_YBa4hZA6huGzwFHNIiYPJ2qlCMZjmieNR\_WZoJaA/edit?usp=sharing](https://docs.google.com/document/d/1G2_YBa4hZA6huGzwFHNIiYPJ2qlCMZjmieNR_WZoJaA/edit?usp=sharing)
