---
title: "每天学一点 Go 语言|12. 诡异的 make lint 报错"
date: "2020-07-30"
---

<table class=""><tbody><tr><td>✗ make lint<br>==&gt; Linting /Users/zhouzhengxi/Programming/golang/src/github.com/crossplane/oam-kubernetes-runtime/charts/oam-kubernetes-runtime<br>[INFO] Chart.yaml: icon is recommended<br><br>1 chart(s) linted, no failures<br>17:51:00 [ .. ] verify dependencies have expected content<br>all modules verified<br>17:51:16 [ OK ] go modules dependencies verified<br>17:51:16 [ .. ] golangci-lint<br>test/e2e-test/suite_test.go:39: File is not `goimports`-ed with -local github.com/crossplane/oam-kubernetes-runtime (goimports)<br>"encoding/json"<br>17:51:18 [FAIL]<br>make[1]: *** [go.lint] Error 1<br>make: *** [lint] Error 2</td></tr></tbody></table>

这个一个扯淡的报错，跟 goimports 没什么关系，一般需要这样解决。

gofmt -s -w test/e2e-test/suite\_test.go  

不过这个很诡异，无效。  

把 \`encoding/json\` 移动到合适的位置就好了。

![](https://lh5.googleusercontent.com/j1pNwiofgsI2dlout1gorYp5h1CUfRFjtcRieXg0gAxEwG72Vw81qTVAwqp1G8dA3ixcZyClUFTmXC6l7Hv4rp3nwEK4A2NIhXI5-vvUSf6VLtifmlO7PX9HhZON00BUU3j6LkHR)

<table class=""><tbody><tr><td>✗ make lint<br>==&gt; Linting /Users/zhouzhengxi/Programming/golang/src/github.com/crossplane/oam-kubernetes-runtime/charts/oam-kubernetes-runtime<br>[INFO] Chart.yaml: icon is recommended<br><br>1 chart(s) linted, no failures<br>17:52:01 [ .. ] verify dependencies have expected content<br>all modules verified<br>17:52:17 [ OK ] go modules dependencies verified<br>17:52:17 [ .. ] golangci-lint<br>17:52:21 [ OK ] golangci-lint</td></tr></tbody></table>
