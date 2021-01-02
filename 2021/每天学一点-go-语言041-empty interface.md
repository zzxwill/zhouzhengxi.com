---
title: "每天学一点-go-语言041-empty interface.md"
date: "2021-1-2"
---

empty interface

不带任何方法的 interface，被称为 empty interface，所有数据类型都实现了 empty interface。

```go
// Println formats using the default formats for its operands and writes to standard output.
// Spaces are always added between operands and a newline is appended.
// It returns the number of bytes written and any write error encountered.
func Println(a ...interface{}) (n int, err error) {
    return Fprintln(os.Stdout, a...)
}
```

所以，fmt.Println() 可以接受各种数据类型。
