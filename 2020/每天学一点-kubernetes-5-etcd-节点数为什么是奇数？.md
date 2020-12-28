---
title: "每天学一点 Kubernetes | 5. etcd 节点数为什么是奇数？"
date: "2020-07-07"
categories: 
  - "kubernetes"
tags: 
  - "kubernetes"
---

《Kubernetes in Action》说「 2 节点比 1 节点宕机概率增加了 100%」。

这个应该是胡说八道吧。2 节点挂掉一个节点，就退化到 1 个节点模式，还可以工作；1 节点挂了一个节点就彻底挂了。

问题的核心应该是偶数节点在选举是，如果出现对半分的 case，会出现脑裂，无法找到「大多数」，从而无法更新对象状态。  

今日份学习笔记：[https://docs.google.com/document/d/19XbStAISCGkO\_CPTK9ACNr5lNEfPcls-2gZdYlA7tZ0/edit?usp=sharing](https://docs.google.com/document/d/19XbStAISCGkO_CPTK9ACNr5lNEfPcls-2gZdYlA7tZ0/edit?usp=sharing)
