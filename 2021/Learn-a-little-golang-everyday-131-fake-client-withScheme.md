# Learn-a-little-golang-everyday-131-fake-client-withScheme

Posted on Jan. 10, 2022

---

```
addonApplication := &v1beta1.Application{
  ObjectMeta: metav1.ObjectMeta{
     Name:      "observability",
     Namespace: types.DefaultKubeVelaNS,
  },
  Status: common.AppStatus{
     Phase: common.ApplicationRunning,
  },
}


scheme := runtime.NewScheme()
assert.NoError(t, v1beta1.AddToScheme(scheme))
assert.NoError(t, corev1.AddToScheme(scheme))
k8sClient := fake.NewClientBuilder().WithScheme(scheme).WithObjects(addonApplication, addonSecret).Build()
```

If using `WithSchema` to create resources, all Kubernetes and non-Kubernetes schemas have to be imported.

By using [the basic usage](./Learn-a-little-golang-everyday-130-fake-client.md), Kubernetes resources can be created directly.
