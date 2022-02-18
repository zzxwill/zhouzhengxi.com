# Learn-a-little-golang-everyday-133-a-better-assert-library

Posted on Feb. 18, 2022

---

Using this way won't generate all other default null keys in the yaml file.

```go
def := v1beta1.ComponentDefinition{
	TypeMeta: metav1.TypeMeta{
		APIVersion: "core.oam.dev/v1beta1",
		Kind:       "ComponentDefinition",
	},
	ObjectMeta: metav1.ObjectMeta{
		Name:      fmt.Sprintf("%s-%s", provider, name),
		Namespace: types.DefaultKubeVelaNS,
		Annotations: map[string]string{
			"definition.oam.dev/description": desc,
		},
		Labels: map[string]string{
			"type": "terraform",
		},
	},
	Spec: v1beta1.ComponentDefinitionSpec{
		Workload: commontype.WorkloadTypeDescriptor{
			Definition: commontype.WorkloadGVK{
				APIVersion: "terraform.core.oam.dev/v1beta1",
				Kind:       "Configuration",
			},
		},
		Schematic: &commontype.Schematic{
			Terraform: &commontype.Terraform{
				Configuration: git,
				Type:          "remote",
				Path:          gitPath,
			},
		},
	},
}
var out bytes.Buffer
err = json.NewSerializerWithOptions(json.DefaultMetaFactory, nil, nil, json.SerializerOptions{Yaml: true}).Encode(&def, &out)
if err != nil {
	return "", errors.Wrapf(err, "failed to marshal component definition")
}
return out.String(), nil
```
