# 每天学一点-Kubernetes-081-how-to-log-in-container.md

Posted on Oct. 24, 2021

---



Logging

https://kubernetes.io/docs/concepts/cluster-administration/logging/

写到标准输出和标准错误里。

Application logs can help you understand what is happening inside your application. The logs are particularly useful for debugging problems and monitoring cluster activity. Most modern applications have some kind of logging mechanism. Likewise, container engines are designed to support logging. The easiest and most adopted logging method for containerized applications is writing to standard output and standard error streams.