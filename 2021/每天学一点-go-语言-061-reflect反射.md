# 每天学一点-go-语言-061-reflect反射

Posted at Jan 28 2021

---

reflect 是 golang 反射
reflect.TypeOf(rig).PkgPath()

rig 是 golang_rigging.go 一个 struct，返回所在的路径 github.com/cloud-native-application/derrick-go/rigging/golang/templates

```shell
➜  /Users/zhouzhengxi/Programming/golang/src/github.com/cloud-native-application/derrick-go/rigging/golang_rigging git:(master) pwd
/Users/zhouzhengxi/Programming/golang/src/github.com/cloud-native-application/derrick-go/rigging/golang_rigging
➜  /Users/zhouzhengxi/Programming/golang/src/github.com/cloud-native-application/derrick-go/rigging/golang_rigging git:(master) tree -h
.
├── [ 660]  golang_rigging.go
└── [ 224]  templates
├── [ 421]  Dockerfile.j2
├── [1008]  Jenkinsfile.j2
├── [ 136]  docker-compose.yml.j2
└── [ 778]  kubernetes-deployment.yaml.j2
```