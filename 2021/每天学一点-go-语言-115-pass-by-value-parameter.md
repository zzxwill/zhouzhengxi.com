# 每天学一点-go-语言-115-pass-by-value-parameter

Posted on Aug 19, 2021

---

参数 parameter
pass by value 参数

When you pass a value to a function, every change in that function won't affect the caller. Go is a "pass by value" programming language. This means that whenever you pass a value to a function, Go takes that value and creates a local copy (a new variable in memory). Changes you make to that variable in the function don't affect the one you sent to the function.