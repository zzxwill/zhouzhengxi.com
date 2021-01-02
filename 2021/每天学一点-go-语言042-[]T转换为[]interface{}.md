---
title: "每天学一点-go-语言042-empty interface.md"
date: "2021-1-2"
---

[]T 转换为 []interface{}

>Not directly. It is disallowed by the language specification because the two types do not have the same representation in memory. It is necessary to copy the elements individually to the destination slice. This example converts a slice of int to a slice of interface{}:

```go
t := []int{1, 2, 3, 4}
s := make([]interface{}, len(t))
for i, v := range t {
    s[i] = v
}
```

https://golang.org/doc/faq#convert_slice_of_interface
