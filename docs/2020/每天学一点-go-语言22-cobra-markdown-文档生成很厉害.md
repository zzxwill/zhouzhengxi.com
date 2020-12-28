---
title: "每天学一点 Go 语言|22. cobra markdown 文档生成很厉害"
date: "2020-09-14"
tags: 
  - "golang"
---

利用 cobra 内置 doc 库可以非常方便的生成 markdown CLI 文档。

doc.GenMarkdownTree(cmd, "/tmp")

效果参见：

[https://github.com/oam-dev/kubevela/blob/master/documentation/cli/vela.md](https://github.com/oam-dev/kubevela/blob/master/documentation/cli/vela.md)

![](images/image-1024x899.png)
