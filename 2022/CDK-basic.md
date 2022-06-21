# CDK Basic


## Install CDK

```shell
➜  ~ npm install -g aws-cdk

added 2 packages, and audited 3 packages in 5s

found 0 vulnerabilities
```

Link: https://www.youtube.com/watch?v=v1U_6Dq6wog

## 


```shell
➜  cdk-go-sample cdk init sample-app --language=go
Applying project template sample-app for go
# Welcome to your CDK Go project!

This is a blank project for Go development with CDK.

**NOTICE**: Go support is still in Developer Preview. This implies that APIs may
change while we address early feedback from the community. We would love to hear
about your experience through GitHub issues.

## Useful commands

 * `cdk deploy`      deploy this stack to your default AWS account/region
 * `cdk diff`        compare deployed stack with current state
 * `cdk synth`       emits the synthesized CloudFormation template
 * `go test`         run unit tests

Initializing a new git repository...
hint: Using 'master' as the name for the initial branch. This default branch name
hint: is subject to change. To configure the initial branch name to use in all
hint: of your new repositories, which will suppress this warning, call:
hint:
hint: 	git config --global init.defaultBranch <name>
hint:
hint: Names commonly chosen instead of 'master' are 'main', 'trunk' and
hint: 'development'. The just-created branch can be renamed via this command:
hint:
hint: 	git branch -m <name>
✅ All done!
```

```shell
➜  cdk-go-sample git:(master) ✗ go mod tidy

```

```shell
➜  cdk-go-sample git:(master) ✗ cdk deploy

✨  Synthesis time: 45.96s

current credentials could not be used to assume 'arn:aws:iam::753387532736:role/cdk-hnb659fds-lookup-role-753387532736-us-east-1', but are for the right account. Proceeding anyway.
(To get rid of this warning, please upgrade to bootstrap version >= 8)
current credentials could not be used to assume 'arn:aws:iam::753387532736:role/cdk-hnb659fds-deploy-role-753387532736-us-east-1', but are for the right account. Proceeding anyway.

User: arn:aws:iam::753387532736:user/terraform is not authorized to perform: cloudformation:DescribeStacks on resource: arn:aws:cloudformation:us-east-1:753387532736:stack/CdkGoSampleStack/* because no identity-based policy allows the cloudformation:DescribeStacks action
```

Authorize the permissions for CloudFormation and try again.