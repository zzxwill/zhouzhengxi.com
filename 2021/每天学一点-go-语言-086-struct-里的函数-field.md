# 每天学一点-go-语言-086-struct-里的函数-field

Posted on Apr. 13 2021

---

Struct 里可以有函数 field
https://www.geeksforgeeks.org/function-as-a-field-in-golang-structure/

```
type Author struct {
    name  	string
    language  string
    Tarticles int
    Particles int
    Pending   func(int, int) int
}
```