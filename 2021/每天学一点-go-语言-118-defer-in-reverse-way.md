# 每天学一点-go-语言-118-defer-in-reverse-way.md

Posted on Sept. 3, 2021

---

多个 defer 遵循栈结构——先进后出
You can defer as many functions as you want. The defer statements run in reverse order, from last to first.

```
package main

import "fmt"

func add(x int) int {
  return x
}

func main() {
  x := 1
  defer fmt.Println(add(x))

  x = 2
  defer fmt.Println(add(x))
}
```

```
API server listening at: [::]:55052
2
1
```

