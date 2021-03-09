# 每天学一点-Kubernetes-033-namespace的namespace必填

Posted at Mar 9 2021

---

namespace 必填

ConfigMap 定义里的 namespace 是可选的。

```go

// Namespace defines the space within each name must be unique. An empty namespace is
// equivalent to the "default" namespace, but "default" is the canonical representation.
// Not all objects are required to be scoped to a namespace - the value of this field for
// those objects will be empty.
//
// Must be a DNS_LABEL.
// Cannot be updated.
// More info: http://kubernetes.io/docs/user-guide/namespaces
// +optional
Namespace string `json:"namespace,omitempty" protobuf:"bytes,3,opt,name=namespace"`
```

但是实际创建要求必填。
