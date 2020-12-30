---
title: "每天学一点 Go 语言|16. 更新 slice 元素"
date: "2020-08-24"
---

更新 slice 元素

方案一：直接操作 slice 的元素

```
package main

import "fmt"

type Response struct {
  Code int `json:"code"`
}

func main() {
  responses := []Response{{Code: 200}, {Code: 500}}
  var newCode = 400
  for i, _ := range responses {
    responses[i].Code = newCode
  }
  fmt.Println(responses)
}
```
方案二：通过 slice 元素的指针操作  

```go
package main

import "fmt"

type Response struct {
  Code int `json:"code"`
}

func main() {
  responses := []Response{{Code: 200}, {Code: 500}}
  var newCode = 400
  for i, _ := range responses {
    responses[i].Code = newCode
  }
  fmt.Println(responses)
}
```