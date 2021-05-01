# 每天学一点-go-语言-090-yaml2struct

Posted on May 1st 2021

---

yaml to struct

```

type Profile struct {
  Region         string `yaml:"region,omitempty"`
  ZoneId         string `yaml:"zoneId,omitempty"`
}
```

主要是 `yaml:` tag
