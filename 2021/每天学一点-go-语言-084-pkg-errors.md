# 每天学一点-go-语言-084-pkg-errors

Posted on Apr. 12 2021

---

errors (pkg/errors)
github.com/pkg/errors

```shell
_, err := ioutil.ReadAll(r)
if err != nil {
        return errors.Wrap(err, "read failed")
}
```

甚至可以

```go
_, err := ioutil.ReadAll(r)
return errors.Wrap(err, "read failed")

```

因为

```go
// Wrap returns an error annotating err with a stack trace
// at the point Wrap is called, and the supplied message.
// If err is nil, Wrap returns nil.
func Wrap(err error, message string) error {
  if err == nil {
     return nil
  }
  err = &withMessage{
     cause: err,
     msg:   message,
  }
  return &withStack{
     err,
     callers(),
  }
}
```




