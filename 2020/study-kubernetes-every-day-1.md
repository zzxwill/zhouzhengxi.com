---
title: "每天学一点 Kubernetes | 1. 一键查看控制面组件"
date: "2020-06-26"
categories: 
  - "kubernetes"
tags: 
  - "cloudnative"
  - "kubernetes"
---

通过 ComponentStatus 可以获取所有控制平面组件。

> ✗ k get ComponentStatus NAME                 AGE controller-manager   <unknown> scheduler            <unknown> etcd-1               <unknown> etcd-0               <unknown> etcd-2               <unknown>

不过，没有 api-server。

今日 Kubernetes 学习笔记：https://docs.google.com/document/d/19XbStAISCGkO\_CPTK9ACNr5lNEfPcls-2gZdYlA7tZ0/edit?usp=sharing
