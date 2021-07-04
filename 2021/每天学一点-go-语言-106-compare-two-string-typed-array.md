# 每天学一点-go-语言-106-compare-two-string-typed-array

Posted on July 4, 2021

---

比较两个字符串类型的数组

```
a := [2]int{1, 2}
b := [2]int{1, 3}
fmt.Println(a == b)

c := []string{"abc"}
d := []string{"def"}
fmt.Println(c == d) // 不支持
```

还有一个办法

```go
if !reflect.DeepEqual(machineGroup.MachineIDList, *cr.Spec.ForProvider.MachineIDList) {
    return false
}
```

