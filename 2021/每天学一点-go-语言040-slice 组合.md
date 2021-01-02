---
title: "每天学一点-go-语言040-slice 组合.md"
date: "2021-1-2"
---


组合两个 slice，slice 相加，slice 求并集。

```go
a := []int{1, 2}
b := []int{3, 4}
a = append(a, b...)
fmt.Println(a)


[1 2 3 4]
```
