# Learn-a-little-Kubernetes-everyday-101-storageversion

Posted on Apri. 17, 2022

---

If there are two API versions, `v1alph1` and `v1alpha2`, and the storageversion is `v1alpha2`, v1alpha1 CR will be automatically
converted to v1alph2.

https://github.com/oam-dev/kubevela/blob/7161959aca24f39ec4f41e29e0650a13d39db740/apis/core.oam.dev/v1alpha2/conversion.go

If a property is in v1alpha1, but not int v1alpha2, then it will be abandoned.

