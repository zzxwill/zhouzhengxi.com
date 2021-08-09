# 每天学一点-go-语言-109-time-elapse

Posted on Aug 9, 2021

---

time.Since()

```go
start := time.Now()
elapsed := time.Since(start)
fmt.Printf("Done! It took %v seconds!\n", elapsed.Seconds())
```

