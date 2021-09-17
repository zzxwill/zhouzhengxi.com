# 每天学一点-go-语言-120-get-output-stderr-together

Posted on Sept. 17, 2021

---


标准输出和标准错误写到一起

```
cmd := fmt.Sprintf("cd %s && ../%s init && ../%s validate", dir, terraform, terraform)
output, _ := exec.Command("/bin/sh", "-c", cmd).CombinedOutput()
```
