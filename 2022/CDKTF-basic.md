# CDK Basic


## Install CDK

```shell
➜  ~ npm install -g cdktf-cli@next
```

Link: https://learn.hashicorp.com/tutorials/terraform/cdktf-install?in=terraform/cdktf

## Start with a CDKTF project

### Init a CDKTF Golang project

```shell
➜  cdktf-go-sample cdktf init --template=go --local
Note: By supplying '--local' option you have chosen local storage mode for storing the state of your stack.
This means that your Terraform state file will be stored locally on disk in a file 'terraform.<STACK NAME>.tfstate' in the root of your project.
? Project Name cdktf-go-sample
? Project Description A simple getting started project for cdktf.
? Do you want to send crash reports to the CDKTF team? See https://www.terraform.io/cdktf/create-and-deploy/configuration-file for more information Yes
go: downloading github.com/hashicorp/terraform-cdk-go/cdktf v0.11.2
go: downloading github.com/aws/constructs-go/constructs/v10 v10.0.105
go: downloading github.com/aws/jsii-runtime-go v1.55.1
go get: upgraded github.com/aws/constructs-go/constructs/v10 v10.0.25 => v10.0.105
========================================================================================================

  Your cdktf go project is ready!

  cat help                Prints this message

  Compile:
    go build              Builds your go project

  Synthesize:
    cdktf synth [stack]   Synthesize Terraform resources to cdktf.out/

  Diff:
    cdktf diff [stack]    Perform a diff (terraform plan) for the given stack

  Deploy:
    cdktf deploy [stack]  Deploy the given stack

  Destroy:
    cdktf destroy [stack] Destroy the given stack

  Learn more about using modules and providers https://cdk.tf/modules-and-providers

========================================================================================================
```

### Create a random ID

Add provider `random` in cdktf.json.

```shell
diff --git a/cdktf.json b/cdktf.json
index c26ab6e..b6723cb 100644
--- a/cdktf.json
+++ b/cdktf.json
@@ -4,7 +4,7 @@
   "codeMakerOutput": "generated",
   "projectId": "4c7a4826-40bb-40a5-ba06-5ba042fa0dac",
   "sendCrashReports": "true",
-  "terraformProviders": [],
+  "terraformProviders": ["random"],
   "terraformModules": [],
   "context": {
     "excludeStackIdFromLogicalIds": "true",
```

```shell
diff --git a/main.go b/main.go
index 4c3d558..e5a2a2c 100644
--- a/main.go
+++ b/main.go
@@ -1,7 +1,9 @@
 package main

 import (
+       "cdk.tf/go/stack/generated/random"
        "github.com/aws/constructs-go/constructs/v10"
+       "github.com/aws/jsii-runtime-go"
        "github.com/hashicorp/terraform-cdk-go/cdktf"
 )

@@ -9,6 +11,8 @@ func NewMyStack(scope constructs.Construct, id string) cdktf.TerraformStack {
        stack := cdktf.NewTerraformStack(scope, &id)

        // The code that defines your stack goes here
+       var length float64 = 5
+       random.NewId(stack, jsii.String("123"), &random.IdConfig{ByteLength: &length})

        return stack
 }
 ```

