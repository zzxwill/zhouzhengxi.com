# 每天学一点-Kubernetes-029-Kind安装老版本Kubernetes

Posted at Feb 4 2021

---

`kind create cluster --image=kindest/node:v1.15.12`

镜像版本在这里：https://hub.docker.com/r/kindest/node/tags?page=1&ordering=last_updated

不过 macOS 一直无法安装成功，可以在阿里云 Hongkong region CentOS 上成功安装。