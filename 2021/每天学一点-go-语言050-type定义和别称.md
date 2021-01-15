# 每天学一点-go-语言050-type定义和别称.md
Posted at Jan 15 2020

---

## type 别称

这种是给类型取别称。

```go
// Int64Type is int64 type
type Int64Type = int64

// StringType is string type
type StringType = string

// BoolType is bool type
type BoolType = bool

```

为什么要这么做，其中一个原因是 switch 的 case 里需要是 type/const，否则 lint 会报错。

```shell
✗ golangci-lint run
pkg/plugins/references.go:327:2: typeSwitchVar: 3 cases can benefit from type switch with assignment (gocritic)
	switch v.(type) {
	^
```

```go
// getPrintableDefaultValue converts the value in `interface{}` type to be printable
func getPrintableDefaultValue(v interface{}) string {
	if v == nil {
		return ""
	}
	switch value := v.(type) {
	case Int64Type:
		return strconv.FormatInt(value, 10)
	case StringType:
		if v == "" {
			return "empty"
		}
		return value
	case BoolType:
		return strconv.FormatBool(value)
	}
	return ""
}
```

## type 定义

```go
// CapabilityCategory defines the category of a capability
type CapabilityCategory string

const (
	// KubernetesCategory means the capability is in Kubernetes format
	KubernetesCategory CapabilityCategory = "kubernetes"
	// TerraformCategory means the capability is in Terraform format
	TerraformCategory CapabilityCategory = "terraform"
)
```


