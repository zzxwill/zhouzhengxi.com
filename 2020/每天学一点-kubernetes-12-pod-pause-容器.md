---
title: "每天学一点 Kubernetes | 12. Pod pause 容器"
date: "2020-07-19"
categories: 
  - "kubernetes"
tags: 
  - "kubernetes"
---

## Pod

pause 容器跟 Pod 同生命周期，保存所有命名空间，包括网络信息。

<table class=""><tbody><tr><td><strong>$</strong> kubectl run nginx --image=nginx<br>pod/nginx created<br><strong><br></strong><strong>$</strong> [root@iZj6cafdzwdb5yqu6ob6f1Z ~]<em># docker ps | grep nginx</em><br>eeccb6cf12d0&nbsp; &nbsp; &nbsp; &nbsp; nginx &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; "/docker-entrypoint...." &nbsp; 7 minutes ago &nbsp; &nbsp; &nbsp; Up 7 minutes&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; k8s_nginx_nginx_default_4a9d0668-3272-48fe-9b37-bbf66235ea10_0<br>b73705a5fdc6&nbsp; &nbsp; &nbsp; &nbsp; registry-vpc.cn-hongkong.aliyuncs.com/acs/pause-amd64:3.0 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; "/pause" &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 7 minutes ago &nbsp; &nbsp; &nbsp; Up 7 minutes&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; k8s_POD_nginx_default_4a9d0668-3272-48fe-9b37-bbf66235ea10_0</td></tr></tbody></table>
