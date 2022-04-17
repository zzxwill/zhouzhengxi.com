# Learn-a-little-golang-everyday-138-compare

Posted on Apr. 17, 2022

---

`cmp` is a library created by Google, which is used to compare two objects.

```

"github.com/google/go-cmp/cmp"

// CompareTwoContainerEnvs compares two slices of v1.EnvVar
func CompareTwoContainerEnvs(s1 []v1.EnvVar, s2 []v1.EnvVar) bool {
  less := func(env1 v1.EnvVar, env2 v1.EnvVar) bool {
     return env1.Name < env2.Name
  }
  return cmp.Diff(s1, s2, cmpopts.SortSlices(less)) == ""
}
```
