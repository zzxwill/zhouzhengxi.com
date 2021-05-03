# 每天学一点-Kubernetes-044-job不能更改的属性

Posted on May 3, 2021

---

更新 job 其中一个 container command 报错

spec.Completions， spec.Selector，spec.Template is not allowed to be updated.

https://github.com/kubernetes/kubernetes/issues/89657

```
Invalid value: core.PodTemplateSpec {
	ObjectMeta: v1.ObjectMeta {
		Name: "",
		GenerateName: "",
		Namespace: "",
			}
		},
		Containers: [] core.Container {
			core.Container {
				Name: "terraform-executor",
				Image: "zzxwill/docker-terraform:0.14.10",
				Command: [] string {
					"bash",
					"-c",
					"terraform init && terraform destroy -auto-approve"
				},
				Args: [] string(nil),
				WorkingDir: "",
	
		TopologySpreadConstraints: [] core.TopologySpreadConstraint(nil)
	}
}: field is immutable
```