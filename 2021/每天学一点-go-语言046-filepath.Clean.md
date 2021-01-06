# 046-filepath.Clean
Posted at {docsify-updated}

filepath.Clean

```go
f, err := os.Open(filepath.Join(fileDir, fileName))
```

报错：
> G304: Potential file inclusion via variable (gosec)

可能 filepath.Join(fileDir, fileName) 里含有不安全的内容，所以需要 Clean

→ 

```go
f, err := os.Open(filepath.Clean(filepath.Join(fileDir, fileName)))
```

