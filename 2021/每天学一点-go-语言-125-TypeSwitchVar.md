# 每天学一点-go-语言-124-TypeSwitchVar.md

Posted on Oct. 28, 2021

---


typeSwitchVar

controllers/configuration/convert.go:88:2: typeSwitchVar: 4 cases can benefit from type switch with assignment (gocritic)
```
switch v.(type) {
case string:
  value = v.(string)
case int:
  value = strconv.Itoa(v.(int))
case bool:
  value = strconv.FormatBool(v.(bool))
case []interface{}:
  var tmp string
  for _, i := range v.([]interface{}) {
     switch i.(type) {
     case string:
        tmp += fmt.Sprintf("\"%v\", ", i)
     case int, bool:
        tmp += fmt.Sprintf("%v, ", i)
     }
  }
  value = fmt.Sprintf(`[%s]`, tmp)
default:
  return "", fmt.Errorf("could not convert %v to string", v)
}
```

建议：https://go-critic.com/overview.html#typeswitchvar


