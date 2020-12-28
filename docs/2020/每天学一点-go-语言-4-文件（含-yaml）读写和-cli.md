---
title: "每天学一点 Go 语言 | 4. 文件（含 Yaml）读写和 CLI"
date: "2020-07-07"
categories: 
  - "golang"
---

Golang 内置 iotuil library 读写文件，其中写文件时，需要制定文件的访问控制码。

ioutil.WriteFile(fileName, c, 0644)

_// WriteFile writes data to a file named by filename._  
_// If the file does not exist, WriteFile creates it with permissions perm;_  
_// otherwise WriteFile truncates it before writing._  
**funcWriteFile**(filename **string**, data \[\]**byte**, perm os.FileMode) **error**

对于 Yaml library，比较推荐 推荐 yaml library: [https://github.com/go-yaml/yaml](https://github.com/go-yaml/yaml)。

yaml.Marshal() 可以把结构体转成自己，然后写入文件。

Golang CLI 挺有意思，最有名的当属一下两个。

<table class=""><tbody><tr><td><a href="https://github.com/spf13/cobra">spf13/cobra</a></td><td>17.6k</td><td>Kubernetes/Etcd/Helm/Docker/OpenShift use it.</td></tr><tr><td><a href="https://github.com/spf13/viper">spf13/viper</a></td><td>12.7k</td><td>Builds on cobra.</td></tr></tbody></table>

云原生时代，比较推荐 spf13/cobra。

今日份学习笔记：[https://docs.google.com/document/d/1G2\_YBa4hZA6huGzwFHNIiYPJ2qlCMZjmieNR\_WZoJaA/edit?usp=sharing](https://docs.google.com/document/d/1G2_YBa4hZA6huGzwFHNIiYPJ2qlCMZjmieNR_WZoJaA/edit?usp=sharing)
