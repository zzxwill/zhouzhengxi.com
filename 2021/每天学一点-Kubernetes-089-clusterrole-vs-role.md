# 每天学一点-Kubernetes-089-clusterrole-vs-role

Posted on Oct. 30, 2021

---

ClusterRole vs Role

ClusterRole 是跨 namespace，role 是限定在某个 namespace

遇到一个问题，我在 role 里配置了对 pods/log 的授权


```

- apiGroups:
   - ""
 resources:
   - pods/log
 verbs:
   - get
   - list
   - create
   - update
   - delete
```

却遇到报错：

`
[terraform-controller] E1014 03:17:31.227962       1 configuration_controller.go:188] "failed to get pod log" err="pods \"counter\" is forbidden: User \"system:serviceaccount:terraform:tf-controller-service-account\" cannot get resource \"pods/log\" in API group \"\" in the namespace \"default\""
`

这个就是 role 是 terraform，没有权限访问 default ns 的 pods/log