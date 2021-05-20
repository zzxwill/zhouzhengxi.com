# 每天学一点-go-语言-095-golangci-lint-issue

Posted on May 20, 2021

---

golangci-lint

检查结果

```
Running [/home/runner/golangci-lint-1.38.0-linux-amd64/golangci-lint run --out-format=github-actions] in [] ...
level=warning msg="[runner] Can't run linter goanalysis_metalinter: bodyclose: failed prerequisites: [buildssa@github.com/oam-dev/kubevela/pkg/oam: analysis skipped: errors in package: [/home/runner/work/kubevela/kubevela/pkg/oam/types.go:23:9: could not import k8s.io/apimachinery/pkg/apis/meta/v1 (/home/runner/go/pkg/mod/k8s.io/apimachinery@v0.18.8/pkg/apis/meta/v1/conversion.go:25:2: could not import k8s.io/apimachinery/pkg/api/resource (/home/runner/go/pkg/mod/k8s.io/apimachinery@v0.18.8/pkg/api/resource/amount.go:23:6: could not import gopkg.in/inf.v0 (../../../go/pkg/mod/k8s.io/apimachinery@v0.18.8/pkg/api/resource/amount.go:23:2: missing go.sum entry for module providing package gopkg.in/inf.v0 (imported by k8s.io/apimachinery/pkg/api/resource); to add:\n\tgo get k8s.io/apimachinery/pkg/api/resource@v0.18.8))) /home/runner/work/kubevela/kubevela/pkg/oam/types.go:24:2: could not import k8s.io/apimachinery/pkg/runtime (/home/runner/go/pkg/mod/k8s.io/apimachinery@v0.18.8/pkg/runtime/codec.go:32:2: could not import k8s.io/klog (../../../go/pkg/mod/k8s.io/apimachinery@v0.18.8/pkg/labels/selector.go:29:2: missing go.sum entry for module providing package k8s.io/klog (imported by github.com/oam-dev/kubevela/pkg/webhook/core.oam.dev/v1alpha2/traitdefinition); to add:\n\tgo get github.com/oam-dev/kubevela/pkg/webhook/core.oam.dev/v1alpha2/traitdefinition)) /home/runner/work/kubevela/kubevela/pkg/oam/types.go:27:18: could not import github.com/crossplane/crossplane-runtime/apis/core/v1alpha1 (/home/runner/go/pkg/mod/github.com/crossplane/crossplane-runtime@v0.10.0/apis/core/v1alpha1/condition.go:22:9: could not import k8s.io/api/core/v1 (/home/runner/go/pkg/mod/k8s.io/api@v0.18.8/core/v1/generated.pb.go:29:11: could not import k8s.io/apimachinery/pkg/api/resource (/home/runner/go/pkg/mod/k8s.io/apimachinery@v0.18.8/pkg/api/resource/amount.go:23:6: could not import gopkg.in/inf.v0 (../../../go/pkg/mod/k8s.io/apimachinery@v0.18.8/pkg/api/resource/amount.go:23:2: missing go.sum entry for module providing package gopkg.in/inf.v0 (imported by k8s.io/apimachinery/pkg/api/resource); to add:\n\tgo get k8s.io/apimachinery/pkg/api/resource@v0.18.8))))]]"
level=warning msg="[runner] Can't run linter makezero: makezero: analysis skipped: errors in package: [/home/runner/work/kubevela/kubevela/pkg/oam/types.go:23:9: could not import k8s.io/apimachinery/pkg/apis/meta/v1 (/home/runner/go/pkg/mod/k8s.io/apimachinery@v0.18.8/pkg/apis/meta/v1/conversion.go:25:2: could not import k8s.io/apimachinery/pkg/api/resource (/home/runner/go/pkg/mod/k8s.io/apimachinery@v0.18.8/pkg/api/resource/amount.go:23:6: could not import gopkg.in/inf.v0 (../../../go/pkg/mod/k8s.io/apimachinery@v0.18.8/pkg/api/resource/amount.go:23:2: missing go.sum entry for module providing package gopkg.in/inf.v0 (imported by k8s.io/apimachinery/pkg/api/resource); to add:\n\tgo get k8s.io/apimachinery/pkg/api/resource@v0.18.8))) /home/runner/work/kubevela/kubevela/pkg/oam/types.go:24:2: could not import k8s.io/apimachinery/pkg/runtime (/home/runner/go/pkg/mod/k8s.io/apimachinery@v0.18.8/pkg/runtime/codec.go:32:2: could not import k8s.io/klog (../../../go/pkg/mod/k8s.io/apimachinery@v0.18.8/pkg/labels/selector.go:29:2: missing go.sum entry for module providing package k8s.io/klog (imported by github.com/oam-dev/kubevela/pkg/webhook/core.oam.dev/v1alpha2/traitdefinition); to add:\n\tgo get github.com/oam-dev/kubevela/pkg/webhook/core.oam.dev/v1alpha2/traitdefinition)) /home/runner/work/kubevela/kubevela/pkg/oam/types.go:27:18: could not import github.com/crossplane/crossplane-runtime/apis/core/v1alpha1 (/home/runner/go/pkg/mod/github.com/crossplane/crossplane-runtime@v0.10.0/apis/core/v1alpha1/condition.go:22:9: could not import k8s.io/api/core/v1 (/home/runner/go/pkg/mod/k8s.io/api@v0.18.8/core/v1/generated.pb.go:29:11: could not import k8s.io/apimachinery/pkg/api/resource (/home/runner/go/pkg/mod/k8s.io/apimachinery@v0.18.8/pkg/api/resource/amount.go:23:6: could not import gopkg.in/inf.v0 (../../../go/pkg/mod/k8s.io/apimachinery@v0.18.8/pkg/api/resource/amount.go:23:2: missing go.sum entry for module providing package gopkg.in/inf.v0 (imported by k8s.io/apimachinery/pkg/api/resource); to add:\n\tgo get k8s.io/apimachinery/pkg/api/resource@v0.18.8))))]"
level=warning msg="[runner] Can't run linter unused: buildir: failed to load package : could not load export data: no export data for \"gopkg.in/inf.v0\""
level=error msg="Running error: buildir: failed to load package : could not load export data: no export data for \"gopkg.in/inf.v0\""
```

so your problem related to a faulty go.sum
You can run the following commands:
```
$ go clean -modcache
$ go mod tidy
```

https://github.com/golangci/golangci-lint/discussions/1920
