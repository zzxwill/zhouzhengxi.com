# 每天学一点-Kubernetes-051-delete-terminate-resource.md

Posted on Jun 1, 2021

---

terminating


```
✗ k describe crd buckets.oss.alibaba.crossplane.io
Status:
  Accepted Names:
    Categories:
      crossplane
      managed
      alibaba
    Kind:       Bucket
    List Kind:  BucketList
    Plural:     buckets
    Singular:   bucket
  Conditions:
    Last Transition Time:  2021-03-19T06:15:20Z
    Message:               no conflicts found
    Reason:                NoConflicts
    Status:                True
    Type:                  NamesAccepted
    Last Transition Time:  2021-03-19T06:15:20Z
    Message:               the initial names have been accepted
    Reason:                InitialNamesAccepted
    Status:                True
    Type:                  Established
    Last Transition Time:  2021-03-19T09:07:18Z
    Message:               CustomResource deletion is in progress
    Reason:                InstanceDeletionInProgress
    Status:                True
    Type:                  Terminating
  Stored Versions:
    v1alpha1
Events:  <none>

```

资源 terminating。

```
✗ k describe crd buckets.oss.alibaba.crossplane.io
Status:
  Accepted Names:
    Categories:
      crossplane
      managed
      alibaba
    Kind:       Bucket
    List Kind:  BucketList
    Plural:     buckets
    Singular:   bucket
  Conditions:
    Last Transition Time:  2021-03-19T06:15:20Z
    Message:               no conflicts found
    Reason:                NoConflicts
    Status:                True
    Type:                  NamesAccepted
    Last Transition Time:  2021-03-19T06:15:20Z
    Message:               the initial names have been accepted
    Reason:                InitialNamesAccepted
    Status:                True
    Type:                  Established
    Last Transition Time:  2021-03-19T09:07:18Z
    Message:               CustomResource deletion is in progress
    Reason:                InstanceDeletionInProgress
    Status:                True
    Type:                  Terminating
  Stored Versions:
    v1alpha1
Events:  <none>

```

导致无法 create cr，可以删掉 finalizers。

```
✗ k patch crd/buckets.oss.alibaba.crossplane.io -p '{"metadata":{"finalizers":[]}}' --type=merge

customresourcedefinition.apiextensions.k8s.io/buckets.oss.alibaba.crossplane.io patched
✗ k patch crd/buckets.oss.alibaba.crossplane.io -p '{"metadata":{"finalizers":[]}}' --type=merge

customresourcedefinition.apiextensions.k8s.io/buckets.oss.alibaba.crossplane.io patched
```
可以完成删除

```

https://github.com/kubernetes/kubernetes/issues/60538#issuecomment-369099998
```

注解/验证

https://book.kubebuilder.io/reference/markers/crd-validation.html#crd-validation

```