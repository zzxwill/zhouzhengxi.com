# 每天学一点-go-语言-100-struct-compare

Posted on Jun 1, 2021

---

Struct 比较

struct 内部顺序不一样，通过 
```
Expect(comp[0].Spec.Workload.Raw).Should(Equal(expectedComponent.Spec.Workload.Raw))
```

会显示不一样

通过 "github.com/google/go-cmp/cmp"
可以判断一致

```
diff := cmp.Diff(comp[0], expectedComponent)
Expect(diff).ShouldNot(BeEmpty())
```
