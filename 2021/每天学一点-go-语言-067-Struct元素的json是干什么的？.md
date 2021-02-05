# 每天学一点-go-语言-067-Struct元素的json是干什么的？

Posted on Feb 4 2021

---

Struct json 是做什么用的？

```go

package main

import (
	"encoding/json"
	"fmt"
	"log"
	"os"
	"time"
)

type User struct {
	Name          string
	Password      string    `json:"password"`
	PreferredFish []string  `json:"preferred_fish"`
	CreatedAt     time.Time `json:"createdAt"`
}

func main() {
	u := &User{
		Name:      "Sammy the Shark",
		Password:  "fisharegreat",
		CreatedAt: time.Now(),
	}

	out, err := json.MarshalIndent(u, "", "  ")
	if err != nil {
		log.Println(err)
		os.Exit(1)
	}

	fmt.Println(string(out))
}

# output
{
"Name": "Sammy the Shark",
"password": "fisharegreat",
"preferred_fish": null,
"createdAt": "2009-11-10T23:00:00Z"
}

```
根据 json 来看，Struct 转换成 JSON，如果 Struct 某个 filed 不写 `json`，那么生成的 key 就是该 filed 的字符串，如果写了，就按照 json 的名字来。

