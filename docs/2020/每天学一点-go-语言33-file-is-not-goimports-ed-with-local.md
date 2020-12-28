---
title: "每天学一点 Go 语言|33. File is not `goimports`-ed with -local"
date: "2020-11-23"
categories: 
  - "golang"
tags: 
  - "golang"
---

这是一个常见错误：

>   
> 18:55:56 \[ .. \] golangci-lint  
> test/e2e-test/traits\_conflict\_test.go:6: File is not \`goimports\`-ed with -local github.com/crossplane/oam-kubernetes-runtime (goimports)  
> "github.com/crossplane/oam-kubernetes-runtime/apis/core/v1alpha2"  
> "github.com/crossplane/oam-kubernetes-runtime/pkg/oam"  
> 18:55:58 \[FAIL\]  
> make\[1\]: \*\*\* \[go.lint\] Error 1  
> make: \*\*\* \[lint\] Error 2  
>   

粗暴修复：

fix: golangci-lint run --fix
