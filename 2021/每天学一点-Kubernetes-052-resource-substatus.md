# 每天学一点-Kubernetes-052-resource-substatus.md

Posted on Jun 6, 2021

---

By convention, the Kubernetes API makes a distinction between the specification of the desired state of an object (a nested object field called "spec") and the status of the object at the current time (a nested object field called "status"). The specification is a complete description of the desired state, including configuration settings provided by the user, default values expanded by the system, and properties initialized or otherwise changed after creation by other ecosystem components (e.g., schedulers, auto-scalers), and is persisted in Etcd with the API object. The status summarizes the current state of the object in the system, and is usually persisted with the object by an automated processes but may be generated on the fly. At some cost and perhaps some temporary degradation in behavior, the status could be reconstructed by observation if it were lost.
The PUT and POST verbs on objects MUST ignore the "status" values, to avoid accidentally overwriting the status in read-modify-write scenarios. A /status subresource MUST be provided to enable system components to update statuses of resources they manage.

https://book-v1.book.kubebuilder.io/basics/status_subresource.html

```
err = k8sClient.Status().Update(context.Background(), instance)
```
