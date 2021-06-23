# 每天学一点-Kubernetes-059-k8s-controller-runtime-RequeueAfter

Posted on Jun 23, 2021

---

Controller runtime

```go
sigs.k8s.io/controller-runtime@v0.6.2/alias.go
// Result contains the result of a Reconciler invocation.
type Result = reconcile.Result

// Result contains the result of a Reconciler invocation.
type Result struct {
// Requeue tells the Controller to requeue the reconcile key.  Defaults to false.
Requeue bool

// RequeueAfter if greater than 0, tells the Controller to requeue the reconcile key after the Duration.
// Implies that Requeue is true, there is no need to set Requeue to true at the same time as RequeueAfter.
RequeueAfter time.Duration
}

// A Duration represents the elapsed time between two instants
// as an int64 nanosecond count. The representation limits the
// largest representable duration to approximately 290 years.
type Duration int64
```

ctrl.Result{RequeueAfter: 10} 表示 10*nanosecond，而不是预期的 3s。

