# 每天学一点-Kubernetes-091-skaffold-chart

Posted on Nov. 14, 2021

---


Skaffold

如果是基于 Chart 开发，需要手动配置

```
apiVersion: skaffold/v2beta17
kind: Config
build:
artifacts:
- image: oamdev/terraform-controller
  deploy:
  helm:
  releases:
    - name: terraform-controller
      chartPath: chart
      namespace: terraform
      skipBuildDependencies: true
      artifactOverrides:
      image: oamdev/terraform-controller
      imageStrategy:
      helm: {}
```

chartPath： chart 文件所在的目录


执行 skaffold dev，可以自动 monitor changes。


