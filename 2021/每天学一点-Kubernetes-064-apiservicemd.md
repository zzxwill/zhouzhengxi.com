# 每天学一点-Kubernetes-063-CRD-short-name

Posted on July 23, 2021

---

apiservice

我们平常熟悉的 v1，v1.apps, v1.batch, v1beta1.extensions 都是 apiservice 对象

```
➜  zhouzhengxi.com git:(main) k get apiservice
NAME                                   SERVICE                      AVAILABLE   AGE
v1.                                    Local                        True        29h
v1.admissionregistration.k8s.io        Local                        True        29h
v1.apiextensions.k8s.io                Local                        True        29h
v1.apps                                Local                        True        29h
v1.authentication.k8s.io               Local                        True        29h
v1.authorization.k8s.io                Local                        True        29h
v1.autoscaling                         Local                        True        29h
v1.batch                               Local                        True        29h
v1.certificates.k8s.io                 Local                        True        29h
v1.coordination.k8s.io                 Local                        True        29h
v1.events.k8s.io                       Local                        True        29h
v1.networking.k8s.io                   Local                        True        29h
v1.node.k8s.io                         Local                        True        29h
v1.rbac.authorization.k8s.io           Local                        True        29h
v1.scheduling.k8s.io                   Local                        True        29h
v1.storage.k8s.io                      Local                        True        29h
v1beta1.admissionregistration.k8s.io   Local                        True        29h
v1beta1.alert.alibabacloud.com         Local                        True        29h
v1beta1.apiextensions.k8s.io           Local                        True        29h
v1beta1.authentication.k8s.io          Local                        True        29h
v1beta1.authorization.k8s.io           Local                        True        29h
v1beta1.batch                          Local                        True        29h
v1beta1.certificates.k8s.io            Local                        True        29h
v1beta1.coordination.k8s.io            Local                        True        29h
v1beta1.discovery.k8s.io               Local                        True        29h
v1beta1.events.k8s.io                  Local                        True        29h
v1beta1.extensions                     Local                        True        29h
v1beta1.flowcontrol.apiserver.k8s.io   Local                        True        29h
v1beta1.metrics.k8s.io                 kube-system/metrics-server   True        29h
v1beta1.networking.k8s.io              Local                        True        29h
v1beta1.node.k8s.io                    Local                        True        29h
v1beta1.policy                         Local                        True        29h
v1beta1.rbac.authorization.k8s.io      Local                        True        29h
v1beta1.scheduling.k8s.io              Local                        True        29h
v1beta1.storage.k8s.io                 Local                        True        29h
v1beta1.terraform.core.oam.dev         Local                        True        28h
v2beta1.autoscaling                    Local                        True        29h
v2beta2.autoscaling                    Local                        True        29h
```
