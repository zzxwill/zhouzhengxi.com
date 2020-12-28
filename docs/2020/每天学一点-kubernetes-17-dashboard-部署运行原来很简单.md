---
title: "每天学一点 Kubernetes | 17. Dashboard 部署运行原来很简单"
date: "2020-09-03"
categories: 
  - "kubernetes"
tags: 
  - "kubernetes"
---

参考 [https://kubernetes.io/docs/tasks/access-application-cluster/web-ui-dashboard/](https://kubernetes.io/docs/tasks/access-application-cluster/web-ui-dashboard/)

![](https://lh3.googleusercontent.com/JBa1NOrEhX15yXzAMo4gdtXCiOksHJTwMbMhJS8cNTdoNUgNwgyA9a9hXeVMcKcRCkE6bpNTa_K7uhRlkIaTJM16Wd2B743j3H6U7hyc14N0cGvFxPWrGjVjLk_UqlmqAeEFWZpU)

[create a bearer token to login](https://github.com/kubernetes/dashboard/blob/master/docs/user/access-control/creating-sample-user.md)  
创建一个用 token 登陆的账号，就可以访问了。

只是访问链接很复杂，也不知道为什么 Kubernetes 不做一个 http://localhost:8001/ 的跳转。

[http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/.](http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/.)

![](https://lh3.googleusercontent.com/9grejIW-nIFZ0svspuBPgOhflfsRtAXCe7iX_alm4DQ20kxtiFtSeHZm8Au2G8Yt0KZwNQN11xdSCHJkWci4JQ27J7g7uYUGw9rWxyn-fpSzpmnP8q8pmkAP5PqVOrRXeHexWbgd)
