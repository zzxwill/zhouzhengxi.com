# 每天学一点-go-语言-088-判断-map-key-是否存在

Posted on Apr. 20 2021

---

go map 里 key 不存在，不报错。

也可以线判断是否存在

```
if val, ok := dict["foo"]; ok {
    //do something here
}
```