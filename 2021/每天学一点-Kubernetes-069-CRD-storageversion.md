# 每天学一点-Kubernetes-069-CRD-storageversion

Posted on Aug 10, 2021

---

storageversion

多个不同版本（如 v1alpha1 和 v1alph2）的 CRD，必须有一个有 storageversion 标记

```go
// +kubebuilder:object:root=true
// +kubebuilder:storageversion
// DatasourceRegistration is the Schema for the datasourceregistrations API
type DatasourceRegistration struct {
    metav1.TypeMeta   `json:",inline"`
    metav1.ObjectMeta `json:"metadata,omitempty"`
    
    Spec   DatasourceRegistrationSpec   `json:"spec,omitempty"`
    Status DatasourceRegistrationStatus `json:"status,omitempty"`
}
```
https://book.kubebuilder.io/reference/markers/crd.html


并且，只能是一个

`

➜  grafana-datasource-registration git:(master) ✗ k apply -f chart/crds/grafana.extension.oam.dev_datasourceregistrations.yaml
The CustomResourceDefinition "datasourceregistrations.grafana.extension.oam.dev" is invalid: spec.versions: Invalid value: []apiextensions.CustomResourceDefinitionVersion{apiextensions.CustomResourceDefinitionVersion{Name:"v1alpha1", Served:true, Storage:true, Deprecated:false, DeprecationWarning:(*string)(nil), Schema:(*apiextensions.CustomResourceValidation)(0xc009fdbb28), Subresources:(*apiextensions.CustomResourceSubresources)(nil), AdditionalPrinterColumns:[]apiextensions.CustomResourceColumnDefinition(nil)}, apiextensions.CustomResourceDefinitionVersion{Name:"v1alpha2", Served:true, Storage:true, Deprecated:false, DeprecationWarning:(*string)(nil), Schema:(*apiextensions.CustomResourceValidation)(0xc009fdbb30), Subresources:(*apiextensions.CustomResourceSubresources)(nil), AdditionalPrinterColumns:[]apiextensions.CustomResourceColumnDefinition(nil)}}: must have exactly one version marked as storage version
`

如果 v1alph2 是 storageversion，那么 v1alpha1 CR  会转化为 v1alph2

https://github.com/oam-dev/kubevela/blob/7161959aca24f39ec4f41e29e0650a13d39db740/apis/core.oam.dev/v1alpha2/conversion.go

