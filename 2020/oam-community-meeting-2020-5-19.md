---
title: "OAM 社区会议总结 - 2020.5.19"
date: "2020-05-20"
categories: 
  - "cloudnative"
tags: 
  - "cloudnative"
  - "kubernetes"
  - "oam"
---

## # agenda 和记录

本次会议 agenda 和记录在石墨文档，[https://shimo.im/docs/w8CgdyYGWjtYJ3XP](https://shimo.im/docs/w8CgdyYGWjtYJ3XP)，特别好用。  
想到 OpenStack 社区，一般使用 [https://etherpad.opendev.org/](https://etherpad.opendev.org/)，也不错，因为基于匿名，文档组织会差不少。

## 参会同学

阿里、腾讯、青云、运满满、政府行业（财政）等

## \# 议题

- Traint 与 Component 的交互

[https://github.com/crossplane/oam-kubernetes-runtime/pull/23](https://github.com/crossplane/oam-kubernetes-runtime/pull/23)

目前社区里 traint 和 component 还是强绑定关系，这个议题主要是通过一定的定义约束，解决 traint 自动发现 component（workload） 的机制，解耦二者。初次接触，还没完全理解，继续学习。  
其中，提到了概念 GVK，这篇文章（[https://liqiang.io/post/kubernetes-all-about-crd-part02-api-server-and-gvkr-dc53e1f1](https://liqiang.io/post/kubernetes-all-about-crd-part02-api-server-and-gvkr-dc53e1f1)）有非常好的解释。

![](http://images.liuliqiang.info/2019/11/24/02/25/56/d14b874da710/)

- Component实例化

[https://github.com/oam-dev/spec/issues/350](https://github.com/oam-dev/spec/issues/350)[https://github.com/oam-dev/spec/pull/356](https://github.com/oam-dev/spec/pull/356)

解决 component 更新的版本问题。

- Component依赖

[https://github.com/crossplane/oam-kubernetes-runtime/pull/24/files](https://github.com/crossplane/oam-kubernetes-runtime/pull/24/files)

通过 datainputs 和 dataoutput 解决同一个 ApplicationConfiguration 内部的应用间数据依赖问题。
