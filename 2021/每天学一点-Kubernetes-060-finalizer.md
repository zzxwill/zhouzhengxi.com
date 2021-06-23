# 每天学一点-Kubernetes-060-finalizer

Posted on Jun 23, 2021

---

Finalizer

https://book.kubebuilder.io/reference/using-finalizers.html#using-finalizers


同步删除，比如删除 Terraform Configuration 对象时，会 hold 住删除，先 删掉对应的 Job/Pod。
