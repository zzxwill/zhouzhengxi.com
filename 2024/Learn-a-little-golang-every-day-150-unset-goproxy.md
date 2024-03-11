# Unset Go proxy

Posted on Mar. 10, 2024

---

```shell
> go env | grep proxy
GOPROXY="https://goproxy.cn,https://proxy.golang.org,direct"


> export GOPROXY="direct"

> go env | grep proxy

```

