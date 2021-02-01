# 每天学一点-Kubernetes-22-Yaml-中三个横杠

Posted at {docsify-updated}

Yaml 中三个横杠 `---` 是用来隔离不同对象的 yaml manifests，最开始学习时，不知道这个用法。

```yaml
apiVersion: v1
kind: Service
metadata:
  name: lb-svc
  namespace: default
spec:
  ports:
    - name: poc
      port: 8080
      protocol: TCP
      targetPort: 80
  selector:
    app: s1
  type: "LoadBalancer"

---
apiVersion: v1
kind: Pod
metadata:
  labels:
    app: s1
  name: s1
  namespace: default
spec:
  containers:
    - image: wordpress:php7.4-apache
      imagePullPolicy: IfNotPresent
      name: s1
      ports:
        - containerPort: 80
          protocol: TCP
      resources:
        limits:
          cpu: 500m
        requests:
          cpu: 500m

```

比如上面，是用来隔离 `Service` 和 `Pod` 资源对象的 manifests。