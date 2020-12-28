---
title: "每天学一点 Go 语言|26. make"
date: "2020-10-11"
categories: 
  - "golang"
tags: 
  - "golang"
---

# [How does “make” app know default target to build if no target is specified?](https://stackoverflow.com/questions/2057689/how-does-make-app-know-default-target-to-build-if-no-target-is-specified)

Calling the first target all is just a convention.   

for example

<table class=""><tbody><tr><td><strong>all: build</strong><br><br><em># Run tests</em><br><strong>test: fmt vet lint</strong><br>&nbsp; go test ./pkg/... -coverprofile cover.out</td></tr></tbody></table>

只执行 make 命令，就是去找 all，然后就知道真正的命令是什么，如上面就是 make build。
