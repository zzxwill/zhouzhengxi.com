# 024-Deployment(3)--触发更新的条件.md

Posted at {docsify-updated}

更改 Deployment 的自有属性，如副本数、部署策略等，也就是 PodTemplate 之外的属性，并不会导致 Pod 的任何更新。

可以通过 kubectl patch 来更改。

如果 Deployment 中的 PodTemplate 引用了 ConfigMap/Secret，被引用的 ConfigMap/Secret 变更也不会触发 Deployment 升级。
如果需要突发，需要创建一个新的 ConfigMap，并修改 Pod 模板引用新的 ConfigMap。
