# 每天学一点-go-语言-087-interface-to-string

Posted on Apr. 19 2021

---

interface{} to string

```
var x interface{} = "abc"
str := fmt.Sprintf("%v", x)
```