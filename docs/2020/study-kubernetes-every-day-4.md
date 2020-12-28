---
title: "每天学一点 Kubernetes | 4.  Kubernetes Operator 开始入门"
date: "2020-07-02"
categories: 
  - "kubernetes"
tags: 
  - "kubernetes"
---

## 定义

Operator 是一种 CRD controller，是 Kubernetes core workload controller 的一种扩展。

## 开发 Operator

### Kubebuilder

参考：[https://book.kubebuilder.io/quick-start.html](https://book.kubebuilder.io/quick-start.html)  

一直想写一个 Alibaba Cloud ECS instance 部署的 Kubernetes Operator。

目前只有一个能力，就是创建 ECS 实例，还做不到删除。  

<table class=""><tbody><tr><td>kubebuilder init --domain zhouzhengxi.com<br>kubebuilder create api --group alibabacloud --version v1alpha1 --kind ECSInstance<br><strong><br></strong><strong>#</strong> 生成 crd config/crd/bases/alibabacloud.zhouzhengxi.com_ecsinstances.yaml<br>➜&nbsp; /Users/zhouzhengxi/Programming/golang/src/github.com/zzxwill/aliyun-ecs-k8s-operator make manifests<br>go: creating new go.mod: module tmp<br>go: finding sigs.k8s.io/controller-tools/cmd v0.2.5<br>go: finding sigs.k8s.io/controller-tools/cmd/controller-gen v0.2.5<br>go: finding sigs.k8s.io v0.2.5<br>/Users/zhouzhengxi/Programming/golang/bin/controller-gen "crd:trivialVersions=true" rbac:roleName=manager-role webhook paths="./..." output:crd:artifacts:config=config/crd/bases</td></tr></tbody></table>

api/v1alpha1/ecsinstance\_types.go   # CRD 参数

controllers/ecsinstance\_controller.go # controller 逻辑，很简单。  

<table class=""><tbody><tr><td><strong>func</strong> (r *ECSInstanceReconciler) <strong>Reconcile</strong>(req ctrl.Request) (ctrl.Result, error) {<br>&nbsp; ctx := context.Background()<br>&nbsp; log := r.Log.WithValues("ecsinstance", req.NamespacedName)<br><br>&nbsp; <em>// your logic here</em><br>&nbsp; ecsInstance := &amp;alibabacloudv1alpha1.ECSInstance{}<br><br>&nbsp; <strong>if</strong> err := r.Get(ctx, req.NamespacedName, ecsInstance); err != nil {<br>&nbsp; &nbsp; <strong>if</strong> err := client.IgnoreNotFound(err); err != nil {<br>&nbsp; &nbsp; &nbsp; &nbsp; log.Info("AAAAAAAAAAAA")<br>&nbsp; &nbsp; &nbsp; &nbsp; <strong>return</strong> ctrl.Result{}, nil<br>&nbsp; &nbsp; } <strong>else</strong> {<br>&nbsp; &nbsp; &nbsp; &nbsp; log.Info("BBBBBBBBBBBB")<br>&nbsp; &nbsp; &nbsp; &nbsp; <strong>return</strong> ctrl.Result{}, err<br>&nbsp; &nbsp; }<br>&nbsp; }<br><br>&nbsp; accessKeyID := "xxx"<br>&nbsp; accessKeySecret := "yyy"<br><br>&nbsp; regionID := ecsInstance.Spec.RegionID<br><br>&nbsp; client, err := ecs.NewClientWithAccessKey(regionID, accessKeyID, accessKeySecret)<br><br>&nbsp; request := ecs.CreateCreateInstanceRequest()<br>&nbsp; request.Scheme = "https"<br><br>&nbsp; request.InstanceType = ecsInstance.Spec.InstanceType<br>&nbsp; request.ImageId = ecsInstance.Spec.ImageID<br>&nbsp; request.InstanceName = ecsInstance.Spec.InstanceName<br><br>&nbsp; response, err := client.CreateInstance(request)<br><br>&nbsp; <strong>if</strong> err != nil {<br>&nbsp; &nbsp; log.Error(err, "Failed to create an instance")<br>&nbsp; } <strong>else</strong> {<br>&nbsp; &nbsp; log.Info(response.String())<br>&nbsp; &nbsp; ecsInstance.Status.InstanceID = response.InstanceId<br>&nbsp; }<br><br>&nbsp; <strong>return</strong> ctrl.Result{}, nil<br>}</td></tr></tbody></table>

<table class=""><tbody><tr><td><strong>#</strong> 安装 crd&nbsp; 也就是 go run ./main.go<br>➜&nbsp; /Users/zhouzhengxi/Programming/golang/src/github.com/zzxwill/aliyun-ecs-k8s-operator make install<br>go: creating new go.mod: module tmp<br>go: finding sigs.k8s.io v0.2.5<br>go: finding sigs.k8s.io/controller-tools/cmd/controller-gen v0.2.5<br>go: finding sigs.k8s.io/controller-tools/cmd v0.2.5<br>/Users/zhouzhengxi/Programming/golang/bin/controller-gen "crd:trivialVersions=true" rbac:roleName=manager-role webhook paths="./..." output:crd:artifacts:config=config/crd/bases<br>kustomize build config/crd | kubectl apply -f -<br>customresourcedefinition.apiextensions.k8s.io/ecsinstances.alibabacloud.zhouzhengxi.com created<br><br>k get crd | grep zhouzhengxi<br>ecsinstances.alibabacloud.zhouzhengxi.com&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 2020-07-02T14:52:33Z<br><strong><br></strong><strong>#</strong> 运行 crd，创建 ecs<br>➜&nbsp; /Users/zhouzhengxi/Programming/golang/src/github.com/zzxwill/aliyun-ecs-k8s-operator cat config/samples/alibabacloud_v1alpha1_ecsinstance.yaml<br>apiVersion: alibabacloud.zhouzhengxi.com/v1alpha1<br>kind: ECSInstance<br>metadata:<br>&nbsp; name: ecsinstance-sample<br>spec:<br>&nbsp; imageID: centos_7_8_x64_20G_alibase_20200519.vhd<br>&nbsp; instanceType: ecs.g6.large<br>&nbsp; regionID: cn-beijing<br>&nbsp; instanceName: ins-0702<br>➜&nbsp; /Users/zhouzhengxi/Programming/golang/src/github.com/zzxwill/aliyun-ecs-k8s-operator k apply -f config/samples/alibabacloud_v1alpha1_ecsinstance.yaml<br>ecsinstance.alibabacloud.zhouzhengxi.com/ecsinstance-sample configured<br><br>➜&nbsp; /Users/zhouzhengxi/Programming/golang/src/github.com/zzxwill/aliyun-ecs-k8s-operator k get ecsinstance<br>NAME &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; AGE<br>ecsinstance-sample &nbsp; 107s</td></tr></tbody></table>

源代码见：[https://github.com/zzxwill/aliyun-ecs-k8s-operator](https://github.com/zzxwill/aliyun-ecs-k8s-operator)

今日 Kubernetes 学习笔记：[https://docs.google.com/document/d/19XbStAISCGkO\_CPTK9ACNr5lNEfPcls-2gZdYlA7tZ0/edit?usp=sharing](https://docs.google.com/document/d/19XbStAISCGkO_CPTK9ACNr5lNEfPcls-2gZdYlA7tZ0/edit?usp=sharing)
