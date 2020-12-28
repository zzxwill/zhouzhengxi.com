---
title: "每天学一点 Kubernetes | 8. endpoint/namespace controller"
date: "2020-07-12"
categories: 
  - "kubernetes"
tags: 
  - "kubernetes"
---

#### Endpoint controller

ip:port 列表

比如：

<table class=""><tbody><tr><td>✗ k get endpoints kubernetes<br>NAME &nbsp; &nbsp; &nbsp; &nbsp; ENDPOINTS &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; AGE<br>kubernetes &nbsp; 10.0.1.224:6443,10.0.1.225:6443,10.0.1.226:6443 &nbsp; 15d</td></tr></tbody></table>

<table class=""><tbody><tr><td>✗ k get endpoints kubernetes -o yaml<br>apiVersion: v1<br>kind: Endpoints<br>metadata:<br>&nbsp; creationTimestamp: "2020-06-27T10:22:22Z"<br>&nbsp; name: kubernetes<br>&nbsp; namespace: default<br>&nbsp; resourceVersion: "796"<br>&nbsp; selfLink: /api/v1/namespaces/default/endpoints/kubernetes<br>&nbsp; uid: 3139989f-a6c9-4289-9a59-93bfcc2256d1<br>subsets:<br>- addresses:<br>&nbsp; - ip: 10.0.1.224<br>&nbsp; - ip: 10.0.1.225<br>&nbsp; - ip: 10.0.1.226<br>&nbsp; ports:<br>&nbsp; - name: https<br>&nbsp; &nbsp; port: 6443<br>&nbsp; &nbsp; protocol: TCP</td></tr></tbody></table>

#### namespace controller

删除一个 namespace，该空间所有资源都会被删除。(根据实际情况，有问题！)  

今日份学习笔记：https://docs.google.com/document/d/19XbStAISCGkO\_CPTK9ACNr5lNEfPcls-2gZdYlA7tZ0/edit?usp=sharing
