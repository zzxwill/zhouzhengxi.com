# 每天学一点-go-语言-068-go-get下载二进制binary

Posted on Feb 7 2021

---

go get


```shell
✗ go get github.com/markbates/pkger/cmd/pkger
✗ pkger -h
zsh: command not found: pkger
```

You need to add GOPATH/bin to PATH.
PATH="$GOPATH/bin:$PATH"

还没搞明白二进制 binary 是怎么 build 出来的。

