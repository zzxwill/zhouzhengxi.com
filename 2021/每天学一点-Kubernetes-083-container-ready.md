# 每天学一点-Kubernetes-083-container-ready

Posted on Oct. 12, 2021

---


Container 的 ready 是怎么设置的？

.status.containerStatuses.0.ready

```
status:
  containerStatuses:
  - containerID: containerd://f0eb37369f65e5a59411390d43bdb69d48bb8570ba566af01ddddbe40a17a111
    image: docker.io/oamdev/docker-terraform:1.0.6
    imageID: docker.io/oamdev/docker-terraform@sha256:f3ad8f883df13c66b086940f1aa8cb72a943b637386e89fcfc912ca14aad5771
    lastState: {}
    name: terraform-executor
    ready: false
    restartCount: 0
    started: false
    state:
      terminated:
        containerID: containerd://f0eb37369f65e5a59411390d43bdb69d48bb8570ba566af01ddddbe40a17a111
        exitCode: 0
        finishedAt: "2021-10-12T08:29:12Z"
        reason: Completed
        startedAt: "2021-10-12T08:28:35Z"
  hostIP: 172.18.0.3
  initContainerStatuses:
  - containerID: containerd://e3397790612d1b92b7d06d197d93d29b613959207f019ad3b29e8a2e973042e3
    image: docker.io/library/busybox:latest
    imageID: docker.io/library/busybox@sha256:f7ca5a32c10d51aeda3b4d01c61c6061f497893d7f6628b92f822f7117182a57
    lastState: {}
    name: prepare-input-terraform-configurations
    ready: true
    restartCount: 0
    state:
      terminated:
        containerID: containerd://e3397790612d1b92b7d06d197d93d29b613959207f019ad3b29e8a2e973042e3

        exitCode: 0
        finishedAt: "2021-10-12T08:17:20Z"
        reason: Completed
        startedAt: "2021-10-12T08:17:20Z"
  phase: Succeeded
  podIP: 10.244.0.6
  podIPs:
  - ip: 10.244.0.6
  qosClass: BestEffort
  startTime: "2021-10-12T08:16:57Z"
```

https://kubernetes.io/docs/reference/kubernetes-api/workload-resources/pod-v1/#Container

>containerStatuses.ready (boolean), required
Specifies whether the container has passed its readiness probe.

→

>readinessProbe (Probe)
Periodic probe of container service readiness. Container will be removed from service endpoints if the probe fails. Cannot be updated. More info: https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle#container-probes

→

https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle/#container-probes

>readinessProbe: Indicates whether the container is ready to respond to requests. If the readiness probe fails, the endpoints controller removes the Pod's IP address from the endpoints of all Services that match the Pod. The default state of readiness before the initial delay is Failure. If a Container does not provide a readiness probe, the default state is Success.

那么，如果 container 在运行，ready 应该是 true。

如果 container 执行完成，那么 ready 就变为了 false。

观察 container 执行过程，发现 container 执行过程中，Ready 的确变成了 1/1

```
➜  ~ k get pod -n terraform -w
NAME                                 READY   STATUS             RESTARTS   AGE
fc-apply-8bd9d                       0/1     Pending            0          0s
fc-apply-8bd9d                       0/1     Pending            0          0s
fc-apply-8bd9d                       0/1     Init:0/1           0          0s
fc-apply-8bd9d                       0/1     Init:0/1           0          0s
fc-apply-8bd9d                       0/1     PodInitializing    0          1s
fc-apply-8bd9d                       1/1     Running            0          2s
fc-apply-8bd9d                       0/1     Completed          0          8s



```