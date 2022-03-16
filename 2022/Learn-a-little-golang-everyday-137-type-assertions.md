# Learn-a-little-golang-everyday-136-empty-key-in-a-map

Posted on Mar. 16, 2022

---

A way to check whether the type of the variable is `[]interface{}`.

```
switch t := v.Default.(type) {
case nil, string:
  schema = openapi3.NewStringSchema()
case []interface{}:
  schema = openapi3.NewArraySchema()
  fmt.Println(t)
}
```
