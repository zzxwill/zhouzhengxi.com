# 每天学一点-Kubernetes-053-when-job-exits

Posted on Jun 8, 2021

---

Job 什么时候被清理？
terminated-pod-gc-threshold

1.12 引入 .spec.ttlSecondsAfterFinished 表示完成后，多少秒退出，但是依赖
TTLAfterFinished, 需要 1.21 的 TTL Controller 支持

https://kubernetes.io/docs/concepts/workloads/controllers/ttlafterfinished/
