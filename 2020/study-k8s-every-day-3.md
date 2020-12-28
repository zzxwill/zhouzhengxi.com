---
title: "每天学一点 Kubernetes | 3. etcdctl 操作 etcd"
date: "2020-06-28"
categories: 
  - "cloudnative"
  - "kubernetes"
tags: 
  - "kubernetes"
---

解决了[每天学一点 Kubernetes | 2. etcdctl 访问出错](https://www.zhouzhengxi.com/2020/06/28/learn-k8s-every-day-2/)，犯了一个很二的错误，etcdctl 的 endpoint 设置为了 api-server 的 endpoint，因为 etcd endpoint 没有暴露公网 ip，所以需要在 node 上操作，比如 master node。

\[root@iZj6c1wvscj5y15w2bez9eZ etcd\]# ETCDCTL\_API=3 etcdctl --endpoints 192.168.0.186:2379 --cert etcd-client.pem --cacert ca.pem --key etcd-client-key.pem put poc-name Will  
OK  
\[root@iZj6c1wvscj5y15w2bez9eZ etcd\]#  
\[root@iZj6c1wvscj5y15w2bez9eZ etcd\]# ETCDCTL\_API=3 etcdctl --endpoints 192.168.0.186:2379 --cert etcd-client.pem --cacert ca.pem --key etcd-client-key.pem get poc-name  
poc-name  
Will

顺便了解了一下 Kubernetes 证书基础知识，比如一下三个 CA 都是顶级 CA 证书。

<table class=""><tbody><tr><td><strong>path</strong></td><td><strong>Default CN</strong></td><td><strong>description</strong></td></tr><tr><td>ca.crt,key</td><td>kubernetes-ca</td><td>Kubernetes general CA</td></tr><tr><td>etcd/ca.crt,key</td><td>etcd-ca</td><td>For all etcd-related functions</td></tr><tr><td>front-proxy-ca.crt,key</td><td>kubernetes-front-proxy-ca</td><td>For the <a href="https://kubernetes.io/docs/tasks/extend-kubernetes/configure-aggregation-layer/">front-end proxy</a><br></td></tr></tbody></table>

今日 Kubernetes 学习笔记：[https://docs.google.com/document/d/19XbStAISCGkO\_CPTK9ACNr5lNEfPcls-2gZdYlA7tZ0/edit?usp=sharing](https://docs.google.com/document/d/19XbStAISCGkO_CPTK9ACNr5lNEfPcls-2gZdYlA7tZ0/edit?usp=sharing)
