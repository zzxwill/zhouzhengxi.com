# Learn-a-little-golang-everyday-127-go.sum

Posted on Nov. 15, 2021

---

The dependency of go package is as below:

github.com/oam-dev/terraform-controller --> github.com/aliyun/alibaba-cloud-sdk-go --> github.com/jmespath/go-jmespath

Here is a bug in package github.com/jmespath/go-jmespath https://github.com/oam-dev/terraform-controller/issues/167.

I forked github.com/jmespath/go-jmespath and github.com/aliyun/alibaba-cloud-sdk-go into org `cloud-native-application`.

In go.mod of package `terraorm-controller`, I made the following modification:

```go
github.com/aliyun/alibaba-cloud-sdk-go v1.61.1318 => github.com/cloud-native-application/alibaba-cloud-sdk-go v1.61.9999
```

I was astonished to find this repo still depended package `github.com/jmespath/go-jmespath`.

```shell
➜ grep alibaba-cloud-sdk-go go.mod
	github.com/aliyun/alibaba-cloud-sdk-go v1.61.1318
replace github.com/aliyun/alibaba-cloud-sdk-go v1.61.1318 => github.com/cloud-native-application/alibaba-cloud-sdk-go v1.61.9999

➜ go mod graph | grep github.com/jmespath/go-jmespath
github.com/aliyun/alibaba-cloud-sdk-go@v1.61.1318 github.com/jmespath/go-jmespath@v0.0.0-20180206201540-c2b33e8439af
```

Then I find this is not the right solution. We can solve the dependency problem by directly adding `github.com/jmespath/go-jmespath`
in this repo.

```
replace (
	github.com/jmespath/go-jmespath v0.0.0-20180206201540-c2b33e8439af => github.com/cloud-native-application/go-jmespath v0.5.0
)
```

It also shows `go mod tidy` will NOT search dependency of replaced package.