---
title: "每天学一点 Kubernetes | 9. Node 上有啥玩意儿？"
date: "2020-07-13"
categories: 
  - "kubernetes"
tags: 
  - "kubernetes"
---

## Node 上组件

### Kubelet

Kubelet 可以抛开 Kube-Apiserver 直接运行 Pod 的 manifest。  

### kube-proxy

两种模式：

- 代理服务器，kube-proxy 作为代理，轮训后端 Pod，比较均衡，但是需要经过用户态
- iptables 直接代理，随机选择 Pod，不经过用户态，更高效。

今日份学习笔记：[https://docs.google.com/document/d/19XbStAISCGkO\_CPTK9ACNr5lNEfPcls-2gZdYlA7tZ0/edit?usp=sharing](https://docs.google.com/document/d/19XbStAISCGkO_CPTK9ACNr5lNEfPcls-2gZdYlA7tZ0/edit?usp=sharing)
