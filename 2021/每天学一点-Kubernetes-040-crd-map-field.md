# 每天学一点-Kubernetes-040-crd-map-field

Posted on Apr. 13 2021

---

需求：
需要存储一个 map

```
map[string]interface{}{
  "zoneID": "cn-beijing-1",
  "envType": EnvProduct,
  "serviceAccount": "sa1",
  "resourceGroup": "rg1",
  "versionID": 1,
}
```



可以使用 field

```
// Profile is used to extend fields of ProviderConfigSpec.
// +kubebuilder:pruning:PreserveUnknownFields
Profile runtime.RawExtension `json:"profile,omitempty"`

// +kubebuilder:pruning:PreserveUnknownFields
M map[string]string `json:"m,omitempty"`
```

记得，一定要把注解加上

https://book.kubebuilder.io/reference/markers/crd-processing.html

>kubebuilder:pruning:PreserveUnknownFields
PreserveUnknownFields stops the apiserver from pruning fields which are not specified.
By default the apiserver drops unknown fields from the request payload during the decoding step. This marker stops the API server from doing so. It affects fields recursively, but switches back to normal pruning behaviour if nested properties or additionalProperties are specified in the schema. This can either be true or undefined. False is forbidden.


如果使用 unstructured.Unstructured，后台有错误日志

```
// +kubebuilder:pruning:PreserveUnknownFields
T unstructured.Unstructured `json:"t,omitempty"`


E0316 19:21:34.864545    2536 reflector.go:178] pkg/mod/k8s.io/client-go@v0.18.6/tools/cache/reflector.go:125: Failed to list *v1alpha1.ProviderConfig: v1alpha1.ProviderConfigList.TypeMeta: Kind: Items: []v1alpha1.ProviderConfig: v1alpha1.ProviderConfig.Status: Spec: v1alpha1.ProviderConfigSpec.T: unmarshalerDecoder: Object 'Kind' is missing in '{"serviceAccount":"mw-serverless"}', error found in #10 byte of ...|rverless"}},"status"|..., bigger context ...|cn-beijing","t":{"serviceAccount":"mw-serverless"}},"status":{}}],"kind":"ProviderConfigList","metad|...
```
