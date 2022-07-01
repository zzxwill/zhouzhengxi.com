# Pulumi Basic

[Pulumi](https://www.pulumi.com/), as Universal Infrastructure as Code, can manage cloud resources of various cloud providers
in various programming languages.

There are two ways to use Pulumi:

- by Pulumi CLI
- by Pulumi SDK

## Manage cloud resources by Pulumi CLI

### Create a sample Golang Pulumi application


```shell
➜  pulumi-sample pulumi new aws-go --offline --non-interactive
This command will walk you through creating a new Pulumi project.

Enter a value or leave blank to accept the (default), and press <ENTER>.
Press ^C at any time to quit.

project name: (pulumi-sample)
project description: (A minimal AWS Go Pulumi program)
Created project 'pulumi-sample'

Please enter your desired stack name.
To create a stack in an organization, use the format <org-name>/<stack-name> (e.g. `acmecorp/dev`).
stack name: (dev)
Created stack 'dev'

aws:region: The AWS region to deploy into: (us-east-1)
Saved config

Installing dependencies...

go: downloading github.com/pulumi/pulumi-aws/sdk/v5 v5.7.2
go: downloading github.com/pulumi/pulumi/sdk/v3 v3.34.1
go: downloading google.golang.org/grpc v1.29.1
go: downloading golang.org/x/net v0.0.0-20201021035429-f5854403a974
go: downloading github.com/rivo/uniseg v0.2.0
go: downloading github.com/uber/jaeger-client-go v2.22.1+incompatible
go: downloading github.com/grpc-ecosystem/grpc-opentracing v0.0.0-20180507213350-8e809c8a8645
go: downloading pgregory.net/rapid v0.4.7
go: downloading github.com/pkg/term v1.1.0
go: downloading google.golang.org/protobuf v1.24.0
go: downloading golang.org/x/sys v0.0.0-20210817190340-bfb29a6856f2
go: downloading gopkg.in/yaml.v3 v3.0.0-20200313102051-9f266ea9e77c
go: downloading github.com/djherbis/times v1.2.0
go: downloading github.com/cheggaaa/pb v1.0.18
go: downloading github.com/texttheater/golang-levenshtein v0.0.0-20191208221605-eb6844b05fc6
go: downloading github.com/tweekmonster/luser v0.0.0-20161003172636-3fa38070dbd7
go: downloading github.com/rogpeppe/go-internal v1.8.1
go: downloading github.com/google/go-cmp v0.4.1
go: downloading google.golang.org/genproto v0.0.0-20200608115520-7c474a2e3482
go: downloading github.com/sabhiram/go-gitignore v0.0.0-20180611051255-d3107576ba94
go: downloading github.com/gofrs/uuid v3.3.0+incompatible
go: downloading github.com/mattn/go-runewidth v0.0.8
go: downloading github.com/fatih/color v1.9.0
go: downloading github.com/mattn/go-colorable v0.1.6
go: downloading gopkg.in/check.v1 v1.0.0-20190902080502-41f04d3bba15
Finished installing dependencies

Your new project is ready to go!

To perform an initial deployment, run 'pulumi up'

```

In the main.go, a S3 bucket will be created.

```go
package main

import (
	"github.com/pulumi/pulumi-aws/sdk/v5/go/aws/s3"
	"github.com/pulumi/pulumi/sdk/v3/go/pulumi"
)

func main() {
	pulumi.Run(func(ctx *pulumi.Context) error {
		// Create an AWS resource (S3 Bucket)
		bucket, err := s3.NewBucket(ctx, "my-bucket-20221707", nil)
		if err != nil {
			return err
		}

		// Export the name of the bucket
		ctx.Export("bucketName", bucket.ID())
		return nil
	})
}

```

### Pulumi run

```shell
➜  pulumi-sample pulumi up
Previewing update (dev)

View Live: https://app.pulumi.com/zzxwill/pulumi-sample/dev/previews/e20c5abf-1ba6-4f01-90f4-d276ed65eae9

[resource plugin aws-5.7.2] installing
Downloading plugin: 108.91 MiB / 108.91 MiB [======================] 100.00% 18s
     Type                 Name                Plan       Info
 +   pulumi:pulumi:Stack  pulumi-sample-dev   create
     └─ aws:s3:Bucket     my-bucket-20221707             1 error

Diagnostics:
  aws:s3:Bucket (my-bucket-20221707):
    error: unable to validate AWS AccessKeyID and/or SecretAccessKey - see https://pulumi.io/install/aws.html for details on configuration

```

Export AWS Credentials per the [doc](https://www.pulumi.com/registry/packages/aws/installation-configuration/).

```shell
➜  pulumi-sample pulumi up
Previewing update (dev)

View Live: https://app.pulumi.com/zzxwill/pulumi-sample/dev/previews/a59de987-5e18-4517-bca2-12249164253b

     Type                 Name                Plan
 +   pulumi:pulumi:Stack  pulumi-sample-dev   create
 +   └─ aws:s3:Bucket     my-bucket-20221707  create

Resources:
    + 2 to create

Do you want to perform this update? yes
Updating (dev)

View Live: https://app.pulumi.com/zzxwill/pulumi-sample/dev/updates/1

     Type                 Name                Status
 +   pulumi:pulumi:Stack  pulumi-sample-dev   created
 +   └─ aws:s3:Bucket     my-bucket-20221707  created

Outputs:
    bucketName: "my-bucket-20221707-17c3902"

Resources:
    + 2 created

Duration: 14s

➜  pulumi-sample aws s3 ls
2022-07-01 09:50:04 my-bucket-20221707-17c3902
```

### Destroy

```shell
➜  pulumi-sample pulumi destroy
Previewing destroy (dev)

View Live: https://app.pulumi.com/zzxwill/pulumi-sample/dev/previews/982c76fa-5608-4e33-9f99-0e9fb8f6b4b6

     Type                 Name                Plan
 -   pulumi:pulumi:Stack  pulumi-sample-dev   delete
 -   └─ aws:s3:Bucket     my-bucket-20221707  delete

Outputs:
  - bucketName: "my-bucket-20221707-17c3902"

Resources:
    - 2 to delete

Do you want to perform this destroy? yes
Destroying (dev)

View Live: https://app.pulumi.com/zzxwill/pulumi-sample/dev/updates/2

     Type                 Name                Status
 -   pulumi:pulumi:Stack  pulumi-sample-dev   deleted
 -   └─ aws:s3:Bucket     my-bucket-20221707  deleted

Outputs:
  - bucketName: "my-bucket-20221707-17c3902"

Resources:
    - 2 deleted

Duration: 10s

The resources in the stack have been deleted, but the history and configuration associated with the stack are still maintained.
If you want to remove the stack completely, run 'pulumi stack rm dev'.
```

## Manage cloud resources by Pulumi SDK

Pulumi commands like `pulumi up`, `pulumi destroy` are supported in [Pulumi SDK](https://pkg.go.dev/github.com/pulumi/pulumi/sdk/v3/go/auto#pkg-overview).

Then how do the Pulumi cloud resources management repos are called by the SDK. Here are so many ways to call it.

https://github.com/pulumi/automation-api-examples#go-examples

### Go Examples

Example   | Description |
--------- | --------- |
[Git Repo](go/git_repo_program) | Use Automation API with a Pulumi program from a git repo. In this case a static S3 website from the [Pulumi examples repo](https://github.com/pulumi/examples/tree/master/aws-go-s3-folder).
[Inline Program](go/inline_program) | Use Automation API with an `inline` Pulumi program. Inline programs are self contained in a single `main.go` and support full debugging capabilities. In this demo we deploy the same static S3 website adapted from the [Pulumi examples repo](https://github.com/pulumi/examples/tree/master/aws-go-s3-folder).
[Local Program](go/local_program) | This example shows how to use Automation API with an existing traditional CLI-driven Pulumi program. We add an Automation API deployment program to our Fargate program that deploys a web service via a Fargate task behind a load balancer.
[Inline/Local Hybrid Program](go/inline_local_hybrid) | This example shows how to refactor your infrastructure to get the best of both worlds, a debuggable `inline` program that can still be driven by the Pulumi CLI for convenience (one-off deployments, inspecting the stack, retrieving outputs, etc). In this example we deploy an S3 static website. The `automation/main.go` is fully debuggable, including the shared deployment function. The stack can also be managed via the CLI program in `cli/main.go`.
[Multi-Stack Orchestration](go/multi_stack_orchestration) | This example shows how to use Automation API to tame the complexity of multiple stacks with dependent stack outputs. We decompose our S3 static website into two stacks, one that manages the bucket, and another that manages the `index.html` file. Both of these are defined as inline programs, and are deployed and destroyed together via a single `main.go`
[Pulumi Over HTTP - Infra as RESTful resources](go/pulumi_over_http) | This application demonstrates how to run Automation API in an HTTP server to expose infrastructure as RESTful resources. In our case, we've defined and exposed a static website `site` that exposes all of the `CRUD` operations plus list. Users can hit our REST endpoint and create custom static websites by specifying the `content` field in the `POST` body. All of our infrastructure is defined in `inline` programs that are constructed and altered on the fly based on input parsed from user-specified `POST` bodies.
[Database Migration](go/database_migration) | This example provisions an AWS Aurora SQL database and executes a database "migration" using the resulting connection info. This migration creates a table, inserts a few rows of data, and reads the data back to verify the setup. This is all done in a single program using an `inline` Pulumi program. With Automation API you can orchestrate complex workflows that go beyond infrastructure provisioning and into application management, database setup, etc.
[Cloud-backed Secret Provider](go/inline_secrets_provider) | This example demonstrates an inline program using a cloud-backed (KMS) secret provider.
[Passphrase Secret Provider](go/inline_passphrase_secrets_provider) | This example demonstrates an inline program using a passphrase secret provider.

Let's take the [Inline Program](https://github.com/pulumi/automation-api-examples/tree/main/go/inline_program) as an example.

The AWS S3 bucket code can be inlined in the SDK calling program as https://github.com/pulumi/automation-api-examples/blob/main/go/inline_program/main.go#L28-L82.





