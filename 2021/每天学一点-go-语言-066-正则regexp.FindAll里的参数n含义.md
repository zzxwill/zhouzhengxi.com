# 每天学一点-go-语言-066-正则regexp.FindAll里的参数n含义

Posted at Feb 4 2021

---

n 的含义

https://golang.org/pkg/regexp/#Regexp.FindAll

```go
func (re *Regexp) FindAll(b []byte, n int) [][]byte
```

官方并没有介绍，n 是指找几个，-1 代表找到所有的。

官方给了一个例子

```go
package main

import (
	"fmt"
	"regexp"
)

func main() {
	re := regexp.MustCompile(`foo.?`)
	fmt.Printf("%q\n", re.FindAll([]byte(`seafood fool`), -1))

}

```