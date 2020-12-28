---
title: "每天学一点 Go 语言|28. imports 如何优化排序？"
date: "2020-10-22"
tags: 
  - "golang"
---

goimports reorg

![](https://lh6.googleusercontent.com/3pqlUz426CZ4X9_IzY-FHQYyh1wNPg2EtxpZlBv8hy21wSyKXJsv8-RBueBL7RNeZfz4yO8ZFBZjKUcOfEAt9jh6Fn0poPv1hLCoun7buqEGmH1lwa_f3FknICNMOToUhZww-ZGJ)

上面是 Goland IDE 自动排序的 go imports 包，如果需要比较专业，参考截图里的评论，然后执行如下语句：

goimports -w pkg/controller/v1alpha1/autoscaler
