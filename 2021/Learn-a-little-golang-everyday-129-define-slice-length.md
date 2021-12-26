# Learn-a-little-golang-everyday-129-define-slice-length

Posted on Dec. 26, 2021

---

Define the length of a slice

```
envs := make([]string, 1)
envs = append(envs, "GOOS")
fmt.Println(envs)
```

`make` defines the length of the slice, and will initialize the first element of the slice to the default value of the type,
ie empty string for string. Then `append` will lead the value of envs to `{"", "GOOS"}`. So the right way to set `envs` is
`envs[0] = “GOOS”`.
