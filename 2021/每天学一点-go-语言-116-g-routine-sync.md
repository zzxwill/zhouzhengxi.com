# 每天学一点-go-语言-116-g-routine-sync.md

Posted on Aug 22, 2021

---

goroutine 等待：sync.WaitGroup

除了使用 channel，sync.WaitGroup 也是一种等待所有 goroutine 执行的方法。


```
import (
  "fmt"
  "sync"
)

var wg sync.WaitGroup

func main() {
  wg.Add(1)
  go print()
  wg.Wait()
}

func print() {
  defer wg.Done()
  fmt.Println("Go routine")
}

```

wg.Add(N)，N 是需要等待的 gorountine 的个数，必须不多不少

