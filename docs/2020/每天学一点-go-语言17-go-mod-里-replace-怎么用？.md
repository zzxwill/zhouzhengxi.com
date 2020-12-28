---
title: "每天学一点 Go 语言|17. go.mod 里 replace 怎么用？"
date: "2020-08-24"
tags: 
  - "golang"
---

### replace

<table class=""><tbody><tr><td>module github.com/zzxwill/homework<br><br><strong>go</strong> 1.13<br><br>require (<br>&nbsp; github.com/fatih/color v1.9.0 <em>// indirect</em><br>&nbsp; github.com/gosuri/uitable v0.0.4<br>&nbsp; github.com/imdario/mergo v0.3.10 <em>// indirect</em><br>&nbsp; github.com/mattn/<strong>go</strong>-runewidth v0.0.9 <em>// indirect</em><br>&nbsp; github.com/zzxwill/rudrx v0.0.1-alpha<br>&nbsp; golang.org/x/crypto v0.0.0-20200709230013-948cd5f35899 <em>// indirect</em><br>&nbsp; golang.org/x/net v0.0.0-20200707034311-ab3426394381 <em>// indirect</em><br>&nbsp; golang.org/x/oauth2 v0.0.0-20200107190931-bf48bf16ab8d <em>// indirect</em><br>&nbsp; golang.org/x/time v0.0.0-20200630173020-3af7569d3a1e <em>// indirect</em><br>&nbsp; k8s.io/api v0.18.6<br>&nbsp; k8s.io/apiextensions-apiserver v0.18.2<br>&nbsp; k8s.io/apimachinery v0.18.6<br>&nbsp; k8s.io/client-<strong>go</strong> v0.18.6<br><br>&nbsp; k8s.io/utils v0.0.0-20200720150651-0bdb4ca86cbc <em>// indirect</em><br>&nbsp; sigs.k8s.io/controller-runtime v0.6.0<br>)<br><br>replace github.com/zzxwill/rudrx v0.0.1-alpha =&gt; /Users/zhouzhengxi/Programming/golang/src/github.com/zzxwill/RudrX</td></tr></tbody></table>
