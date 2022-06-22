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


