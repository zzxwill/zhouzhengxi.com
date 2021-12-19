# Learn-a-little-golang-everyday-128-compare-errors

Posted on Nov. 19, 2021

---

```go
func main()  {
  err1 := errors.New("A")
  err2 := errors.New("A")
  fmt.Println(err1 == err2)
}
```

The result is false.
```
// New returns an error that formats as the given text.
// Each call to New returns a distinct error value even if the text is identical.
func New(text string) error {
  return &errorString{text}
}
```

errors.New will return a pointer. So they won’t be the same.

The simple solution is to make errors.New(“A”) as a variable.

```
var errInvalid = errors.New("invalid")

func main()  {
  err1 := errInvalid
  err2 := errInvalid
  fmt.Println(err1 == err2)
}
```
