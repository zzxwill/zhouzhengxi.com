---
title: "2.1 HOT -- OpenStack Heat从入门到实践"
date: "2015-09-18"
categories: 
  - "heat"
  - "openstack"
  - "云计算"
tags: 
  - "heat"
  - "iaas"
  - "openstack"
---

**HOT -- OpenStack Heat从入门到实践**

HOT即Heat Orchestration Template，初学者可能会不大好理解Orchestration这个词，WikiPedia的解释比较贴切。

**Orchestration (computers)** 

**Orchestration** describes the automated arrangement, coordination, and management of complex computer systems, [middleware](dict://key.317097B6E814E043839A3467BA8F4CCE/middleware), and services.

It is often discussed as having an inherent [intelligence (trait)](dict://key.317097B6E814E043839A3467BA8F4CCE/intelligence%20%28trait%29) or even implicitly [autonomic](dict://key.317097B6E814E043839A3467BA8F4CCE/autonomic) control, but those are largely aspirations or analogies rather than technical descriptions. In reality, _orchestration_ is largely the effect of [automation](dict://key.317097B6E814E043839A3467BA8F4CCE/automation) or systems deploying elements of [control theory](dict://key.317097B6E814E043839A3467BA8F4CCE/control%20theory).

This usage of _orchestration_ is often discussed in the context of [virtualization](dict://key.317097B6E814E043839A3467BA8F4CCE/virtualization), [provisioning](dict://key.317097B6E814E043839A3467BA8F4CCE/provisioning), and **dynamic datacenter** topics. It is often used as a [buzzword](dict://key.317097B6E814E043839A3467BA8F4CCE/buzzword).

中文可以理解为“编排”，“编制”。直白的理解就是用模板(template，一个文本文件)的形式，以约定的格式，把你所需要的元素放入其中，然后通过分析处理这个模板文件来自动化处理某种操作。

比如，你使用云主机时，需要将主机的内存从1G改到2G，一般是登录到云主机控制后台，更改主机配置中的内存。使用“编排”则是将模板中的内存属性从1改为2，然后自动化的去更改主机的内存大小。

![](images/1442560238.png)

下面我们以一个实际的例子来学习HOT。

[https://github.com/zzxwill/Heat4CloudProviders/blob/master/qingcloud\_heat\_plugin/template/qingcloud\_single\_vm\_stack.yaml](https://github.com/zzxwill/Heat4CloudProviders/blob/master/qingcloud_heat_plugin/template/qingcloud_single_vm_stack.yaml)

**第一部分： **heat\_template\_version****

指这个HOT的版本，请看官方的解释

[http://docs.openstack.org/developer/heat/template\_guide/hot\_spec.html](http://docs.openstack.org/developer/heat/template_guide/hot_spec.html)

2013-05-23

The key with value 2013-05-23 indicates that the YAML document is a HOT template and it may contain features implemented until the **Icehouse** release. This version supports the following functions (some are back ported to this version):

2015-04-30

The key with value 2015-04-30 indicates that the YAML document is a HOT template and it may contain features added and/or removed up until the **Kilo** release. This version adds the repeatfunction. So the complete list of supported functions is:

**第二部分： **description****

顾名思义。这个YAML是创建虚拟机用的。

**第三部分：parameters**

![](images/1442560240.png)

parameters值传入Heat的参数，创建一个虚拟机时，需要指定创建虚拟机所用到的镜像——image\_id（CentOS 7.0？Ubuntu 14.04?）；需要指定虚拟机创建之后的登录方式——login\_mode（密码登录？SSH Key登录？）

**第四部分： **resources****

![](images/1442560242.png)

resources部分是template的YAML对应的heat resource type，“server”指resource name, "COM::TwoFellows::Server"指resource type，properties指的是resource type的一系列属性，与template里的parameters相对应。具体对应关系，将在后面讲解。

**第五部分： **outputs****

![](images/1442560243.png)

outputs指的是resource type的输出，其与Heat resource type类里的attribute相对应，具体对应关系，将在后面讲解。

截止到现在，HOT基本讲解完毕（第四/五部分将在后面再加强理解）。同时，OpenStack Heat官方也给出了一个Hello World template，你也可以参考下，[https://github.com/openstack/heat-templates/blob/master/hot/hello\_world.yaml](https://github.com/openstack/heat-templates/blob/master/hot/hello_world.yaml)。 

更多《OpenStack Heat从入门到实践》系列文章，请关注

1。博客：[https://www.zhouzhengxi.com/wordpress/tag/Heat/](https://www.zhouzhengxi.com/wordpress/tag/Heat/)。

2。微信公众账号，Geek2014。

![](http://mmbiz.qpic.cn/mmbiz/AZ37fib0QltEAJAG0jb8ic7QmjxymctPGm5ll6l5wmX4icfaDnsFUPwJ4Gh7hIb7PcHsQLJicMwSlPqbWGaMAfKFYA/640?wx_fmt=jpeg&wxfrom=5&tp=webp&wx_lazy=1)
