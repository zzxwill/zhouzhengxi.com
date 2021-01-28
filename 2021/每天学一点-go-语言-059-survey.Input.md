# 每天学一点-go-语言-059-survey.Input

Posted at Jan 26 2021

---

survey.Input

创建一个输入交互



```go
prompt := &survey.Input{
Message: "Please input image name with tag (such as \"registry.com/user/repo:tag\"): ",
}
err := survey.AskOne(prompt, &image, survey.WithValidator(survey.Required))
```

input.Select 可以创建一个多选一的交互