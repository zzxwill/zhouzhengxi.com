---
title: "每天学一点 Kubernetes | 14. 简单 kubernets client"
date: "2020-07-31"
categories: 
  - "kubernetes"
tags: 
  - "kubernetes"
---

Kubernetes Client  

使用很简单。

<table class=""><tbody><tr><td><strong>package</strong> main<br><br><strong>import</strong> (<br>&nbsp; "context"<br>&nbsp; "fmt"<br>&nbsp; corev1 "k8s.io/api/core/v1"<br>&nbsp; "sigs.k8s.io/controller-runtime/pkg/client"<br>&nbsp; "sigs.k8s.io/controller-runtime/pkg/client/config"<br>)<br><br><strong>func</strong> <strong>createKubernetesClient</strong>() (client.Client, error) {<br>&nbsp; c, err := client.New(config.GetConfigOrDie(), client.Options{})<br>&nbsp; <strong>return</strong> c, err<br>}<br><br><strong>func</strong> <strong>main</strong>() {<br>&nbsp; <strong>var</strong> podList corev1.PodList<br>&nbsp; <strong>if</strong> c, err := createKubernetesClient(); err == nil {<br>&nbsp; &nbsp; <strong>if</strong> err := c.List(context.Background(), &amp;podList, client.InNamespace("default")); err == nil {<br>&nbsp; &nbsp; &nbsp; &nbsp; <strong>for</strong> _, p := <strong>range</strong> podList.Items {<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; fmt.Println(p.Name)<br>&nbsp; &nbsp; &nbsp; &nbsp; }<br>&nbsp; &nbsp; }<br>&nbsp; }<br>}<br><br><br><br>cool-aryabhata-v0fnxq6-788767b7f5-rgfvn<br>hello-deployment-c51e9e6b-5f6d956ffd-frghr<br>hello-deployment-c51e9e6b-5f6d956ffd-wz8f5<br>nginx<br>quirky-yalow-v0g8jds-6bcd485cfb-xrqms<br>relaxed-pasteur-v0lplb4-75b9cd464-xks9d<br>web<br><br></td></tr></tbody></table>
