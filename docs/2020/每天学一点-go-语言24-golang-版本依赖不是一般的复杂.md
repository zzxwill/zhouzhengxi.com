---
title: "每天学一点 Go 语言|24. Golang 版本依赖不是一般的复杂"
date: "2020-10-03"
tags: 
  - "golang"
---

### 复杂依赖的一些解法

Go 依赖真心复杂，看看这个

<table class=""><tbody><tr><td>➜&nbsp; /Users/zhouzhengxi/Programming/golang/src/github.com/zzxwill/kubevela git:(scale) ✗ go mod tidy<br>github.com/oam-dev/kubevela/pkg/oam imports<br>helm.sh/helm/v3/pkg/action imports<br>helm.sh/helm/v3/internal/experimental/registry imports<br>github.com/deislabs/oras/pkg/auth/docker imports<br>github.com/docker/docker/registry imports<br>github.com/docker/docker/reference imports<br>github.com/docker/distribution/digest: module github.com/docker/distribution@latest found (v2.7.1+incompatible), but does not contain package github.com/docker/distribution/digest</td></tr></tbody></table>

这个问题的原因是

<table class=""><tbody><tr><td>The digest package has been moved into OCI as github.com/opencontainers/go-digest. You will need to vendor this package with the latest distribution</td></tr></tbody></table>

cited from [Godep tool failed with error: Package (github.com/docker/distribution/digest) not found · Issue #2406 · docker/distribution](https://github.com/docker/distribution/issues/2406)

尝试过

replace github.com/docker/distribution => github.com/opencontainers/go-digest v1.0.0  

但是会提示缺少 [https://github.com/docker/distribution](https://github.com/docker/distribution) 下面的其他 package。

也尝试过使用更低的版本，该版本包含 digest，但是项目又用到了更新的 package，尴尬。。。

各种尝试而不得解决。  

跳出来，从源头看看问题。

最开始是引入 helm.sh/helm/v3/pkg/action 导致的。

看到 helm.sh/helm/v3/pkg/action 几乎是最新的版本 v3.2.4。

这么知名的项目，应该解决了这么低级的问题，看看 [https://github.com/helm/helm/blob/v3.2.4/go.mod](https://github.com/helm/helm/blob/v3.2.4/go.mod) 的 go.mod，

<table class=""><tbody><tr><td>replace (<br>github.com/Azure/go-autorest =&gt; github.com/Azure/go-autorest v13.3.2+incompatible<br>github.com/docker/distribution =&gt; github.com/docker/distribution v0.0.0-20191216044856-a8371794149d<br>)</td></tr></tbody></table>

它找了一个早起的版本，v0.0.0-20191216044856-a8371794149d，在项目的 go.mod 原样复制。

解决。  

所以，结论是，从源头开始，去看看被依赖的项目是怎么解决版本依赖问题的。
