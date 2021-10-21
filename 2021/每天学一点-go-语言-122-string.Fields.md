# 每天学一点-go-语言-122-string.Fields

Posted on Oct. 21, 2021

---

Fields

按空格分割字符串

```
fields = strings.Fields(line)
if len(fields) == 0 {
  continue
}
if !(len(fields) == 3 && fields[1] == "Available") {
  return false
}


```