# 每天学一点-Kubernetes-057-SecurityContext

Posted on Jun 21, 2021

---

securityContext
https://kubernetes.io/docs/tasks/configure-pod-container/security-context/#set-the-security-context-for-a-pod

```
apiVersion: v1
kind: Pod
metadata:
name: security-context-demo
spec:
securityContext:
runAsUser: 1000
runAsGroup: 3000
fsGroup: 2000
volumes:
- name: sec-ctx-vol
  emptyDir: {}
  containers:
- name: sec-ctx-demo
  image: busybox
  command: [ "sh", "-c", "sleep 1h" ]
  volumeMounts:
    - name: sec-ctx-vol
      mountPath: /data/demo
      securityContext:
      allowPrivilegeEscalation: false
```

runAsUser：用户 id
runAsGroup: 用户组 id
fsGroup: 创建的文件的用户组 id
