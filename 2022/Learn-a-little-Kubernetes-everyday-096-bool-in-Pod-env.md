# Learn-a-little-Kubernetes-everyday-096-bool-in-Pod-env

Posted on Feb. 17, 2022

---

How to set a bool value in an environment variable in a Pod?

Deployment has a `false` env and apply it to a Kubernetes cluster.
```yaml
   spec:
      containers:
      - env:
        - name: CONTROLLER_NAMESPACE
          valueFrom:
            fieldRef:
              apiVersion: v1
              fieldPath: metadata.namespace
        - name: TERRAFORM_IMAGE
          value: oamdev/docker-terraform:1.0.9
        - name: TERRAFORM_BACKEND_NAMESPACE
          value: vela-system
        - name: BUSYBOX_IMAGE
          value: busybox:latest
        - name: GIT_IMAGE
          value: alpine/git:latest
        - name: GITHUB_BLOCKED
          value: false
```

An error as below will occur.
```shell
➜  terraform-controller helm install terraform-controller . -n terraform --debug
install.go:172: [debug] Original chart version: ""
install.go:189: [debug] CHART PATH: /Users/zhouzhengxi/Downloads/terraform-controller

client.go:108: [debug] creating 1 resource(s)
install.go:141: [debug] CRD configurations.terraform.core.oam.dev is already present. Skipping.
client.go:108: [debug] creating 1 resource(s)
install.go:141: [debug] CRD providers.terraform.core.oam.dev is already present. Skipping.
client.go:108: [debug] creating 4 resource(s)
Error: Deployment in version "v1" cannot be handled as a Deployment: v1.Deployment.Spec: v1.DeploymentSpec.Template: v1.PodTemplateSpec.Spec: v1.PodSpec.Containers: []v1.Container: v1.Container.Env: []v1.EnvVar: v1.EnvVar.Value: ReadString: expects " or n, but found f, error found in #10 byte of ...|,"value":false}],"im|..., bigger context ...|ne/git:latest"},{"name":"GITHUB_BLOCKED","value":false}],"image":"oamdev/terraform-controller:0.2.15|...
helm.go:94: [debug] Deployment in version "v1" cannot be handled as a Deployment: v1.Deployment.Spec: v1.DeploymentSpec.Template: v1.PodTemplateSpec.Spec: v1.PodSpec.Containers: []v1.Container: v1.Container.Env: []v1.EnvVar: v1.EnvVar.Value: ReadString: expects " or n, but found f, error found in #10 byte of ...|,"value":false}],"im|..., bigger context ...|ne/git:latest"},{"name":"GITHUB_BLOCKED","value":false}],"image":"oamdev/terraform-controller:0.2.15|...
```

Fix it as below:
```github
        - name: GITHUB_BLOCKED
-         value: false
+         value: 'false'
```


