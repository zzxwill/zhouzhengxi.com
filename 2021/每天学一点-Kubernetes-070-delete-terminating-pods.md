# 每天学一点-Kubernetes-070-delete-terminating-pods

Posted on Aug 15, 2021

---
Terminating Pod 删除

```shell

➜  ~ k get pod -n observability
NAME                  READY   STATUS        RESTARTS   AGE
loki-promtail-27588   0/1     Terminating   0          9m3s
loki-promtail-ch9gx   0/1     Terminating   0          9m3s
loki-promtail-hj66m   0/1     Terminating   0          9m3s
loki-promtail-ngmnr   0/1     Terminating   0          9m3s
loki-promtail-p45wz   0/1     Terminating   0          9m3s

➜  ~ k delete pod loki-promtail-27588 --grace-period=0 --force --namespace observability
warning: Immediate deletion does not wait for confirmation that the running resource has been terminated. The resource may continue to run on the cluster indefinitely.
pod "loki-promtail-27588" force deleted

```