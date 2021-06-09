# 每天学一点-Kubernetes-054-delete-job-and-pod

Posted on Jun 9, 2021

---

手动清除 Job 和对应的 Pod

```
// 3. delete apply job
var applyJob batchv1.Job
if err := k8sClient.Get(ctx, client.ObjectKey{Name: applyJobName, Namespace: namespace}, &applyJob); err == nil {
  if err := k8sClient.Delete(ctx, &applyJob, client.PropagationPolicy(metav1.DeletePropagationBackground)); err != nil {
     return err
  }
}
```

这里解释很清楚

```
const (
  // Orphans the dependents.
  DeletePropagationOrphan DeletionPropagation = "Orphan"
  // Deletes the object from the key-value store, the garbage collector will
  // delete the dependents in the background.
  DeletePropagationBackground DeletionPropagation = "Background"
  // The object exists in the key-value store until the garbage collector
  // deletes all the dependents whose ownerReference.blockOwnerDeletion=true
  // from the key-value store.  API sever will put the "foregroundDeletion"
  // finalizer on the object, and sets its deletionTimestamp.  This policy is
  // cascading, i.e., the dependents will be deleted with Foreground.
  DeletePropagationForeground DeletionPropagation = "Foreground"
)



```