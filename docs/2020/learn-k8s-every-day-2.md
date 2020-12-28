---
title: "每天学一点 Kubernetes | 2. etcdctl 访问出错。"
date: "2020-06-27"
categories: 
  - "cloudnative"
  - "kubernetes"
tags: 
  - "kubernetes"
---

通过 etcdctl 访问 etcd 存储信息。

Kubernetes 证书存储在 /etc/kubernetes/pki，获取 etcd 证书，访问报错。

<table class=""><tbody><tr><td>[root@iZj6caygpm6zxzkyfd39izZ etcd]# pwd<br>/etc/kubernetes/pki/etcd<br>[root@iZj6caygpm6zxzkyfd39izZ etcd]# pwd<br>/etc/kubernetes/pki/etcd<br>[root@iZj6caygpm6zxzkyfd39izZ etcd]# ll<br>total 12<br>-rw-r--r-- 1 root root 1119 Jun 27 18:21 ca.pem<br>-rw------- 1 root root 1679 Jun 27 18:21 etcd-client-key.pem<br>-rw-r--r-- 1 root root 1188 Jun 27 18:21 etcd-client.pem<br>[root@iZj6caygpm6zxzkyfd39izZ etcd]# etcdctl --endpoints https://10.0.1.224:6443 --cert etcd-client.pem --cacert ca.pem --key etcd-client-key.pem&nbsp; get /registry<br>{"level":"warn","ts":"2020-06-28T01:16:52.867+0800","caller":"clientv3/retry_interceptor.go:61","msg":"retrying of unary invoker failed","target":"endpoint://client-7b7123b8-6e0a-4b1d-a999-e77bec131c81/10.0.1.224:6443","attempt":0,"error":"rpc error: code = DeadlineExceeded desc = latest connection error: connection error: desc = \"transport: authentication handshake failed: x509: certificate signed by unknown authority\""}<br>Error: context deadline exceeded</td></tr></tbody></table>

还没搞清楚出错原因。

今日 Kubernetes 学习笔记：https://docs.google.com/document/d/19XbStAISCGkO\_CPTK9ACNr5lNEfPcls-2gZdYlA7tZ0/edit?usp=sharing
