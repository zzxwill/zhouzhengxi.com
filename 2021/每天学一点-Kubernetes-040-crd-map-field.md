# 每天学一点-Kubernetes-039-generic-secret

Posted on Apr. 12 2021

---

generic secret

Opaque is the default Secret type if omitted from a Secret configuration file. When you create a Secret using kubectl, you will use the generic subcommand to indicate an Opaque Secret type.

```shell

k create secret generic alibaba-account-creds -n crossplane-system --from-literal=name=xxxxxx --from-literal=region=yyyyyy


[root@iZj6cc54ecpc3pm8t9yctuZ ~]# k get secret/alibabam -o yaml
apiVersion: v1
data:
name: eHh4eHh4
region: eXl5eXl5
kind: Secret
metadata:
creationTimestamp: "2021-04-12T13:49:14Z"
name: alibabam
namespace: default
resourceVersion: "10237832"
selfLink: /api/v1/namespaces/default/secrets/alibabam
uid: bf0e6c8a-c878-4fca-80b8-8372cfc30ae8
type: Opaque

```

