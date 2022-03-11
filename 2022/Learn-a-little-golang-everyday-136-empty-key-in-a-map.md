# Learn-a-little-golang-everyday-136-empty-key-in-a-map

Posted on Mar. 11, 2022

---

An empty key is allowed in Golang.

```go

func main() {
a := map[string]string{
"a": "b",
"":  "d",
}
fmt.Println(a[""])
}

```
