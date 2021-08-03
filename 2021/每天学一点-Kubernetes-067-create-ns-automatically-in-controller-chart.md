# 每天学一点-Kubernetes-067-create-ns-automatically-in-controller-chart

Posted on Aug 3, 2021

---

这是一个标准的 Kubebuilder 生成的 controller 的 yaml，第一部分是生成 ns，这个应该加上，否则 helm install 会报错 ns 不存在


```
apiVersion: v1
kind: Namespace
metadata:
 labels:
   control-plane: controller-manager
 name: system
---
apiVersion: apps/v1
kind: Deployment
metadata:
 name: controller-manager
 namespace: system
 labels:
   control-plane: controller-manager
spec:
 selector:
   matchLabels:
     control-plane: controller-manager
 replicas: 1
 template:
   metadata:
     labels:
       control-plane: controller-manager
   spec:
     containers:
     - command:
       - /manager
       args:
       - --enable-leader-election
       image: controller:latest
       name: manager
       resources:
         limits:
           cpu: 100m
           memory: 30Mi
         requests:
           cpu: 100m
           memory: 20Mi
     terminationGracePeriodSeconds: 10


```