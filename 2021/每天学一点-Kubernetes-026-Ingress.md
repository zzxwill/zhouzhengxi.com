# 每天学一点-Kubernetes-026-Ingress.md

Posted at Jan 25 2021

---

Ingress 是用来将集群内 Pod 提供的服务暴露给集群外部。

Ingress 资源有非常多的 Ingress 控制器：

- 官方 

AWS, GCE, and nginx ingress controllers

- 第三方
```text
AKS Application Gateway Ingress Controller is an ingress controller that configures the Azure Application Gateway.
Ambassador API Gateway is an Envoy-based ingress controller.
Apache APISIX ingress controller is an Apache APISIX-based ingress controller.
Avi Kubernetes Operator provides L4-L7 load-balancing using VMware NSX Advanced Load Balancer.
The Citrix ingress controller works with Citrix Application Delivery Controller.
Contour is an Envoy based ingress controller.
F5 BIG-IP Container Ingress Services for Kubernetes lets you use an Ingress to configure F5 BIG-IP virtual servers.
Gloo is an open-source ingress controller based on Envoy, which offers API gateway functionality.
HAProxy Ingress is an ingress controller for HAProxy.
The HAProxy Ingress Controller for Kubernetes is also an ingress controller for HAProxy.
Istio Ingress is an Istio based ingress controller.
The Kong Ingress Controller for Kubernetes is an ingress controller driving Kong Gateway.
The NGINX Ingress Controller for Kubernetes works with the NGINX webserver (as a proxy).
Skipper HTTP router and reverse proxy for service composition, including use cases like Kubernetes Ingress, designed as a library to build your custom proxy.
The Traefik Kubernetes Ingress provider is an ingress controller for the Traefik proxy.
Voyager is an ingress controller for HAProxy.
```

https://kubernetes.io/docs/concepts/services-networking/ingress-controllers/

