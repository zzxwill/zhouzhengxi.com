# 每天学一点-Kubernetes-034-controller-runtime-envtest

Posted at Mar 16 2021

---

Controller runtime
```go

package main

import (
	"path/filepath"
	"sigs.k8s.io/controller-runtime/pkg/envtest"
)

func main() {
	var testEnv *envtest.Environment
	useExistCluster := false
	testEnv = &envtest.Environment{
		CRDDirectoryPaths: []string{
			filepath.Join("../../../../../../..", "charts/vela-core/crds"), // this has all the required CRDs,
		},
		UseExistingCluster: &useExistCluster,
	}
	testEnv.Start()
}

```

用于模拟测试，给模拟集群安装 CRD。

如果 crds 路径不存在，不会报错。

```shell
2021-02-26T20:10:30.923+0800	DEBUG	controller-runtime.test-env	starting control plane	{"api server flags": []}
2021-02-26T20:10:35.366+0800	DEBUG	controller-runtime.test-env	installing CRDs
2021-02-26T20:10:35.385+0800	DEBUG	controller-runtime.test-env	installing webhooks
```
