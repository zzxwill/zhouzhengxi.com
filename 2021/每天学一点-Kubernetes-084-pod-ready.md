# 每天学一点-Kubernetes-084-pod-ready

Posted on Oct. 12, 2021

---


遇到一个问题，Pod ready 是 0/1
```
➜  ~ k get pod -n terraform -w
NAME                                 READY   STATUS             RESTARTS   AGE
fc-apply-8bd9d                       0/1     Completed          0          8s
```

>A pod is ready when all its containers are ready AND all conditions specified in the readiness gates have status equal to "True" More info: https://git.k8s.io/enhancements/keps/sig-network/580-pod-readiness-gates

然后查看 [Container status 的规则](./每天学一点-Kubernetes-083-container-ready.md)

结论：没有设置 readnessProbe 的 container，运行时 ready 为 true；运行结束退出，ready 为 false。
