# 每天学一点-Kubernetes-090-client-go

Posted on Nov. 10, 2021

---


https://github.com/kubernetes/client-go/blob/master/examples/in-cluster-client-configuration/main.go

初始化 client

```
func initClientSet() (*kubernetes.Clientset, error) {
  config, err := rest.InClusterConfig()
  if err != nil {
     return nil, err
  }
  return kubernetes.NewForConfig(config)
}
```

kubernetes.NewForConfig(config) 可以兼容 kubeconfig 和 inClusterConfig，非常好用。
