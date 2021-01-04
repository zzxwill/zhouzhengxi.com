# 每天学一点-Kubernetes-021-Deployment(1)-新Pod谨慎操作DML

Posted at {docsify-updated}

Deployment RollingUpdate 的一个前提是新版本的 Pod 与旧版本 Pod 相比，不能对数据库的 DML 进行修改，不然旧版本的 Pod 很可能不能工作。