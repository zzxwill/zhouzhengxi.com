# 每天学一点-Kubernetes-065-delete-terminating-namespace

Posted on July 26, 2021

---


强制删除 namespace

ns terminating，无法删除。

```

​​{
   "apiVersion": "v1",
   "kind": "Namespace",
   "metadata": {
       "annotations": {
           "kubectl.kubernetes.io/last-applied-configuration": "{\"apiVersion\":\"v1\",\"kind\":\"Namespace\",\"metadata\":{\"annotations\":{},\"name\":\"open-cluster-management\"},\"spec\":{},\"status\":{}}\n"
       },
       "creationTimestamp": "2021-07-15T06:42:17Z",
       "deletionTimestamp": "2021-07-15T07:14:49Z",
       "managedFields": [
           {
               "apiVersion": "v1",
               "fieldsType": "FieldsV1",
               "fieldsV1": {
                   "f:metadata": {
                       "f:annotations": {
                           ".": {},
                           "f:kubectl.kubernetes.io/last-applied-configuration": {}
                       }
                   },
                   "f:status": {
                       "f:phase": {}
                   }
               },
               "manager": "k",
               "operation": "Update",
               "time": "2021-07-15T07:38:15Z"
           }
       ],
       "name": "open-cluster-management",
       "resourceVersion": "91106",
       "selfLink": "/api/v1/namespaces/open-cluster-management",
       "uid": "ddaf637a-0f86-4eb9-b034-ca893e22e4d4"
   },
   "spec": {
       "finalizers": [
           "kubernetes"
       ]
   },
   "status": {
       "conditions": [
           {
               "lastTransitionTime": "2021-07-15T07:14:54Z",
               "message": "Discovery failed for some groups, 2 failing: unable to retrieve the complete list of server APIs: admission.cluster.open-cluster-management.io/v1: the server is currently unable to handle the request, admission.work.open-cluster-management.io/v1: the server is currently unable to handle the request",
               "reason": "DiscoveryFailed",
               "status": "True",
               "type": "NamespaceDeletionDiscoveryFailure"
           },
           {
               "lastTransitionTime": "2021-07-15T07:14:55Z",
               "message": "All legacy kube types successfully parsed",
               "reason": "ParsedGroupVersions",
               "status": "False",
               "type": "NamespaceDeletionGroupVersionParsingFailure"
           },
           {
               "lastTransitionTime": "2021-07-15T07:14:55Z",
               "message": "All content successfully deleted, may be waiting on finalization",
               "reason": "ContentDeleted",
               "status": "False",
               "type": "NamespaceDeletionContentFailure"
           },
           {
               "lastTransitionTime": "2021-07-15T07:14:55Z",
               "message": "All content successfully removed",
               "reason": "ContentRemoved",
               "status": "False",
               "type": "NamespaceContentRemaining"
           },
           {
               "lastTransitionTime": "2021-07-15T07:14:55Z",
               "message": "All content-preserving finalizers finished",
               "reason": "ContentHasNoFinalizers",
               "status": "False",
               "type": "NamespaceFinalizersRemaining"
           }
       ],
       "phase": "Terminating"
   }
}

```

--〉 [apiservice](./每天学一点-Kubernetes-064-apiservicemd.md) 被依赖，删掉

https://github.com/helm/helm/issues/6361#issuecomment-538220109


kubectl get apiservice
 
kubectl delete apiservice v1.admission.cluster.open-cluster-management.io

