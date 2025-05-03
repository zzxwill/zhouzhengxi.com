# Empty CRD `_.yaml` is generated

我找到了 _.yaml 产生的原因，show.go 里有个 struct 造成的。
type Unkown struct {
metav1.TypeMeta   `json:",inline"`
metav1.ObjectMeta `json:"metadata,omitempty" protobuf:"bytes,1,opt,name=metadata"`
Spec              interface{} `json:"spec"`
Status            interface{} `json:"status"`
}


