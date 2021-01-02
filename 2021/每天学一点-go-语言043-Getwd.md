---
title: "每天学一点-go-语言043-Getwd.md"
date: "2021-1-2"
---
get the current working directory

```go
func main() {
	a, _ := os.Getwd()
	fmt.Println(a)
	b, _ := filepath.Abs(".")
	fmt.Println(b)
}


/Users/zhouzhengxi/Programming/golang/src/github.com/zzxwill/try-cloudnative
/Users/zhouzhengxi/Programming/golang/src/github.com/zzxwill/try-cloudnative
```

为什么结果一样呢？

原来 `Abs` 就是基于 `os.Getwd` 实现的。

```go
func unixAbs(path string) (string, error) {
	if IsAbs(path) {
		return Clean(path), nil
	}
	wd, err := os.Getwd()
	if err != nil {
		return "", err
	}
	return Join(wd, path), nil
}
```