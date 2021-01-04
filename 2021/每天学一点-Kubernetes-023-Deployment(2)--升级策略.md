# 每天学一点-Kubernetes-22-Deployment(2)-升级策略

Posted at {docsify-updated}

Deployment RollingUpdate 有两种策略：

- RollingUpdate

渐进式删除旧 Pod；升级过程中，可用和不可用的 Pod 数量可以配置，还可以通过 minReadySecond 配合 readinessProbe
容留一定的时间，确认新 Pod ready 后再继续升级。


- Recreate

一次性删除所有旧 Pod。