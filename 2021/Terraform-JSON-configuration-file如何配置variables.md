# Terraform JSON configuration file 如何配置 variables

Posted on Mar 31 2021

---

## Issue

```shell
➜  /Users/zhouzhengxi/Programming/golang/src/github.com/zzxwill/terraform-controller/examples/poc git:(master) ✗ cat oss.tf.json
{
  "resource": {
    "alicloud_oss_bucket": {
      "bucket-acl": {
        "bucket": "${var.bucket}",
        "acl": "private"
      }
    }
  },
  "output": {
    "BUCKET_NAME": {
      "value": "${alicloud_oss_bucket.bucket-acl.bucket}.${alicloud_oss_bucket.bucket-acl.extranet_endpoint}"
    }
  },
}
                                                                                                                                                                                                                              
                                                                                                                                                                                                                              
➜  /Users/zhouzhengxi/Programming/golang/src/github.com/zzxwill/terraform-controller/examples/poc git:(master) ✗ cat terraform.tfvars.json
{
    "bucket": "vela-website2"
}
```


```
➜  /Users/zhouzhengxi/Programming/golang/src/github.com/zzxwill/terraform-controller/examples/poc git:(master) ✗ t plan

Error: Reference to undeclared input variable

on oss.tf.json line 5, in resource.alicloud_oss_bucket.bucket-acl:
5:         "bucket": "${var.bucket}",

An input variable with the name "bucket" has not been declared. This variable
can be declared with a variable "bucket" {} block.
```

## 原因

oss.tf.json 里必须包含 variables 的定义，也就是：

```shell
➜  /Users/zhouzhengxi/Programming/golang/src/github.com/zzxwill/terraform-controller/examples/poc git:(master) ✗ cat oss.tf.json
{
  "resource": {
    "alicloud_oss_bucket": {
      "bucket-acl": {
        "bucket": "${var.bucket}",
        "acl": "private"
      }
    }
  },
  "output": {
    "BUCKET_NAME": {
      "value": "${alicloud_oss_bucket.bucket-acl.bucket}.${alicloud_oss_bucket.bucket-acl.extranet_endpoint}"
    }
  },
  "variable": {
    "bucket": {
      "default": "vela-website"
    }
  }
}

```

## 结论

oss.tf.json 里必须有 variable 定义才能被 terraform.tfvars.json 和 环境变量覆盖。

环境变量：
```shell
export TF_VAR_bucket=aaa
```

覆盖能力从大到小

terraform.tfvars.json > TF_VAR_xxx > oss.tf.json 里的 variable 变量