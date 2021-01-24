# 每天学一点-go-语言-054-当map的key不存在.md

Posted at Jan 22 2021

---


本来想找找 Golang 各个版本被采用的情况，找到使用率最高的三个版本，优先支持做 S2I (Source to Image)，但是找不到。
Golang 年度 Survey 里也没有 https://blog.golang.org/survey2019-results

不过 [Golang release](https://golang.org/doc/devel/release.html) 说：

> Each major Go release is supported until there are two newer major releases. For example, Go 1.5 was supported until
> the Go 1.7 release, and Go 1.6 was supported until the Go 1.8 release. We fix critical problems, including critical
> security problems, in supported releases as needed by issuing minor revisions (for example, Go 1.6.1, Go 1.6.2,
> and so on).

那么，支持最近的三个版本即可。