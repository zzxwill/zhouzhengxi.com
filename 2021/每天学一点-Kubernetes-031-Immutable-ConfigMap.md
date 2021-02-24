# 每天学一点-Kubernetes-031-Immutable-ConfigMap

Posted at Feb 24 2021

---

ConfigMaps

immutable ConfigMaps (v1.19 beta)
https://kubernetes.io/docs/concepts/configuration/configmap/#configmap-immutable

只可以删除和重新创建

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
...
data:
...
immutable: true
```