```shell
➜  cdktf-go-sample git:(master) ✗ cdktf diff

⠙  Synthesizing
[2022-06-22T17:46:14.815] [ERROR] default - panic: "Validation failed with the following errors:\n  [cdktf-go-sample] Found resources without a matching provider. Please make sure to add the following providers to your stack: random"

goroutine 1 [running]:
github.com/aws/jsii-runtime-go/runtime.InvokeVoid({0x11c8be0, 0xc00038e090}, {0x11e4d08, 0x5}, {0x0, 0x0, 0x0})
	/Users/zhouzhengxi/go/pkg/mod/github.com/aws/jsii-runtime-go@v1.55.1/runtime/runtime.go:237 +0x266

[2022-06-22T17:46:14.817] [ERROR] default - github.com/hashicorp/terraform-cdk-go/cdktf.(*jsiiProxy_App).Synth(0x1db5090)
	/Users/zhouzhengxi/go/pkg/mod/github.com/hashicorp/terraform-cdk-go/cdktf@v0.11.2/cdktf.go:673 +0x37
main.main()
	/Users/zhouzhengxi/Programming/golang/src/github.com/zzxwill/cdktf-go-sample/main.go:25 +0x58
cdktf encountered an error while synthesizing

Synth command: go run main.go
Error:         non-zero exit code 1

Command output on stderr:

    panic: "Validation failed with the following errors:\n  [cdktf-go-sample] Found resources without a matching provider. Please make sure to add the following providers to your stack: random"

    goroutine 1 [running]:
    github.com/aws/jsii-runtime-go/runtime.InvokeVoid({0x11c8be0, 0xc00038e090}, {0x11e4d08, 0x5}, {0x0, 0x0, 0x0})
    	/Users/zhouzhengxi/go/pkg/mod/github.com/aws/jsii-runtime-go@v1.55.1/runtime/runtime.go:237 +0x266
    github.com/hashicorp/terraform-cdk-go/cdktf.(*jsiiProxy_App).Synth(0x1db5090)
    	/Users/zhouzhengxi/go/pkg/mod/github.com/hashicorp/terraform-cdk-go/cdktf@v0.11.2/cdktf.go:673 +0x37
    main.main()
    	/Users/zhouzhengxi/Programming/golang/src/github.com/zzxwill/cdktf-go-sample/main.go:25 +0x58
    exit status 2




⠏  Synthesizing
```

Try again.

```shell
➜  cdktf-go-sample git:(master) ✗ cdktf diff
cdktf-go-sample  Initializing the backend...
cdktf-go-sample
                 Successfully configured the backend "local"! Terraform will automatically
                 use this backend unless the backend configuration changes.
cdktf-go-sample  Initializing provider plugins...
cdktf-go-sample  Terraform has been successfully initialized!

                 You may now begin working with Terraform. Try running "terraform plan" to see
                 any changes that are required for your infrastructure. All Terraform commands
                 should now work.

                 If you ever set or change modules or backend configuration for Terraform,
                 rerun this command to reinitialize your working directory. If you forget, other
                 commands will detect it and remind you to do so if necessary.
cdktf-go-sample  No changes. Your infrastructure matches the configuration.

                 Terraform has compared your real infrastructure against your configuration
                 and found no differences, so no changes are needed.
```

But it failed all the time when running `cdktf diff` or `cdktf deploy`.

```shell
➜  cdktf-go-sample git:(master) ✗ cdktf diff

⠼  Synthesizing
[2022-06-30T15:27:58.434] [ERROR] default - panic: "Validation failed with the following errors:\n  [cdktf-go-sample] Found resources without a matching provider. Please make sure to add the following providers to your stack: aws"

goroutine 1 [running]:
github.com/aws/jsii-runtime-go/runtime.InvokeVoid({0x1358e60, 0xc00040c090
[2022-06-30T15:27:58.436] [ERROR] default - }, {0x13a5211, 0x5}, {0x0, 0x0, 0x0})
	/Users/zhouzhengxi/go/pkg/mod/github.com/aws/jsii-runtime-go@v1.55.1/runtime/runtime.go:237 +0x266
github.com/hashicorp/terraform-cdk-go/cdktf.(*jsiiProxy_App).Synth(0x35b1090)
	/Users/zhouzhengxi/go/pkg/mod/github.com/hashicorp/terraform-cdk-go/cdktf@v0.11.2/cdktf.go:673 +0x37
main.main()
	/Users/zhouzhengxi/Programming/golang/src/github.com/zzxwill/cdktf-go-sample/main.go:24 +0x58

cdktf encountered an error while synthesizing

Synth command: go run main.go
Error:         non-zero exit code 1

Command output on stderr:

    panic: "Validation failed with the following errors:\n  [cdktf-go-sample] Found resources without a matching provider. Please make sure to add the following providers to your stack: aws"

    goroutine 1 [running]:
    github.com/aws/jsii-runtime-go/runtime.InvokeVoid({0x1358e60, 0xc00040c090}, {0x13a5211, 0x5}, {0x0, 0x0, 0x0})
    	/Users/zhouzhengxi/go/pkg/mod/github.com/aws/jsii-runtime-go@v1.55.1/runtime/runtime.go:237 +0x266
    github.com/hashicorp/terraform-cdk-go/cdktf.(*jsiiProxy_App).Synth(0x35b1090)
    	/Users/zhouzhengxi/go/pkg/mod/github.com/hashicorp/terraform-cdk-go/cdktf@v0.11.2/cdktf.go:673 +0x37
    main.main()
    	/Users/zhouzhengxi/Programming/golang/src/github.com/zzxwill/cdktf-go-sample/main.go:24 +0x58
    exit status 2




⠦  Synthesizing
```


