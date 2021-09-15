# 每天学一点-Kubernetes-080-kubebuilder-controller-metrics

Posted on Sept. 15, 2021

---

基础 Prometheus metrics

基于 KubeBuilder 构建的 controller，默认具备一定的 metrics

```
➜  kubevela git:(render-issue) kubectl port-forward --namespace vela-system $(kubectl get pods -n vela-system -o name) 8080:8080
Forwarding from 127.0.0.1:8080 -> 8080
Forwarding from [::1]:8080 -> 8080
Handling connection for 8080
```


访问 http://127.0.0.1:8080/metrics 有不少 metrics

```
# HELP controller_runtime_active_workers Number of currently used workers per controller
# TYPE controller_runtime_active_workers gauge
controller_runtime_active_workers{controller="appdeployment"} 0
controller_runtime_active_workers{controller="application"} 0
controller_runtime_active_workers{controller="approllout"} 0
controller_runtime_active_workers{controller="componentdefinition"} 0
controller_runtime_active_workers{controller="envbinding"} 0
controller_runtime_active_workers{controller="initializer"} 0
controller_runtime_active_workers{controller="oam/containerizedworkload"} 0
controller_runtime_active_workers{controller="oam/healthscope.core.oam.dev"} 0
controller_runtime_active_workers{controller="oam/manualscalertrait"} 0
controller_runtime_active_workers{controller="podspecworkload"} 0
controller_runtime_active_workers{controller="policydefinition"} 0
controller_runtime_active_workers{controller="rollout"} 0
controller_runtime_active_workers{controller="traitdefinition"} 0
controller_runtime_active_workers{controller="workflowstepdefinition"} 0
# HELP controller_runtime_max_concurrent_reconciles Maximum number of concurrent reconciles per controller
# TYPE controller_runtime_max_concurrent_reconciles gauge
controller_runtime_max_concurrent_reconciles{controller="appdeployment"} 1
controller_runtime_max_concurrent_reconciles{controller="application"} 4
controller_runtime_max_concurrent_reconciles{controller="approllout"} 4
controller_runtime_max_concurrent_reconciles{controller="componentdefinition"} 4
controller_runtime_max_concurrent_reconciles{controller="envbinding"} 4
controller_runtime_max_concurrent_reconciles{controller="initializer"} 4
controller_runtime_max_concurrent_reconciles{controller="oam/containerizedworkload"} 1
controller_runtime_max_concurrent_reconciles{controller="oam/healthscope.core.oam.dev"} 1
controller_runtime_max_concurrent_reconciles{controller="oam/manualscalertrait"} 1
controller_runtime_max_concurrent_reconciles{controller="podspecworkload"} 1
controller_runtime_max_concurrent_reconciles{controller="policydefinition"} 4
controller_runtime_max_concurrent_reconciles{controller="rollout"} 4
controller_runtime_max_concurrent_reconciles{controller="traitdefinition"} 4
controller_runtime_max_concurrent_reconciles{controller="workflowstepdefinition"} 1
```
