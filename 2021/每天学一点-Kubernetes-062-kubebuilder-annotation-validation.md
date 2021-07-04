# 每天学一点-Kubernetes-062-kubebuilder-annotation-validation

Posted on Jun 29, 2021

---

kubebuilder 注解验证

```
// StoreParameters define the desired state of an SLS store.
type StoreParameters struct {

// The maximum number of shards for automatic sharding.
// +optinal
// +kubebuilder:validation:Optional
// +kubebuilder:validation:Minimum:=1
// +kubebuilder:validation:Maximum:=64
MaxSplitShard int `json:"maxSplitShard"`
}



// +optinal
// +kubebuilder:validation:Optional

```

设置了，却还是要检查 Minimum，应该去掉 Minimum

