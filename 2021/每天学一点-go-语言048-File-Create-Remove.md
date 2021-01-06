# 48-File-Create-Remove.md
Posted at {docsify-updated}

- Remove
删除文件


- Create

```go
func Create(name string) (*File, error) {
  return OpenFile(name, O_RDWR|O_CREATE|O_TRUNC, 0666)
}
```

Create 源代码表示 Create 本质上就是打开一个文件，并且文件不存在，会创建，存在会清空，可读可写。

