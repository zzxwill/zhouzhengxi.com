---
title: "每天学一点 Kubernetes | 19. kubectl run 不能创建 deploymen 了"
date: "2020-09-15"
categories: 
  - "kubernetes"
tags: 
  - "kubernetes"
---

kubectl 1.16，kubectl run 可以创建 deployment  

<table class=""><tbody><tr><td>[root@iZ2zebdp4vm2jvwggk2oj5Z ~]# kubectl version<br>Client Version: version.Info{Major:"1", Minor:"16+", GitVersion:"v1.16.9-aliyun.1", GitCommit:"4f7ea78", GitTreeState:"", BuildDate:"2020-05-08T07:35:38Z", GoVersion:"go1.13.9", Compiler:"gc", Platform:"linux/amd64"}<br>Server Version: version.Info{Major:"1", Minor:"16+", GitVersion:"v1.16.9-aliyun.1", GitCommit:"4f7ea78", GitTreeState:"", BuildDate:"2020-05-08T07:29:59Z", GoVersion:"go1.13.9", Compiler:"gc", Platform:"linux/amd64"}<br>[root@iZ2zebdp4vm2jvwggk2oj5Z ~]# kubectl run php-apache --image=k8s.gcr.io/hpa-example --requests=cpu=200m --expose --port=80<br>kubectl run --generator=deployment/apps.v1 is DEPRECATED and will be removed in a future version. Use kubectl run --generator=run-pod/v1 or kubectl create instead.<br>service/php-apache created<br>deployment.apps/php-apache created</td></tr></tbody></table>

kubectl 1.18，kubectl run 创建的是 pod

<table class=""><tbody><tr><td>➜&nbsp; /Users/zhouzhengxi kubectl version<br>Client Version: version.Info{Major:"1", Minor:"18", GitVersion:"v1.18.3", GitCommit:"2e7996e3e2712684bc73f0dec0200d64eec7fe40", GitTreeState:"clean", BuildDate:"2020-05-20T12:52:00Z", GoVersion:"go1.13.9", Compiler:"gc", Platform:"darwin/amd64"}<br>Server Version: version.Info{Major:"1", Minor:"18", GitVersion:"v1.18.2", GitCommit:"52c56ce7a8272c798dbc29846288d7cd9fbae032", GitTreeState:"clean", BuildDate:"2020-04-30T20:19:45Z", GoVersion:"go1.13.9", Compiler:"gc", Platform:"linux/amd64"}<br>➜&nbsp; /Users/zhouzhengxi kubectl run php-apache --image=k8s.gcr.io/hpa-example --requests=cpu=200m --expose --port=80<br>service/php-apache created<br>pod/php-apache created</td></tr></tbody></table>

也不知道为什么要做这个改动，可以看 Alex Ellis 的文章

[Kubernetes 1.18 broke “kubectl run”, here’s what to do about it](https://medium.com/@alexellisuk/kubernetes-1-18-broke-kubectl-run-heres-what-to-do-about-it-2a88e5fb389a)
