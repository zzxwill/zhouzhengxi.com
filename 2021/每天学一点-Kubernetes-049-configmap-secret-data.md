# 每天学一点-Kubernetes-049-configmap-secret-data

Posted on May 29, 2021

---

generic secret 类型的 Secret 和 ConfigMap 通过 client-go get 后，数据均是 base64 decode 的，无需再解码