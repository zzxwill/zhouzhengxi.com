# 每天学一点-go-语言-089-regexp-Match

Posted on Apr. 27 2021

---


```
matched, err := regexp.Match(regexp.QuoteMeta(utils.K8sSecretSchemaTag), []byte(wl.Template))
```

QuoteMeta
可以 escape 特殊字符，比如 `+abc` 中的 `+`
