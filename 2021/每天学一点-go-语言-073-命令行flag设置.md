# 每天学一点-go-语言-073-命令行 flag 设置

Posted on Feb 24 2021

---

flag 设置

通过 cmd.Flags().StringVarP 相比 cmd.Flags().StringP ，命令行效果一致，但是取值更方便


```go
cmd.Flags().StringVarP(&dockerImage, "image", "i", "", "The image and its tag which will be built")
```

```shell

✗ go run main.go init -h
Detect application's platform and compile the application

Usage:
derrick init [flags]

Aliases:
init, ini

Examples:
derrick init

Flags:
-d, --debug string          debug mod
-h, --help                  help for init
-i, --image string          The image and its tag which will be built
-p, --project-path string   Path of a project which is about to be detected
-t, --test string           Just a test
```
