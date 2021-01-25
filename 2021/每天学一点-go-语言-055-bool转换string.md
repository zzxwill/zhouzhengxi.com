# 每天学一点-go-语言-055-bool转换string

Posted at Jan 21 2021

---

`strconv.FormatBool` 实现 bool → string

也可以通过 fmt.Sprint(“%t”, isSuccess) 转换，不过效率不及 FormatBool


