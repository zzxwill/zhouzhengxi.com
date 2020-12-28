---
title: "每天学一点 Kubernetes | 7. controller-manager 不厌其烦"
date: "2020-07-09"
categories: 
  - "kubernetes"
tags: 
  - "kubernetes"
---

Kube-apiserver

做两件事情：

- 存储资源到 etcd
- 通知 client 有变更的工作

controller-manager

不断调谐，将在 spec 里的实际状态不断逼近 api 定义在 spec 的期望状态。

今日份学习笔记：[https://docs.google.com/document/d/19XbStAISCGkO\_CPTK9ACNr5lNEfPcls-2gZdYlA7tZ0/edit?usp=sharing](https://docs.google.com/document/d/19XbStAISCGkO_CPTK9ACNr5lNEfPcls-2gZdYlA7tZ0/edit?usp=sharing)
