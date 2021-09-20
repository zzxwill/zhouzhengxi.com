# 每天学一点-Kubernetes-082-serviceaccount-namespace

Posted on Sept. 20, 2021

---

ServiceAccount


- A default service account is automatically created for each namespace.
```
kubectl get serviceaccount
NAME SECRETS AGE
default 1 1d
```

- Service accounts can be added when required. Each pod is associated with exactly one service account but multiple pods
  can use the same service account.
  
- A pod can only use one service account from the same namespace.
这个知识点特别重要


https://stackoverflow.com/questions/52995962/kubernetes-namespace-default-service-account
