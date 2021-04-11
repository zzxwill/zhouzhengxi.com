# 每天学一点-Kubernetes-038-cluster-namespaced-scope

Posted on Apr. 11 2021

---

scope

CRD 有两种 scope，对于 cluster scoped crd，设置了 namespace，也会被 apiserver 抛弃掉

>Namespace-scoped
Where the operator is defined within the boundary of a namespace with the flexibility to handle upgrades without impacting others.
Watch objects within that namespace
Role and RoleBinding for RBAC policies for accessing the resource.
Cluster-scoped
Operators which promotes re-usability & serves the purpose to manage defined resource across the cluster.
Watch all namespaces in a cluster
ClusterRole and ClusterRoleBinding: RBAC policies for authorizing cluster objects

对于 namespaced scope，如果 ns 不存在，kubectl 会报错。
