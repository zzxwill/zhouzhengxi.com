---
title: "每天学一点 Kubernetes | 10. 附加/扩展组件"
date: "2020-07-15"
categories: 
  - "kubernetes"
tags: 
  - "kubernetes"
---

## 附加组件

### DNS server

有 kube-dns，阿里云采用的是 coredns

<table class=""><tbody><tr><td>k get deployment -n kube-system | grep dns<br>coredns &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 2/2 &nbsp; &nbsp; 2&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 2 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 18d</td></tr></tbody></table>

#### kube-dns

kube-dns 的 Pod 的容器里 /etc/resolv.conf 定义业务 Pod 的 dns 和 ip。  

### Ingress

Ingress 是一个类似 Nginx 的反向代理，Ingress 指向 Pod，但是流量不经过 Ingress，client 通过 Ingress 连接还会存储 ip，所以可以直接通信。
