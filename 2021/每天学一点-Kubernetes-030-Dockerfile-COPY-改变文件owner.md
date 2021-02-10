# 每天学一点-Kubernetes-030-Dockerfile-COPY-改变文件owner

Posted at Feb 10 2021

---
Dockerfile

COPY 拷贝的文件默认 owner 是 root，可以使用 --chown 参数改变之。

base image 默认用户是 cnb，所以需要解决 owner 问题

```dockerfile

FROM cloudfoundry/cnb:0.1.62-base
WORKDIR /app
COPY --chown=cnb:cnb . /app
```

https://stackoverflow.com/a/44766666/806300

