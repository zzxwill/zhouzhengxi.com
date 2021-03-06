---
title: "Eclipse 使用 Egit 获取github的repository"
date: "2014-01-17"
categories: 
  - "git"
tags: 
  - "git"
---

本文介绍Eclipse（4.2.2）如何使用Egit插件获取github上的repository。

**1\. 安装git插件EGit**

Main Update Site: [http://download.eclipse.org/egit/updates](http://download.eclipse.org/egit/updates) (Recommended)

![](images/1389953582.png)

如果勾选了其他选项，可能出现如下错误信息。

\[\[code style="margin: 0px; padding: 0px; border: 0px; vertical-align: baseline; font-family: Consolas, Menlo, Monaco, 'Lucida Console', 'Liberation Mono', 'DejaVu Sans Mono', 'Bitstream Vera Sans Mono', 'Courier New', monospace, serif;"\]\]czo0MTY6XCJDYW5ub3QgY29tcGxldGUgdGhlIGluc3RhbGwgYmVjYXVzZSBvbmUgb3IgbW9yZSByZXF1aXJlZCBpdGVtcyBjb3VsZCB7WyYqJl19bm90IGJlIGZvdW5kLgogIFNvZnR3YXJlIGJlaW5nIGluc3RhbGxlZDogRUdpdCBNeWx5biAxLjEuMC4yMDExMDkxNTExMDAtciAob3tbJiomXX1yZy5lY2xpcHNlLmVnaXQubXlseW4uZmVhdHVyZS5ncm91cCAxLjEuMC4yMDExMDkxNTExMDAtcikKICBNaXNzaW5nIHJlcXVpcmVte1smKiZdfWVudDogRUdpdCBNeWx5biAxLjEuMC4yMDExMDkxNTExMDAtciAob3JnLmVjbGlwc2UuZWdpdC5teWx5bi5mZWF0dXJlLmdyb3VwIDF7WyYqJl19LjEuMC4yMDExMDkxNTExMDAtcikgcmVxdWlyZXMgJmFwb3M7b3JnLmVjbGlwc2UubXlseW4udGVhbV9mZWF0dXJlLmZlYXR1cmUuZ3tbJiomXX1yb3VwIDMuNS4wJmFwb3M7IGJ1dCBpdCBjb3VsZCBub3QgYmUgZm91bmQuXCI7e1smKiZdfQ==\[\[/code\]\]

(Sited from [http://stackoverflow.com/questions/8050475/eclipse-error-when-installing-egit](http://stackoverflow.com/questions/8050475/eclipse-error-when-installing-egit))

**2\. 在github上建立一个repository**

我们以github上的repository [iWebAdmin](https://github.com/zzxwill/iWebAdmin)为例说明。

获取clone url: git@github.com:zzxwill/iWebAdmin.git

![](images/1389953583.png)

**3\. 获取repository**

**3.1. Generate RSA Key**

通过上传RSA public key，建立local与remote(github.com上的repository)之间的认证通道。

1. In your Eclipse go to **_Window > Preferences > Network Connections > SSH2_** (or just type "SSH2" in preferences window filter box). (DD) I attempted to load a known good id\_rsa key, I had previously pushed my repository from the command line, and that worked fine. When attempting to "add" the key in step two, I discovered that the lengths of the two keys were different. Perhaps this is where EGit and eclipse are fowling up? My generated key for github is 2048, key length generated by Eclipse/EGit is 1024. Don't know SSH well enough to see if this is the problem.
    
2. In **"Key Management"** tab press **"Generate RSA Key..."** button. Optionally you can add comment (usually e-mail address) and passphrase to your key. Passphrase will be used during authentication on GitHub.
    
3. Copy your generated public key (in a box just below "Generate RSA Key..." button) and add it to your GitHub account.

> Access [https://github.com/zzxwill/iWebAdmin/settings/keys](https://github.com/zzxwill/iWebAdmin/settings/keys) to add deploy key.

 4.  Press **"Save Private Key..."** button to save your private RSA key into file. By default keys are stored in SSH2 home directory (see "General" tab).

(Cited from [http://stackoverflow.com/questions/3601805/auth-failed-error-with-egit-and-github](http://stackoverflow.com/questions/3601805/auth-failed-error-with-egit-and-github))

That's it! Now you should be able to push your code to GitHub repo.

**3.2. 从****github repository** **import project**

![](images/1389953585.png)

![](images/1389953586.png)

![](images/1389953587.png)

![](images/1389953588.png)

![](images/1389953589.png)

![](images/1389953591.png)

![](images/1389953592.png)

**4\. Git简单操作**

Basically `git commit` "_records changes to the repository_" while `git push` "_updates remote refs along with associated objects_". So the first one is used in connection with your local repository, while the latter one is used to interact with a remote repository.

Here is a nice picture from [Oliver Steele](http://osteele.com/archives/2008/05/my-git-workflow), that explains the git model and the commands:

![](images/1389953593.png)

（Cited from [http://stackoverflow.com/questions/2745076/what-is-the-difference-between-git-commit-and-git-push/2745097#2745097](http://stackoverflow.com/questions/2745076/what-is-the-difference-between-git-commit-and-git-push/2745097#2745097)）
