---
title: "使用DevStack在VM里的Ubuntu上安装OpenStack"
date: "2015-03-16"
categories: 
  - "openstack"
  - "云计算"
  - "recentfocus"
tags: 
  - "openstack"
---

**使用DevStack在VM里的Ubuntu上安装OpenStack**

**简介**

本文介绍了使用devstack在VM里的Ubuntu上安装OpenStack的安装步骤；碰到的问题及解决方案和感想。

**环境准备**

1)      PC物理机配置

Windows 7 64 bit。

Memory: 8G

Disk: 500G

2)      Ubuntu安装

实验使用Oracle VirtualBox 4.3.24，安装的Linux是ubuntu-14.04.2-desktop-amd64，虚拟机配置如下。

Memory: 4G

Disk: 16G

Network: Bridged Adapter

 

**安装**

参考OpenStack官方提供的DevStack安装OpenStack。DevStack has evolved to support a large number of configuration options and alternative platforms and support services. That evolution has grown well beyond what was originally intended and the majority of configuration combinations are rarely, if ever, tested. DevStack is not a general OpenStack installer and was never meant to be everything to everyone. （详情请参考[http://docs.openstack.org/developer/devstack/overview.html](http://docs.openstack.org/developer/devstack/overview.html)）。具体安装步骤请参考DevStack安装文档（[http://docs.openstack.org/developer/devstack/](http://docs.openstack.org/developer/devstack/)）的Quick Start部分。

1)      Download DevStack

git clone [https://git.openstack.org/openstack-dev/devstack](https://git.openstack.org/openstack-dev/devstack)

2)      Configure

在第一步clone的devstack目录下创建文件local.conf。内容请参考官方配置文档[http://docs.openstack.org/developer/devstack/configuration.html](http://docs.openstack.org/developer/devstack/configuration.html)的Example部分。本次实验使用的local.conf如下。

3)      Start the install

cd devstack; ./stack.sh

安装成功，可以再浏览器上打开OpenStack的DashBoard.

 

**问题及解决方案**

OpenStack的安装过程中会遇到很多问题，我直到安装好，花了一周时间（是不是很low? 我对此一直耿耿于怀，收到了比较严重的打击，屡屡后面的问题，发现坑太多，加上运气不够好，的确需要这么多时间。你如果遇到也安装问题，请不要气馁）。

