# 每天学一点-go-语言-102-no-pointer-in-loop

Posted on Jun 8, 2021

---

指针

循环里的函数不要传入指针

```
references/plugins/references.go:427:64: G601: Implicit memory aliasing in for loop. (gosec)
refContent, err = ref.GenerateTerraformCapabilityProperties(&c)
```
