# 每天学一点-go-语言-058-exec输出

Posted at Jan 25 2021

---

exec.Command

```go
cmd := exec.Command("go version")
output, err := cmd.Output()
```

这个是同步输出，如果需要异步输出，可以参考[每天学一点-go-语言044-实时打印命令行结果](./每天学一点-go-语言044-实时打印命令行结果.md)
