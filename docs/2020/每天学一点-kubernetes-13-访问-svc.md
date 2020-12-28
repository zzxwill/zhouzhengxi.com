---
title: "每天学一点 Kubernetes | 13. 访问 svc"
date: "2020-07-22"
categories: 
  - "kubernetes"
tags: 
  - "kubernetes"
---

## Service

NodePort 模式的 Service，可以通过 master-ip:node-port 访问，其中，master-ip 可以是任何一个节点。  

<table class=""><tbody><tr><td><strong>$</strong> k get svc app2057 -o=jsonpath='{.spec.ports[0].nodePort}'<br>30850<br><strong><br></strong><strong>$</strong> curl 8.210.133.123:30850<br>&lt;!DOCTYPE html&gt;<br>&lt;html&gt;<br>&lt;head&gt;<br>&lt;title&gt;Welcome to nginx!&lt;/title&gt;<br>&lt;style&gt;<br>&nbsp; &nbsp; body {<br>&nbsp; &nbsp; &nbsp; &nbsp; width: 35em;<br>&nbsp; &nbsp; &nbsp; &nbsp; margin: 0 auto;<br>&nbsp; &nbsp; &nbsp; &nbsp; font-family: Tahoma, Verdana, Arial, sans-serif;<br>&nbsp; &nbsp; }<br>&lt;/style&gt;<br>&lt;/head&gt;<br>&lt;body&gt;<br>&lt;h1&gt;Welcome to nginx!&lt;/h1&gt;<br>&lt;p&gt;If you see this page, the nginx web server is successfully installed and<br>working. Further configuration is required.&lt;/p&gt;<br><br>&lt;p&gt;For online documentation and support please refer to<br>&lt;a href="http://nginx.org/"&gt;nginx.org&lt;/a&gt;.&lt;br/&gt;<br>Commercial support is available at<br>&lt;a href="http://nginx.com/"&gt;nginx.com&lt;/a&gt;.&lt;/p&gt;<br><br>&lt;p&gt;&lt;em&gt;Thank you for using nginx.&lt;/em&gt;&lt;/p&gt;<br>&lt;/body&gt;<br>&lt;/html&gt;</td></tr></tbody></table>
