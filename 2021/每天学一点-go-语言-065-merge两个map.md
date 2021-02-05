# 每天学一点-go-语言-065-merge两个map.md

Posted at Feb 4 2021

---

没有内置的方法可以实现，利用一个 [map 循环](./每天学一点-go-语言-064-map循环遍历.md)，把元素一个个加到另外一个 map 里。

```go
for k, v := range b {
    a[k] = v
}
```
