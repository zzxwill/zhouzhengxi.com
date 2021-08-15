# 每天学一点-go-语言-112-goroutine-execution-time

Posted on Aug 15, 2021

---

我发现，下面程序什么都没有打印

```
func main() {
  go func() {
     launch()
  }()
}

func launch() {
  fmt.Println("Go routine")
}
```

查了一下原因：
因为 launch 还没来得及打印，主程序就退出了。
https://stackoverflow.com/questions/42217995/why-doesnt-this-go-code-print-anything-with-a-goroutine

@xiateng 同学告诉我了本质原因：
Program execution begins by initializing the main package and then invoking the function main. When that function invocation returns, the program exits. It does not wait for other (non-main) goroutines to complete.
https://golang.org/ref/spec#Program_execution





