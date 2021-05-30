# 每天学一点-go-语言-096-gzip-compress

Posted on May 30, 2021

---

```
package main

import (
  "fmt"
  v1 "k8s.io/apimachinery/pkg/apis/meta/v1"
)

func main() {
  type A struct {
     Time *v1.Time
  }
  a := A{Time: nil}
  fmt.Printf("%+v", a)
}
```

Goland/VS Code 里，run 没问题，debug 会报空指针。