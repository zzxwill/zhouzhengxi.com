# 每天学一点-go-语言-123-errors-As

Posted on Nov. 10, 2021

---

```
output, err := exec.Command("bash", "-c", "/tmp/vela addon enable terraform").Output()
var ee *exec.ExitError
if errors.As(err, &ee) {
  fmt.Println("exit code error:", string(ee.Stderr))
}

```

eexec.Command("bash", "-c", "/tmp/vela addon enable terraform").Output() 返回的 error 是高层 error，可以通过 `As` 方法，获取更底层的 error。