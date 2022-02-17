# Learn-a-little-Kubernetes-everyday-094-CaD

Posted on Jan. 2, 2022

---

CaD（Configuration as Data）
Understanding Configuration as Data in Kubernetes

Instead of taking an imperative or procedural approach, Kubernetes relies on the notion of Configuration as Data,
taking a declarative approach to deploying and managing cloud infrastructure as well as applications.


```
apiVersion: serving.knative.dev/v1
kind: Service
metadata:
  name: helloworld-go 
  namespace: default
spec:
  template:
    spec:
      containers:
        - image: gcr.io/knative-samples/helloworld-go
```



