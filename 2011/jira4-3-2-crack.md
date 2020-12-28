---
title: "JIRA4.3.2破解激活(亲测可用)"
date: "2011-07-09"
categories: 
  - "bug管理"
  - "recentfocus"
tags: 
  - "jira"
---

1.下载破解文件：[JIRA破解文件.ZIP](http://download.csdn.net/source/3429574)

2.用破解补丁中的JiraLicenseStoreImpl.class文件覆盖C:\\Program Files\\Atlassian\\JIRA 4.3.2\\atlassian-jira\\WEB-INF\\classes\\com\\atlassian\\jira\\license \\JiraLicenseStoreImpl.class文件

3. 用破解补丁中的Version2LicenseDecoder.class文件覆盖C:\\Program Files\\Atlassian\\JIRA 4.3.2\\atlassian-jira\\WEB-INF\\lib \\atlassian-extras-2.2.2.jar包中的\\com\\atlassian\\extras\\decoder\\v2\\Version2LicenseDecoder.class文件

注：jar包可以用WinRAR打开，并可以采用拖拽的方式覆盖文件

4.管理员登陆

6.在注册码输入框处输入以下内容：

Description=JIRA\\: longmaster

CreationDate=2010-02-22

ContactName=aa@aa.com

jira.LicenseEdition=ENTERPRISE

ContactEMail=aa@aa.com

Evaluation=false

jira.LicenseTypeName=COMMERCIAL

jira.active=true

licenseVersion=2

MaintenanceExpiryDate=2099-10-24

Organisation=aa

jira.NumberOfUsers=-1

ServerID=BVGH-1XEQ-1TVR-OO3O

LicenseID=LID

LicenseExpiryDate=2099-10-24

PurchaseDate=2010-10-25

（注意：以上的ServerID要根据license输入框上面的ServerID进行更改）

MaintenanceExpiryDate和LicenseExpiryDate可控制jira的到期时间

特别感谢[http://www.shubo.info](http://www.shubo.info/)博客提供的信息。
