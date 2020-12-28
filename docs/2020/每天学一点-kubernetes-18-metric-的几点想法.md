---
title: "每天学一点 Kubernetes | 18. Metric 的几点想法"
date: "2020-09-14"
categories: 
  - "kubernetes"
tags: 
  - "kubernetes"
---

metric 衡量指标是这样定义的：

The metric specifies which value is looked at and compared against the respective target. 

所以，包括两个方面

1\. metrics

- concorrency
- **requests-per-seconds** (rps)
- cpu

2\. target

也就是指标的值

提供 metric 的API，Kubernetes 默认有两种：

- Heapster
- Metrics Server
