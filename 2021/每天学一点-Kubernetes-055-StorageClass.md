# 每天学一点-Kubernetes-055-StorageClass

Posted on Jun 19, 2021

---

StorageClass
StorageClass 为管理员提供了描述存储 "类" 的方法。 不同的类型可能会映射到不同的服务质量等级或备份策略，或是由集群管理员制定的任意策略。
https://kubernetes.io/zh/docs/concepts/storage/storage-classes/



```
k get sc
NAME                       PROVISIONER                       RECLAIMPOLICY   VOLUMEBINDINGMODE      ALLOWVOLUMEEXPANSION   AGE
alicloud-disk-available    diskplugin.csi.alibabacloud.com   Delete          Immediate              true                   76d
alicloud-disk-efficiency   diskplugin.csi.alibabacloud.com   Delete          Immediate              true                   76d
alicloud-disk-essd         diskplugin.csi.alibabacloud.com   Delete          Immediate              true                   76d
alicloud-disk-ssd          diskplugin.csi.alibabacloud.com   Delete          Immediate              true                   76d
alicloud-disk-topology     diskplugin.csi.alibabacloud.com   Delete          WaitForFirstConsumer   true                   76d
```