---
title: "每天学一点 Kubernetes | 6. kube-scheduler 可以有多个"
date: "2020-07-08"
categories: 
  - "kubernetes"
tags: 
  - "kubernetes"
---

一个集群中可以配置多个调度器，Pod 里通过 schedulerName 来指定。

<table class=""><tbody><tr><td>apiVersion: v1<br>kind: Pod<br>metadata:<br>&nbsp; name: annotation-default-scheduler<br>&nbsp; labels:<br>&nbsp; &nbsp; name: multischeduler-example<br>spec:<br>&nbsp; schedulerName: default-scheduler<br>&nbsp; containers:<br>&nbsp; - name: pod-with-default-annotation-container<br>&nbsp; &nbsp; image: k8s.gcr.io/pause:2.0</td></tr></tbody></table>

今日份学习笔记：[https://docs.google.com/document/d/19XbStAISCGkO\_CPTK9ACNr5lNEfPcls-2gZdYlA7tZ0/edit?usp=sharing](https://docs.google.com/document/d/19XbStAISCGkO_CPTK9ACNr5lNEfPcls-2gZdYlA7tZ0/edit?usp=sharing)
