---
title: "OAM 社区会议总结 – 2020.6.16"
date: "2020-06-16"
categories: 
  - "cloudnative"
tags: 
  - "kubernetes"
  - "oam"
  - "第四范式"
---

## Agenda

[https://shimo.im/docs/w8CgdyYGWjtYJ3XP](https://shimo.im/docs/w8CgdyYGWjtYJ3XP)

## 参会同学

第四范式、凯京科技、满帮、云星数据、优维科技、携程、蚂蚁、阿里云

## 议题

### 第四范式 OAM 实践

第四范式深度实践了 OAM v1alpha1 到 v1alpha2，其在内部遇到了两套独立的业务系统的管理、交付和运维，为了解决这个问题，使用 OAM 做了更上层的抽象。Zhang Hao 同学讲到了一句很著名的话：

> All problems in computer science can be solved by another level of indirection

![Abstraction is a communication tool](https://image.slidesharecdn.com/abstractionisacommunicationtool-150807024009-lva1-app6891/95/abstraction-is-a-communication-tool-6-638.jpg?cb=1438915399)

计算机科学家 David 说：软件开发中遇到的所有问题，都可以通过增加一层抽象而得以解决

很抱歉，我是第一次听，有道理。

另外，第四范式的业务场景里也在解决 component 之间的依赖问题，关于依赖问题是应该有平台来解决还是应用来解决，我们有各自的看法。

> 按照 Kubernetes 应用开发和企业级应用开发的规范，可自愈/幂等 是最基本的要求，如果应用的依赖（比如 db）没有好，这个应用就应该：
> 
> \- 死循环等待依赖 ready
> 
> 或
> 
> \- 检查依赖是否满足，不满足退出，由 k8s 或调度系统拉起来继续检查依赖
> 
> 举一个极端（实际也发生过）例子：OAM 给应用申请的 db，应用开始初始化，但是现实的环境很复杂，可能因为网络或未知异常，db 其实不可用，应用失败。这时候，OAM 貌似做不了什么，或者根据应用的健康状态再重新使其初始化？如果这个应用还被其他应用依赖，这个链路就会出现一些真实状态与实际状态不一致，OAM 要处理的场景就比较复杂。
> 
> 从根本上来说，应该应用自己去解决依赖的问题，OAM 只负责在某一个时机把依赖的数据给应用，至于数据代表的服务是否满足，需要应用自己去解决。

最后，比较一致的意见：

平台解决依赖数据的传递；应用自身校验数据可用性，包括自愈和幂等问题。

## OAM 上游社区进展

- \[Appvoed\] Component 版本化机制

[105 次讨论](https://github.com/crossplane/oam-kubernetes-runtime/pull/29)

[https://github.com/crossplane/oam-kubernetes-runtime/blob/master/design/one-pager-component-mutable-and-versioning.md](https://github.com/crossplane/oam-kubernetes-runtime/blob/master/design/one-pager-component-mutable-and-versioning.md)

- \[Appvoed\] ApplicationConfiguration 内部 component 依赖  
    [77 次讨论](https://github.com/crossplane/oam-kubernetes-runtime/pull/24)

[https://github.com/crossplane/oam-kubernetes-runtime/blob/master/design/resource-dependency.md](https://github.com/crossplane/oam-kubernetes-runtime/blob/master/design/resource-dependency.md)

- workloads and traits catelog

[https://github.com/oam-dev/catalog](https://github.com/oam-dev/catalog)

欢迎试用和贡献

## Zoom 吐槽

本次会议后半部分，又发生无法分享桌面、讲话声音听不到的问题，体验很糟糕。
