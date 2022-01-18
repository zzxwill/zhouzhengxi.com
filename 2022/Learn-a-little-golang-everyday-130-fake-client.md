# Learn-a-little-golang-everyday-130-fake-client

Posted on Jan. 2, 2022

---

sigs.k8s.io/controller-runtime/pkg/client/fake

```
k8sClient := fake.NewClientBuilder().Build()
```

This can create a fake Kubernetes client, and it won’t hit any error when getting/listing Kubenetes resources.

```
secrets := &v1.SecretList{}
if err := k8sClient.List(ctx, secrets, client.InNamespace(ClusterGatewaySecretNamespace), client.HasLabels{v1alpha1.LabelKeyClusterCredentialType}); err != nil {
    return nil, errors2.Wrapf(err, "failed to list cluster secrets")
}
```
