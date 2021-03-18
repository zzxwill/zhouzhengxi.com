# 每天学一点-Kubernetes-034-controller-runtime-envtest

Posted on Mar 18 2021

---

```shell

➜  /Users/zhouzhengxi/Downloads kubectl describe workloaddefinition.core.oam.dev/invalid-wd1
Events:
  Type     Reason                                Age                 From                Message
  ----     ------                                ----                ----                -------
  Warning  cannot store capability in ConfigMap  31s (x19 over 17m)  WorkloadDefinition  failed to generate OpenAPI v3 JSON schema for capability invalid-wd1: capability invalid-wd1 doesn't contain section `parmeter`
```

event 是有保存时限的，不过如果一致打印，也没关系，x19 over 17m