So using the docker example https://learn.hashicorp.com/tutorials/terraform/cdktf-install?in=terraform/cdktf.

```go
// main.go

package main

import (
	"cdk.tf/go/stack/generated/kreuzwerker/docker"
	"github.com/aws/constructs-go/constructs/v10"
	"github.com/aws/jsii-runtime-go"
	"github.com/hashicorp/terraform-cdk-go/cdktf"
)

func NewMyStack(scope constructs.Construct, id string) cdktf.TerraformStack {
	stack := cdktf.NewTerraformStack(scope, &id)

	docker.NewDockerProvider(stack, jsii.String("docker"), &docker.DockerProviderConfig{})

	dockerImage := docker.NewImage(stack, jsii.String("nginxImage"), &docker.ImageConfig{
		Name:        jsii.String("nginx:latest"),
		KeepLocally: jsii.Bool(false),
	})

	docker.NewContainer(stack, jsii.String("nginxContainer"), &docker.ContainerConfig{
		Image: dockerImage.Latest(),
		Name:  jsii.String("tutorial"),
		Ports: &[]*docker.ContainerPorts{{
			Internal: jsii.Number(80), External: jsii.Number(8000),
		}},
	})

	return stack
}

func main() {
	app := cdktf.NewApp(nil)

	NewMyStack(app, "cdktf-go-sample")

	app.Synth()
}
```

```shell
➜  cdktf-go-sample git:(master) ✗ cdktf deploy
cdktf-go-sample  Initializing the backend...
cdktf-go-sample  Initializing provider plugins...
cdktf-go-sample  - Reusing previous version of kreuzwerker/docker from the dependency lock file
cdktf-go-sample  - Using previously-installed kreuzwerker/docker v2.16.0
cdktf-go-sample  Terraform has been successfully initialized!

                 You may now begin working with Terraform. Try running "terraform plan" to see
                 any changes that are required for your infrastructure. All Terraform commands
                 should now work.

                 If you ever set or change modules or backend configuration for Terraform,
                 rerun this command to reinitialize your working directory. If you forget, other
                 commands will detect it and remind you to do so if necessary.
cdktf-go-sample  Terraform used the selected providers to generate the following execution
                 plan. Resource actions are indicated with the following symbols:
                 + create

                 Terraform will perform the following actions:
cdktf-go-sample    # docker_container.nginxContainer (nginxContainer) will be created
                   + resource "docker_container" "nginxContainer" {
                 + attach           = false
                 + bridge           = (known after apply)
                 + command          = (known after apply)
                 + container_logs   = (known after apply)
                 + entrypoint       = (known after apply)
                 + env              = (known after apply)
                 + exit_code        = (known after apply)
                 + gateway          = (known after apply)
                 + hostname         = (known after apply)
                 + id               = (known after apply)
                 + image            = (known after apply)
                 + init             = (known after apply)
                 + ip_address       = (known after apply)
                 + ip_prefix_length = (known after apply)
                 + ipc_mode         = (known after apply)
                 + log_driver       = (known after apply)
                 + logs             = false
                 + must_run         = true
                 + name             = "tutorial"
                 + network_data     = (known after apply)
                 + read_only        = false
                 + remove_volumes   = true
                 + restart          = "no"
                 + rm               = false
                 + security_opts    = (known after apply)
                 + shm_size         = (known after apply)
                 + start            = true
                 + stdin_open       = false
                 + tty              = false

                 + healthcheck {
                 + interval     = (known after apply)
                 + retries      = (known after apply)
                 + start_period = (known after apply)
                 + test         = (known after apply)
                 + timeout      = (known after apply)
                 }

                 + labels {
                 + label = (known after apply)
                 + value = (known after apply)
                 }

                 + ports {
                 + external = 8000
                 + internal = 80
                 + ip       = "0.0.0.0"
                 + protocol = "tcp"
                 }
                 }

                   # docker_image.nginxImage (nginxImage) will be created
                   + resource "docker_image" "nginxImage" {
                 + id           = (known after apply)
                 + keep_locally = false
                 + latest       = (known after apply)
                 + name         = "nginx:latest"
                 + output       = (known after apply)
                 + repo_digest  = (known after apply)
                 }

                 Plan: 2 to add, 0 to change, 0 to destroy.

                 ─────────────────────────────────────────────────────────────────────────────

                 Saved the plan to: plan

                 To perform exactly these actions, run the following command to apply:
                 terraform apply "plan"

Please review the diff output above for cdktf-go-sample
❯ Approve  Applies the changes outlined in the plan.
  Dismiss
  Stop
```