1)      could not install deps \[-r/opt/stack/tempest/requirements.txt

详细错误：

2015-03-12 11:25:31.493 |

2015-03-12 11:25:31.493 |     Please submit a full bug report,

2015-03-12 11:25:31.493 |

2015-03-12 11:25:31.493 |     with preprocessed source if appropriate.

2015-03-12 11:25:31.493 |

2015-03-12 11:25:31.493 |     See <[file:///usr/share/doc/gcc-4.8/README.Bugs](file:///C:/usr/share/doc/gcc-4.8/README.Bugs)\> for instructions.

2015-03-12 11:25:31.493 |

2015-03-12 11:25:31.493 |     error: command 'x86\_64-linux-gnu-gcc' failed with exit status 4

2015-03-12 11:25:31.493 |

2015-03-12 11:25:31.493 |     ----------------------------------------

2015-03-12 11:25:31.494 |     Command "/opt/stack/tempest/.tox/venv/bin/python -c "import setuptools, tokenize;\_\_file\_\_='/tmp/pip-build-wMeYit/lxml/setup.py';exec(compile(getattr(tokenize, 'open', open)(\_\_file\_\_).read().replace('\\r\\n', '\\n'), \_\_file\_\_, 'exec'))" install --record /tmp/pip-0sg7gc-record/install-record.txt --single-version-externally-managed --compile --install-headers /opt/stack/tempest/.tox/venv/include/site/python2.7" failed with error code 1 in /tmp/pip-build-wMeYit/lxml

2015-03-12 11:25:31.494 |

2015-03-12 11:25:31.494 | ERROR: could not install deps \[-r/opt/stack/tempest/requirements.txt, -r/opt/stack/tempest/test-requirements.txt\]; v = InvocationError('/opt/stack/tempest/.tox/venv/bin/pip install -U -r/opt/stack/tempest/requirements.txt -r/opt/stack/tempest/test-requirements.txt (see /opt/stack/tempest/.tox/venv/log/venv-1.log)', 1)

2015-03-12 11:25:31.553 | \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_ summary \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_

2015-03-12 11:25:31.553 | ERROR:   venv: could not install deps \[-r/opt/stack/tempest/requirements.txt, -r/opt/stack/tempest/test-requirements.txt\]; v = InvocationError('/opt/stack/tempest/.tox/venv/bin/pip install -U -r/opt/stack/tempest/requirements.txt -r/opt/stack/tempest/test-requirements.txt (see /opt/stack/tempest/.tox/venv/log/venv-1.log)', 1)

2015-03-12 11:25:31.577 | + exit\_trap

2015-03-12 11:25:31.583 | + local r=1

2015-03-12 11:25:31.584 | ++ jobs -p

2015-03-12 11:25:31.609 | + jobs=

2015-03-12 11:25:31.610 | + \[\[ -n '' \]\]

2015-03-12 11:25:31.610 | + kill\_spinner

2015-03-12 11:25:31.610 | + '\[' '!' -z '' '\]'

2015-03-12 11:25:31.610 | + \[\[ 1 -ne 0 \]\]

2015-03-12 11:25:31.610 | + echo 'Error on exit'

2015-03-12 11:25:31.610 | Error on exit

2015-03-12 11:25:31.610 | + \[\[ -z /opt/stack/logs \]\]

2015-03-12 11:25:31.610 | + /home/zhouzhengxi/devstack/tools/worlddump.py -d /opt/stack/logs

2015-03-12 11:25:35.267 | + exit 1

根本问题：

这是OpenStack的一个bug，详见：

[https://bugs.launchpad.net/tempest/+bug/1405579](https://bugs.launchpad.net/tempest/+bug/1405579)

解决办法：

Note that on some older systems (noted on Debian 6 and CentOS 5 installations), _wget_ may refuse to download _ez\_setup.py_, complaining that the certificate common name _\*.c.ssl.fastly.net_ does not match the host name _bootstrap.pypa.io_. In addition, the _ez\_setup.py_ script may then encounter similar problems using _wget_ internally to download _setuptools-x.y.zip_, complaining that the certificate common name of [_www.python.org_](http://www.python.org/) does not match the host name _pypi.python.org_. Those are known issues, related to a bug in the older versions of _wget_ (see [Issue 59](https://bitbucket.org/pypa/pypi/issue/59#comment-5881915)). If you happen to encounter them, install Setuptools as follows:

\> wget --no-check-certificate [https://bootstrap.pypa.io/ez\_setup.py](https://bootstrap.pypa.io/ez_setup.py) > python ez\_setup.py --insecure

[https://pypi.python.org/pypi/setuptools#downloads](https://pypi.python.org/pypi/setuptools#downloads)

 

2)      安装一直停卡在/opt/stack/heat/bin/heat-manage db\_sync

具体原因我不知道，我单独运行了这个命令解决了。

3)      虚拟机停止运行，各种点击都没有反应

安装过程中，我发现每次安装到venv installdeps: -r/opt/stack/tempest/requirements.txt, -r/opt/stack/tempest/requirements.txt时，虚拟机会停止工作，各种点击都没有相应。

按理说，安装OpenStack不至于会让VM无响应。于是，我就考虑是不是Ubuntu的源有问题，各种换源，第三方的源（地处北京，发现[aliyun的源](http://wiki.ubuntu.org.cn/Template:14.04source) 特别快），官方源（官方源各种慢或timeout，于是通过科学上网（你懂的~）方式安装官方源），前后安装了8次之多，每次都卡在这个地方，导致VM无响应。我就想，为什么整个虚拟机会无响应呢？我联想到有时Windows的内存使用到90%以上，很多应用都会出现无响应的状态。那是不是内存过小？于是，我将虚拟机默认分配的521M内存扩大到2G，问题依然如此，是不是还不够大，扩大到4G，终于搞定了！！！OpenStack是个熊孩子。。。

 

Enjoy your OpenStack!
