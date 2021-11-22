# Learn-a-little-Kubernetes-everyday-092-terraform-type-conversion

Posted on Nov. 22, 2021

---

>Terraform automatically converts number and bool values to strings when needed. It also converts strings to numbers or
> bools, as long as the string contains a valid representation of a number or bool value.

number/bool -> string  and string → number/bool can be converted.

So this variable works.
```
variable "bandwidth" {
description = "Maximum bandwidth to the elastic public network, measured in Mbps (Mega bit per second)."
//  type = number
default = "5"
}
```