It succeeded to create a container by CDKTF.

```shell
                 Saved the plan to: plan

                 To perform exactly these actions, run the following command to apply:
                 terraform apply "plan"
cdktf-go-sample  docker_image.nginxImage (nginxImage): Creating...
cdktf-go-sample  docker_image.nginxImage (nginxImage): Still creating... [10s elapsed]
cdktf-go-sample  docker_image.nginxImage (nginxImage): Still creating... [20s elapsed]
cdktf-go-sample  docker_image.nginxImage (nginxImage): Still creating... [30s elapsed]
cdktf-go-sample  docker_image.nginxImage (nginxImage): Still creating... [40s elapsed]
cdktf-go-sample  docker_image.nginxImage (nginxImage): Creation complete after 45s [id=sha256:605c77e624ddb75e6110f997c58876baa13f8754486b461117934b24a9dc3a85nginx:latest]
cdktf-go-sample  docker_container.nginxContainer (nginxContainer): Creating...
cdktf-go-sample  docker_container.nginxContainer (nginxContainer): Creation complete after 1s [id=74c962ae685e9e7948db8f861c8d2302f39d6fed88d08257ae3b187fb6626f25]
cdktf-go-sample
                 Apply complete! Resources: 2 added, 0 changed, 0 destroyed.


No outputs found.
➜  cdktf-go-sample git:(master) ✗ docker ps
CONTAINER ID   IMAGE                  COMMAND                  CREATED          STATUS          PORTS                       NAMES
74c962ae685e   605c77e624dd           "/docker-entrypoint.…"   11 seconds ago   Up 10 seconds   0.0.0.0:8000->80/tcp        tutorial
```

