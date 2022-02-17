# Learn-a-little-Kubernetes-everyday-095-NoKindMatchError

Posted on Jan. 18, 2022


```
providerList := &terraformv1beta1.ProviderList{}

err := k8sClient.List(ctx, providerList, client.InNamespace(AddonTerraformProviderNamespace))
```

If Provider CRD doesn't exist, it will return `NoKindMatchError`.


