---
title: "每天学一点 Kubernetes | 11. events"
date: "2020-07-17"
categories: 
  - "kubernetes"
tags: 
  - "kubernetes"
---

#### events

<table class=""><tbody><tr><td>$ k get event --watch<br>LAST SEEN &nbsp; TYPE &nbsp; &nbsp; REASON &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; OBJECT &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; MESSAGE<br>2m14s &nbsp; &nbsp; &nbsp; Normal &nbsp; RenderedComponents &nbsp; applicationconfiguration/app &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Successfully rendered components<br>2m57s &nbsp; &nbsp; &nbsp; Normal &nbsp; RenderedComponents &nbsp; applicationconfiguration/poc &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Successfully rendered components<br>3m9s&nbsp; &nbsp; &nbsp; &nbsp; Normal &nbsp; RenderedComponents &nbsp; applicationconfiguration/poc07171448 &nbsp; Successfully rendered components<br>0s&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Normal &nbsp; RenderedComponents &nbsp; applicationconfiguration/poc07172332 &nbsp; Successfully rendered components<br>0s&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Normal &nbsp; AppliedComponents&nbsp; &nbsp; applicationconfiguration/poc07172332 &nbsp; Successfully applied components<br>0s&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Normal &nbsp; RenderedComponents &nbsp; applicationconfiguration/poc07172332 &nbsp; Successfully rendered components<br>0s&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Normal &nbsp; AppliedComponents&nbsp; &nbsp; applicationconfiguration/poc07172332 &nbsp; Successfully applied components</td></tr></tbody></table>

Deployment controller、ReplicaSet controller、Kube-scheduler 都会监听 Kube-apiserver 的事件，做相应的处理。