```shell
➜  cdktf-go-sample git:(master) ✗ cdktf destroy
cdktf-go-sample  Initializing the backend...
cdktf-go-sample  Initializing provider plugins...
cdktf-go-sample  - Reusing previous version of kreuzwerker/docker from the dependency lock file
cdktf-go-sample  - Using previously-installed kreuzwerker/docker v2.16.0
cdktf-go-sample  Terraform has been successfully initialized!

                 You may now begin working with Terraform. Try running "terraform plan" to see
                 any changes that are required for your infrastructure. All Terraform commands
                 should now work.

                 If you ever set or change modules or backend configuration for Terraform,
                 rerun this command to reinitialize your working directory. If you forget, other
                 commands will detect it and remind you to do so if necessary.
cdktf-go-sample  docker_image.nginxImage (nginxImage): Refreshing state... [id=sha256:605c77e624ddb75e6110f997c58876baa13f8754486b461117934b24a9dc3a85nginx:latest]
cdktf-go-sample  docker_container.nginxContainer (nginxContainer): Refreshing state... [id=74c962ae685e9e7948db8f861c8d2302f39d6fed88d08257ae3b187fb6626f25]
cdktf-go-sample  Terraform used the selected providers to generate the following execution
                 plan. Resource actions are indicated with the following symbols:
                 - destroy

                 Terraform will perform the following actions:
cdktf-go-sample    # docker_container.nginxContainer (nginxContainer) will be destroyed
                   - resource "docker_container" "nginxContainer" {
                 - attach            = false -> null
                 - command           = [
                 - "nginx",
                 - "-g",
                 - "daemon off;",
                 ] -> null
                 - cpu_shares        = 0 -> null
                 - dns               = [] -> null
                 - dns_opts          = [] -> null
                 - dns_search        = [] -> null
                 - entrypoint        = [
                 - "/docker-entrypoint.sh",
                 ] -> null
                 - env               = [] -> null
                 - gateway           = "172.17.0.1" -> null
                 - group_add         = [] -> null
                 - hostname          = "74c962ae685e" -> null
                 - id                = "74c962ae685e9e7948db8f861c8d2302f39d6fed88d08257ae3b187fb6626f25" -> null
                 - image             = "sha256:605c77e624ddb75e6110f997c58876baa13f8754486b461117934b24a9dc3a85" -> null
                 - init              = false -> null
                 - ip_address        = "172.17.0.2" -> null
                 - ip_prefix_length  = 16 -> null
                 - ipc_mode          = "private" -> null
                 - links             = [] -> null
                 - log_driver        = "json-file" -> null
                 - log_opts          = {} -> null
                 - logs              = false -> null
                 - max_retry_count   = 0 -> null
                 - memory            = 0 -> null
                 - memory_swap       = 0 -> null
                 - must_run          = true -> null
                 - name              = "tutorial" -> null
                 - network_data      = [
                 - {
                 - gateway                   = "172.17.0.1"
                 - global_ipv6_address       = ""
                 - global_ipv6_prefix_length = 0
                 - ip_address                = "172.17.0.2"
                 - ip_prefix_length          = 16
                 - ipv6_gateway              = ""
                 - network_name              = "bridge"
                 },
                 ] -> null
                 - network_mode      = "default" -> null
                 - privileged        = false -> null
                 - publish_all_ports = false -> null
                 - read_only         = false -> null
                 - remove_volumes    = true -> null
                 - restart           = "no" -> null
                 - rm                = false -> null
                 - security_opts     = [] -> null
                 - shm_size          = 64 -> null
                 - start             = true -> null
                 - stdin_open        = false -> null
                 - storage_opts      = {} -> null
                 - sysctls           = {} -> null
                 - tmpfs             = {} -> null
                 - tty               = false -> null

                 - ports {
                 - external = 8000 -> null
                 - internal = 80 -> null
                 - ip       = "0.0.0.0" -> null
                 - protocol = "tcp" -> null
                 }
                 }
cdktf-go-sample    # docker_image.nginxImage (nginxImage) will be destroyed
                   - resource "docker_image" "nginxImage" {
                 - id           = "sha256:605c77e624ddb75e6110f997c58876baa13f8754486b461117934b24a9dc3a85nginx:latest" -> null
                 - keep_locally = false -> null
                 - latest       = "sha256:605c77e624ddb75e6110f997c58876baa13f8754486b461117934b24a9dc3a85" -> null
                 - name         = "nginx:latest" -> null
                 - repo_digest  = "nginx@sha256:0d17b565c37bcbd895e9d92315a05c1c3c9a29f762b011a10c54a66cd53c9b31" -> null
                 }

                 Plan: 0 to add, 0 to change, 2 to destroy.

                 ─────────────────────────────────────────────────────────────────────────────

                 Saved the plan to: plan

                 To perform exactly these actions, run the following command to apply:
                 terraform apply "plan"
cdktf-go-sample  docker_image.nginxImage (nginxImage): Refreshing state... [id=sha256:605c77e624ddb75e6110f997c58876baa13f8754486b461117934b24a9dc3a85nginx:latest]
cdktf-go-sample  docker_container.nginxContainer (nginxContainer): Refreshing state... [id=74c962ae685e9e7948db8f861c8d2302f39d6fed88d08257ae3b187fb6626f25]
cdktf-go-sample  Terraform used the selected providers to generate the following execution
                 plan. Resource actions are indicated with the following symbols:
                 - destroy

                 Terraform will perform the following actions:
cdktf-go-sample    # docker_container.nginxContainer (nginxContainer) will be destroyed
                   - resource "docker_container" "nginxContainer" {
                 - attach            = false -> null
                 - command           = [
                 - "nginx",
                 - "-g",
                 - "daemon off;",
                 ] -> null
                 - cpu_shares        = 0 -> null
                 - dns               = [] -> null
                 - dns_opts          = [] -> null
                 - dns_search        = [] -> null
                 - entrypoint        = [
                 - "/docker-entrypoint.sh",
                 ] -> null
                 - env               = [] -> null
                 - gateway           = "172.17.0.1" -> null
                 - group_add         = [] -> null
                 - hostname          = "74c962ae685e" -> null
                 - id                = "74c962ae685e9e7948db8f861c8d2302f39d6fed88d08257ae3b187fb6626f25" -> null
                 - image             = "sha256:605c77e624ddb75e6110f997c58876baa13f8754486b461117934b24a9dc3a85" -> null
                 - init              = false -> null
                 - ip_address        = "172.17.0.2" -> null
                 - ip_prefix_length  = 16 -> null
                 - ipc_mode          = "private" -> null
                 - links             = [] -> null
                 - log_driver        = "json-file" -> null
                 - log_opts          = {} -> null
                 - logs              = false -> null
                 - max_retry_count   = 0 -> null
                 - memory            = 0 -> null
                 - memory_swap       = 0 -> null
                 - must_run          = true -> null
                 - name              = "tutorial" -> null
                 - network_data      = [
                 - {
                 - gateway                   = "172.17.0.1"
                 - global_ipv6_address       = ""
                 - global_ipv6_prefix_length = 0
                 - ip_address                = "172.17.0.2"
                 - ip_prefix_length          = 16
                 - ipv6_gateway              = ""
                 - network_name              = "bridge"
                 },
                 ] -> null
                 - network_mode      = "default" -> null
                 - privileged        = false -> null
                 - publish_all_ports = false -> null
                 - read_only         = false -> null
                 - remove_volumes    = true -> null
                 - restart           = "no" -> null
                 - rm                = false -> null
                 - security_opts     = [] -> null
                 - shm_size          = 64 -> null
                 - start             = true -> null
                 - stdin_open        = false -> null
                 - storage_opts      = {} -> null
                 - sysctls           = {} -> null
                 - tmpfs             = {} -> null
                 - tty               = false -> null

                 - ports {
                 - external = 8000 -> null
                 - internal = 80 -> null
                 - ip       = "0.0.0.0" -> null
                 - protocol = "tcp" -> null
                 }
                 }
cdktf-go-sample    # docker_image.nginxImage (nginxImage) will be destroyed
                   - resource "docker_image" "nginxImage" {
                 - id           = "sha256:605c77e624ddb75e6110f997c58876baa13f8754486b461117934b24a9dc3a85nginx:latest" -> null
                 - keep_locally = false -> null
                 - latest       = "sha256:605c77e624ddb75e6110f997c58876baa13f8754486b461117934b24a9dc3a85" -> null
                 - name         = "nginx:latest" -> null
                 - repo_digest  = "nginx@sha256:0d17b565c37bcbd895e9d92315a05c1c3c9a29f762b011a10c54a66cd53c9b31" -> null
                 }

                 Plan: 0 to add, 0 to change, 2 to destroy.

cdktf-go-sample  docker_container.nginxContainer (nginxContainer): Destroying... [id=74c962ae685e9e7948db8f861c8d2302f39d6fed88d08257ae3b187fb6626f25]
cdktf-go-sample  docker_container.nginxContainer (nginxContainer): Destruction complete after 1s
cdktf-go-sample  docker_image.nginxImage (nginxImage): Destroying... [id=sha256:605c77e624ddb75e6110f997c58876baa13f8754486b461117934b24a9dc3a85nginx:latest]
cdktf-go-sample  docker_image.nginxImage (nginxImage): Destruction complete after 0s
cdktf-go-sample
                 Destroy complete! Resources: 2 destroyed.


➜  cdktf-go-sample git:(master) ✗ docker ps
```