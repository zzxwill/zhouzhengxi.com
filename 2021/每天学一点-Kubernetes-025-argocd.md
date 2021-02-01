# 每天学一点-Kubernetes-025-argocd

Posted at Jan. 13 2021

---

```shell
➜  /Users/zhouzhengxi argocd version
argocd: v1.7.10+bcb05b0.dirty
  BuildDate: 2020-11-20T23:40:45Z
  GitCommit: bcb05b0c2e0f8006aa2d2abaf780e73c9e73c945
  GitTreeState: dirty
  GoVersion: go1.15.5
  Compiler: gc
  Platform: darwin/amd64
FATA[0000] Argo CD server address unspecified
```

Don't panic.

```yaml
argocd login 12.34.56.78 --insecure --username admin --password argocd-server-6dccb89f65-rssbr --grpc-web
```

ip 从哪里来？

https://argoproj.github.io/argo-cd/getting_started/#3-access-the-argo-cd-api-server

```shell
➜  /Users/zhouzhengxi k get svc -n argocd
NAME                    TYPE           CLUSTER-IP      EXTERNAL-IP     PORT(S)                      AGE
argocd-dex-server       ClusterIP      172.21.15.74    <none>          5556/TCP,5557/TCP,5558/TCP   65m
argocd-metrics          ClusterIP      172.21.13.184   <none>          8082/TCP                     65m
argocd-redis            ClusterIP      172.21.2.157    <none>          6379/TCP                     65m
argocd-repo-server      ClusterIP      172.21.13.108   <none>          8081/TCP,8084/TCP            65m
argocd-server           LoadBalancer   172.21.11.124   47.242.237.35   80:32004/TCP,443:30707/TCP   65m
argocd-server-metrics   ClusterIP      172.21.2.195    <none>          8083/TCP                     65m
```


```shell
➜  /Users/zhouzhengxi argocd version
argocd: v1.7.10+bcb05b0.dirty
  BuildDate: 2020-11-20T23:40:45Z
  GitCommit: bcb05b0c2e0f8006aa2d2abaf780e73c9e73c945
  GitTreeState: dirty
  GoVersion: go1.15.5
  Compiler: gc
  Platform: darwin/amd64
argocd-server: v1.8.2+94017f2
  BuildDate: 2021-01-10T05:40:54Z
  GitCommit: 94017f2c8d97588d4aa2213713a71d51005ed62d
  GitTreeState: clean
  GoVersion: go1.14.12
  Compiler: gc
  Platform: linux/amd64
  Ksonnet Version: v0.13.1
  Kustomize Version: v3.8.1 2020-07-16T00:58:46Z
  Helm Version: v3.4.1+gc4e7485
  Kubectl Version: v1.17.8
```