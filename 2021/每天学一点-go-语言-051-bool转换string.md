# 每天学一点-go-语言-050-bool转换string

Posted at Jan 18 2021

---

strconv.FormatBool

bool → string
也可以通过 `fmt.Sprint(“%t”, isSuccess)` 转换，不过效率不及 `FormatBool`。
