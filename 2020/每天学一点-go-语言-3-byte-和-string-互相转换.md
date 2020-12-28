---
title: "每天学一点 Go 语言 | 3. []byte 和 string 互相转换"
date: "2020-07-02"
categories: 
  - "golang"
tags: 
  - "golang"
---

**package** main  
  
**import** (  
  "fmt"  
)  
  
**func** **main**() {  
  
  _// byte --> string_  
  data1 := \[4\]**byte**{0x31, 0x32, 0x33, 0x34}  
  str1 := **string**(data1\[:\])  
  fmt.Println(str1)  
  
  data2 := \[2\]**byte**{'a', 'b'}  
  str2 := **string**(data2\[:\])  
  fmt.Println(str2)  
  
  _// string --> byte_  
  str := "abc"  
  data := \[\]**byte**(str)  
  fmt.Println(data)  
  
  
}  

1234

ab

\[97 98 99\]  

今日学习笔记：[https://docs.google.com/document/d/1G2\_YBa4hZA6huGzwFHNIiYPJ2qlCMZjmieNR\_WZoJaA/edit?usp=sharing](https://docs.google.com/document/d/1G2_YBa4hZA6huGzwFHNIiYPJ2qlCMZjmieNR_WZoJaA/edit?usp=sharing)
