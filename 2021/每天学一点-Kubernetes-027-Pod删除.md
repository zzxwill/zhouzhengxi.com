# 每天学一点-Kubernetes-027-Pod删除

Posted at Feb 1 2021

---

Pod 删除

删除 Pod，Kubernetes 向进程发送一个 SIGTERM 信号并等待一定的时间（默认 30s），使其正常关闭；如果没有及时关闭，则通过 SIGKILL 终止该进程。
为了确保进程正常关闭，需要正确处理 SIGTERM 信号。

```shell
➜  /Users/zhouzhengxi k delete all -n poc --all
pod "poc-69bc6f6dcc-kf9tj" deleted
deployment.apps "poc" deleted
replicaset.apps "poc-69bc6f6dcc" deleted
```

--all 表示删除所有资源，包括 replicaset

