# 每天学一点-Kubernetes-081-Prometheus-scrape_configs配置

Posted on Sept. 17, 2021

---

Prometheus scrape_configs 配置
## 1) 直接配置 /etc/config/prometheus

```


global:
  scrape_interval: 1m
  scrape_timeout: 10s
  evaluation_interval: 1m
alerting:
  alertmanagers:
  - authorization:
      type: Bearer
      credentials_file: /var/run/secrets/kubernetes.io/serviceaccount/token
    tls_config:
      ca_file: /var/run/secrets/kubernetes.io/serviceaccount/ca.crt
      insecure_skip_verify: false
    follow_redirects: true
    scheme: http
    timeout: 10s
    api_version: v2
    relabel_configs:
    - source_labels: [__meta_kubernetes_namespace]
      separator: ;
      regex: observability
      replacement: $1
      action: keep
    - source_labels: [__meta_kubernetes_pod_label_app]
      separator: ;
      regex: prometheus
      replacement: $1
      action: keep
    - source_labels: [__meta_kubernetes_pod_label_component]
      separator: ;
      regex: alertmanager
      replacement: $1
      action: keep
    - source_labels: [__meta_kubernetes_pod_annotation_prometheus_io_probe]
      separator: ;
      regex: .*
      replacement: $1
      action: keep
    - source_labels: [__meta_kubernetes_pod_container_port_number]
      separator: ;
      regex: "9093"
      replacement: $1
      action: keep
    kubernetes_sd_configs:
    - role: pod
      follow_redirects: true
rule_files:
- /etc/config/recording_rules.yml
- /etc/config/alerting_rules.yml
- /etc/config/rules
- /etc/config/alerts
scrape_configs:
- job_name: prometheus
  honor_timestamps: true
  scrape_interval: 1m
  scrape_timeout: 10s
  metrics_path: /metrics
  scheme: http
  follow_redirects: true
  static_configs:
  - targets:
    - localhost:9090
- job_name: kubernetes-apiservers
  honor_timestamps: true
  scrape_interval: 1m
  scrape_timeout: 10s
  metrics_path: /metrics
  scheme: https
  authorization:
    type: Bearer
    credentials_file: /var/run/secrets/kubernetes.io/serviceaccount/token
  tls_config:
    ca_file: /var/run/secrets/kubernetes.io/serviceaccount/ca.crt
    insecure_skip_verify: true
  follow_redirects: true
  relabel_configs:
  - source_labels: [__meta_kubernetes_namespace, __meta_kubernetes_service_name, __meta_kubernetes_endpoint_port_name]
    separator: ;
    regex: default;kubernetes;https
    replacement: $1
    action: keep
  kubernetes_sd_configs:
  - role: endpoints
    follow_redirects: true

```
如增加 kubevela

```
- job_name: 'kubevela'
 metrics_path: /metrics
 static_configs:
   - targets:
       - 172.20.3.80:8080
```

```
➜  obervability git:(observability) ✗ k get pod -n vela-system -o wide
NAME                                  READY   STATUS    RESTARTS   AGE    IP            NODE                      NOMINATED NODE   READINESS GATES
kubevela-vela-core-6d76645bc5-tz5p5   1/1     Running   0          3d8h   172.20.3.80   cn-hongkong.10.2.178.59   <none>           <none>
```


对于 Prometheus 可以直接设置其 values

https://github.com/prometheus-community/helm-charts/blob/d11b2d8f447b5dc6cc86776dc20840f8b773fc8f/charts/prometheus/values.yaml#L1703-L1717


示例：
```
extraScrapeConfigs: |
 - job_name: 'kubevela'
   metrics_path: "/metrics"
   static_configs:
     - targets:
         - "172.20.3.80:8080"
```


# 2) 给待监控的 Pod 打 annotations

```
- job_name: kubernetes-pods
  honor_timestamps: true
  scrape_interval: 1m
  scrape_timeout: 10s
  metrics_path: /metrics
  scheme: http
  follow_redirects: true
  relabel_configs:
  - source_labels: [__meta_kubernetes_pod_annotation_prometheus_io_scrape]
    separator: ;
    regex: "true"
    replacement: $1
    action: keep
  - source_labels: [__meta_kubernetes_pod_annotation_prometheus_io_scheme]
    separator: ;
    regex: (https?)
    target_label: __scheme__
    replacement: $1
    action: replace
  - source_labels: [__meta_kubernetes_pod_annotation_prometheus_io_path]
    separator: ;
    regex: (.+)
    target_label: __metrics_path__
    replacement: $1
    action: replace
  - source_labels: [__address__, __meta_kubernetes_pod_annotation_prometheus_io_port]
    separator: ;
    regex: ([^:]+)(?::\d+)?;(\d+)
    target_label: __address__
    replacement: $1:$2
    action: replace
```

就是在待监控的 pod 上打上 annotation

```
prometheus_io_scrape=true
prometheus_io_scheme=http
prometheus_io_path=/metrics

```