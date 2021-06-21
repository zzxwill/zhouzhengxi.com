# 每天学一点-Kubernetes-056-Debug-Pod-issue-with-StorageClass

Posted on Jun 21, 2021

---


阿里云 ack

```
apiVersion: apps/v1
kind: StatefulSet
metadata:
 name: web
spec:
 selector:
   matchLabels:
     app: nginx # has to match .spec.template.metadata.labels
 serviceName: "nginx"
 replicas: 3 # by default is 1
 template:
   metadata:
     labels:
       app: nginx # has to match .spec.selector.matchLabels
   spec:
     terminationGracePeriodSeconds: 10
     containers:
       - name: nginx
         image: k8s.gcr.io/nginx-slim:0.8
         ports:
           - containerPort: 80
             name: web
         volumeMounts:
           - name: www
             mountPath: /usr/share/nginx/html
 volumeClaimTemplates:
   - metadata:
       name: www
     spec:
       accessModes: [ "ReadWriteOnce" ]
       storageClassName: "alicloud-disk-efficiency"
       resources:
         requests:
           storage: 2Gi
```

奇怪的是，Pod 没有报错
```
➜  /Users/zhouzhengxi/Programming/golang/src/github.com/zzxwill/try-cloudnative/try-kubernetes git:(master) ✗ k get pod
NAME    READY   STATUS    RESTARTS   AGE
web-0   0/1     Pending   0          5m52s
➜  /Users/zhouzhengxi/Programming/golang/src/github.com/zzxwill/try-cloudnative/try-kubernetes git:(master) ✗ k describe pod web-0
Name:           web-0
Namespace:      default
Priority:       0
Node:           <none>
Labels:         app=nginx
                controller-revision-hash=web-6596ffb49b
                statefulset.kubernetes.io/pod-name=web-0
Annotations:    kubernetes.io/psp: ack.privileged
Status:         Pending
IP:
IPs:            <none>
Controlled By:  StatefulSet/web
Containers:
  nginx:
    Image:        k8s.gcr.io/nginx-slim:0.8
    Port:         80/TCP
    Host Port:    0/TCP
    Environment:  <none>
    Mounts:
      /usr/share/nginx/html from www (rw)
      /var/run/secrets/kubernetes.io/serviceaccount from default-token-clfcw (ro)
Volumes:
  www:
    Type:       PersistentVolumeClaim (a reference to a PersistentVolumeClaim in the same namespace)
    ClaimName:  www-web-0
    ReadOnly:   false
  default-token-clfcw:
    Type:        Secret (a volume populated by a Secret)
    SecretName:  default-token-clfcw
    Optional:    false
QoS Class:       BestEffort
Node-Selectors:  <none>
Tolerations:     node.kubernetes.io/not-ready:NoExecute for 300s
                 node.kubernetes.io/unreachable:NoExecute for 300s
Events:          <none>
```


原因，PVC 失败
```
➜  /Users/zhouzhengxi/Programming/golang/src/github.com/zzxwill/try-cloudnative/try-kubernetes git:(master) ✗ k describe pvc www-web-0
Name:          www-web-0
Namespace:     default
StorageClass:  alicloud-disk-topology
Status:        Pending
Volume:
Labels:        app=nginx
Annotations:   volume.beta.kubernetes.io/storage-provisioner: diskplugin.csi.alibabacloud.com
               volume.kubernetes.io/selected-node: cn-hongkong.10.0.1.2
Finalizers:    [kubernetes.io/pvc-protection]
Capacity:
Access Modes:
VolumeMode:    Filesystem
Mounted By:    web-0
Events:
  Type     Reason                Age    From                                                                                          Message
  ----     ------                ----   ----                                                                                          -------
  Normal   WaitForFirstConsumer  6m51s  persistentvolume-controller                                                                   waiting for first consumer to be created before binding
  Warning  ProvisioningFailed    6m51s  diskplugin.csi.alibabacloud.com_iZj6cbvey7lnzx9jiuh336Z_ebb8757f-f98c-42b9-a4c8-f02e6740e0a6  failed to provision volume with StorageClass "alicloud-disk-topology": rpc error: code = Internal desc = SDK.ServerError
ErrorCode: InvalidParameter
Recommend: https://error-center.aliyun.com/status/search?Keyword=InvalidParameter&source=PopGw
RequestId: C539D60A-C626-49AB-855C-6F36139EF76A
Message: The specified parameter "Size" is not valid.
```

根据 https://stackoverflow.com/questions/53476478/persistentvolumeclaim-fails-to-create-on-alicloud-kubernetes/53479574#53479574，云盘至少需要 20GB

更改 sts
```
➜  /Users/zhouzhengxi/Programming/golang/src/github.com/zzxwill/try-cloudnative/try-kubernetes git:(master) ✗ k get pvc
NAME        STATUS   VOLUME                   CAPACITY   ACCESS MODES   STORAGECLASS             AGE
www-web-0   Bound    d-j6cgwkhxi6nj769ebnvx   20Gi       RWO            alicloud-disk-topology   3s
```
sts 成功
```
➜  /Users/zhouzhengxi/Programming/golang/src/github.com/zzxwill/try-cloudnative/try-kubernetes git:(master) ✗ k get sts
NAME   READY   AGE
web    3/3     16m
➜  /Users/zhouzhengxi/Programming/golang/src/github.com/zzxwill/try-cloudnative/try-kubernetes git:(master) ✗ k get pod
NAME    READY   STATUS    RESTARTS   AGE
web-0   1/1     Running   0          16m
web-1   1/1     Running   0          16m
web-2   1/1     Running   0          16m
```
Pod 名字是固定的