# 每天学一点-Kubernetes-036-deploy Ready “0/1”

Posted on Mar 28 2021

---

```shell
➜  /Users/zhouzhengxi/Programming/golang/src/github.com/oam-dev/catalog/applications/istio/bookinfo git:(istio) ✗ k get deploy
NAME             READY   UP-TO-DATE   AVAILABLE   AGE
details-v1       0/1     0            0           6m20s
productpage-v1   0/1     0            0           6m19s
ratings-v1       0/1     0            0           6m20s
reviews-v1-v1    0/1     0            0           6m19s
```

总是无法 Ready，这时候，通过查看 replicaset 可以看出问题

```shell
➜  /Users/zhouzhengxi/Programming/golang/src/github.com/oam-dev/catalog/applications/istio/bookinfo git:(istio) ✗ k describe replicaset reviews-v1-v1-7b54857b64
Name:           reviews-v1-v1-7b54857b64
Namespace:      default
Selector:       app=reviews,pod-template-hash=7b54857b64,version=v1
Labels:         app=reviews
                pod-template-hash=7b54857b64
                version=v1
Annotations:    app.oam.dev/generation: 1
                app.oam.dev/last-applied-configuration:
                  {"apiVersion":"apps/v1","kind":"Deployment","metadata":{"annotations":{"app.oam.dev/generation":"1","kubectl.kubernetes.io/last-applied-co...
                deployment.kubernetes.io/desired-replicas: 1
                deployment.kubernetes.io/max-replicas: 2
                deployment.kubernetes.io/revision: 1
Controlled By:  Deployment/reviews-v1-v1
Replicas:       0 current / 1 desired
Pods Status:    0 Running / 0 Waiting / 0 Succeeded / 0 Failed
Pod Template:
  Labels:           app=reviews
                    pod-template-hash=7b54857b64
                    version=v1
  Service Account:  bookinfo-reviews
  Containers:
   reviews:
    Image:      docker.io/istio/examples-bookinfo-reviews-v1:1.16.2
    Port:       9080/TCP
    Host Port:  0/TCP
    Environment:
      LOG_DIR:  /tmp/logs
    Mounts:     <none>
  Volumes:      <none>
Conditions:
  Type             Status  Reason
  ----             ------  ------
  ReplicaFailure   True    FailedCreate
Events:
  Type     Reason        Age                    From                   Message
  ----     ------        ----                   ----                   -------
  Warning  FailedCreate  2m25s (x16 over 5m9s)  replicaset-controller  Error creating: pods "reviews-v1-v1-7b54857b64-" is forbidden: error looking up service account default/bookinfo-reviews: serviceaccount "bookinfo-reviews" not found
```
