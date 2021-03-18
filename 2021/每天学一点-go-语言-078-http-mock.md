# 每天学一点-go-语言-078-http-mock

Posted on Mar 18 2021

---

net
http
httptest

```go

testServer := httptest.NewServer(http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
fmt.Fprintln(w, ResponseString)
}))
defer testServer.Close()

```

可以创建一个 Mock http server，多用于 unit-test 中以来 http server 的 case。

为什么不起一个真是的 http server，因为 http.ListenAndServe 会 block 后面的测试任务。
