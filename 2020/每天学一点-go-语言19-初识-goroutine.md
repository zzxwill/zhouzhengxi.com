---
title: "每天学一点 Go 语言|19. 初识 goroutine"
date: "2020-08-27"
---

**package** main

**import** (  
  "fmt"  
  "time"  
)

**func****main**() {  
_//var ch chan int_  
**var** ch = make(**chan****int**, 1024)  
  ch <- 1  
  ch <- 2

**for** {  
    fmt.Println(<-ch)  
    time.Sleep(3 \* time.Second)  
  }  
}

\# result  
1  
2  
fatal error: all goroutines are asleep - deadlock!
