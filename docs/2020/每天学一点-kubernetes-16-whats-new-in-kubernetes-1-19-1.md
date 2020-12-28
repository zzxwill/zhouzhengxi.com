---
title: "每天学一点 Kubernetes | 16. What’s new in Kubernetes 1.19 (1)"
date: "2020-08-31"
categories: 
  - "kubernetes"
tags: 
  - "kubernetes"
---

### Scheduler

- run multiple scheduling profiles

一个 scheduler 可以支持多个 profile，而不用每个 profile 一个 scheduler，从而造成 race condition  

### Storage

- Storage Capacity Tracking

可以支持磁盘容量调度了
