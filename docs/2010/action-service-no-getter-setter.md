---
title: "Action，Service里无getter和setter方法报错"
date: "2010-10-05"
categories: 
  - "javaee"
tags: 
  - "spring"
  - "ssi"
---

## 1.1     Action，Service里无getter和setter方法报错

解决：在Action，Service里加上getter和setter方法

报错信息：

2010-10-5 9:30:35 org.apache.coyote.http11.Http11AprProtocol init

信息: Initializing Coyote HTTP/1.1 on http-8080

2010-10-5 9:30:35 org.apache.coyote.ajp.AjpAprProtocol init

信息: Initializing Coyote AJP/1.3 on ajp-8009

2010-10-5 9:30:35 org.apache.catalina.startup.Catalina load

信息: Initialization processed in 1140 ms

2010-10-5 9:30:35 org.apache.catalina.core.StandardService start

信息: Starting service Catalina

2010-10-5 9:30:35 org.apache.catalina.core.StandardEngine start

信息: Starting Servlet Engine: Apache Tomcat/6.0.2

2010-10-5 9:30:35 org.apache.catalina.core.StandardHost start

信息: XML validation disabled

2010-10-5 9:30:36 org.apache.catalina.core.ApplicationContext log

信息: Initializing Spring root WebApplicationContext

\[INFO \] 2010-10-05 09:30:36 :Root WebApplicationContext: initialization started

\[INFO \] 2010-10-05 09:30:36 :Refreshing org.springframework.web.context.support.XmlWebApplicationContext@16e1fb1: display name \[Root WebApplicationContext\]; startup date \[Tue Oct 05 09:30:36 CST 2010\]; root of context hierarchy

\[INFO \] 2010-10-05 09:30:37 :Loading XML bean definitions from ServletContext resource \[/WEB-INF/spring-context/applicationContext-common.xml\]

\[INFO \] 2010-10-05 09:30:38 :Loading XML bean definitions from ServletContext resource \[/WEB-INF/spring-context/applicationContext-system.xml\]

\[INFO \] 2010-10-05 09:30:38 :Loading XML bean definitions from ServletContext resource \[/WEB-INF/spring-context/applicationContext-workApply.xml\]

\[INFO \] 2010-10-05 09:30:38 :Loading XML bean definitions from ServletContext resource \[/WEB-INF/spring-context/applicationContext-code.xml\]

\[INFO \] 2010-10-05 09:30:38 :Bean factory for application context \[org.springframework.web.context.support.XmlWebApplicationContext@16e1fb1\]: org.springframework.beans.factory.support.DefaultListableBeanFactory@147c1db

\[INFO \] 2010-10-05 09:30:38 :Loading properties file from class path resource \[init.properties\]

\[INFO \] 2010-10-05 09:30:38 :Pre-instantiating singletons in org.springframework.beans.factory.support.DefaultListableBeanFactory@147c1db: defining beans \[placeholderConfig,dataSource,sqlMapClient,WorkApplicationAction,WorkApplyService,WorkApplyDao,chargeStandardAction,chargeStandardService,chargeStandardDao\]; root of factory hierarchy

\[INFO \] 2010-10-05 09:30:38 :MLog clients using log4j logging.

\[INFO \] 2010-10-05 09:30:38 :Initializing c3p0-0.9.1 \[built 16-January-2007 14:46:42; debug? true; trace: 10\]

\[INFO \] 2010-10-05 09:30:40 :Destroying singletons in org.springframework.beans.factory.support.DefaultListableBeanFactory@147c1db: defining beans \[placeholderConfig,dataSource,sqlMapClient,WorkApplicationAction,WorkApplyService,WorkApplyDao,chargeStandardAction,chargeStandardService,chargeStandardDao\]; root of factory hierarchy

\[ERROR\] 2010-10-05 09:30:40 :Context initialization failed

org.springframework.beans.factory.BeanCreationException: Error creating bean with name 'chargeStandardService' defined in ServletContext resource \[/WEB-INF/spring-context/applicationContext-code.xml\]: Error setting property values; nested exception is org.springframework.beans.NotWritablePropertyException: Invalid property 'chargeStandardDao' of bean class \[com.custody.service.system.chargeStandard.ChargeStandardService\]: Bean property 'chargeStandardDao' is not writable or has an invalid setter method. Does the parameter type of the setter match the return type of the getter?

at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.applyPropertyValues(AbstractAutowireCapableBeanFactory.java:1279)

at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.populateBean(AbstractAutowireCapableBeanFactory.java:1010)

at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.doCreateBean(AbstractAutowireCapableBeanFactory.java:472)

at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory$1.run(AbstractAutowireCapableBeanFactory.java:409)

at java.security.AccessController.doPrivileged(Native Method)

at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.createBean(AbstractAutowireCapableBeanFactory.java:380)

at org.springframework.beans.factory.support.AbstractBeanFactory$1.getObject(AbstractBeanFactory.java:264)

at org.springframework.beans.factory.support.DefaultSingletonBeanRegistry.getSingleton(DefaultSingletonBeanRegistry.java:222)

at org.springframework.beans.factory.support.AbstractBeanFactory.doGetBean(AbstractBeanFactory.java:261)

at org.springframework.beans.factory.support.AbstractBeanFactory.getBean(AbstractBeanFactory.java:185)

at org.springframework.beans.factory.support.AbstractBeanFactory.getBean(AbstractBeanFactory.java:164)

at org.springframework.beans.factory.support.DefaultListableBeanFactory.preInstantiateSingletons(DefaultListableBeanFactory.java:429)

at org.springframework.context.support.AbstractApplicationContext.finishBeanFactoryInitialization(AbstractApplicationContext.java:728)

at org.springframework.context.support.AbstractApplicationContext.refresh(AbstractApplicationContext.java:380)

at org.springframework.web.context.ContextLoader.createWebApplicationContext(ContextLoader.java:255)

at org.springframework.web.context.ContextLoader.initWebApplicationContext(ContextLoader.java:199)

at org.springframework.web.context.ContextLoaderListener.contextInitialized(ContextLoaderListener.java:45)

at org.apache.catalina.core.StandardContext.listenerStart(StandardContext.java:3827)

at org.apache.catalina.core.StandardContext.start(StandardContext.java:4336)

at org.apache.catalina.core.ContainerBase.addChildInternal(ContainerBase.java:760)

at org.apache.catalina.core.ContainerBase.addChild(ContainerBase.java:740)

at org.apache.catalina.core.StandardHost.addChild(StandardHost.java:525)

at org.apache.catalina.startup.HostConfig.deployDirectory(HostConfig.java:920)

at org.apache.catalina.startup.HostConfig.deployDirectories(HostConfig.java:883)

at org.apache.catalina.startup.HostConfig.deployApps(HostConfig.java:492)

at org.apache.catalina.startup.HostConfig.start(HostConfig.java:1138)

at org.apache.catalina.startup.HostConfig.lifecycleEvent(HostConfig.java:311)

at org.apache.catalina.util.LifecycleSupport.fireLifecycleEvent(LifecycleSupport.java:120)

at org.apache.catalina.core.ContainerBase.start(ContainerBase.java:1022)

at org.apache.catalina.core.StandardHost.start(StandardHost.java:719)

at org.apache.catalina.core.ContainerBase.start(ContainerBase.java:1014)

at org.apache.catalina.core.StandardEngine.start(StandardEngine.java:443)

at org.apache.catalina.core.StandardService.start(StandardService.java:451)

at org.apache.catalina.core.StandardServer.start(StandardServer.java:710)

at org.apache.catalina.startup.Catalina.start(Catalina.java:552)

at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)

at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:39)

at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:25)

at java.lang.reflect.Method.invoke(Method.java:592)

at org.apache.catalina.startup.Bootstrap.start(Bootstrap.java:288)

at org.apache.catalina.startup.Bootstrap.main(Bootstrap.java:413)

Caused by: org.springframework.beans.NotWritablePropertyException: Invalid property 'chargeStandardDao' of bean class \[com.custody.service.system.chargeStandard.ChargeStandardService\]: Bean property 'chargeStandardDao' is not writable or has an invalid setter method. Does the parameter type of the setter match the return type of the getter?

at org.springframework.beans.BeanWrapperImpl.setPropertyValue(BeanWrapperImpl.java:801)

at org.springframework.beans.BeanWrapperImpl.setPropertyValue(BeanWrapperImpl.java:651)

at org.springframework.beans.AbstractPropertyAccessor.setPropertyValues(AbstractPropertyAccessor.java:78)

at org.springframework.beans.AbstractPropertyAccessor.setPropertyValues(AbstractPropertyAccessor.java:59)

at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.applyPropertyValues(AbstractAutowireCapableBeanFactory.java:1276)

... 40 more

2010-10-5 9:30:40 org.apache.catalina.core.StandardContext listenerStart

严重: Exception sending context initialized event to listener instance of class org.springframework.web.context.ContextLoaderListener

org.springframework.beans.factory.BeanCreationException: Error creating bean with name 'chargeStandardService' defined in ServletContext resource \[/WEB-INF/spring-context/applicationContext-code.xml\]: Error setting property values; nested exception is org.springframework.beans.NotWritablePropertyException: Invalid property 'chargeStandardDao' of bean class \[com.custody.service.system.chargeStandard.ChargeStandardService\]: Bean property 'chargeStandardDao' is not writable or has an invalid setter method. Does the parameter type of the setter match the return type of the getter?

at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.applyPropertyValues(AbstractAutowireCapableBeanFactory.java:1279)

at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.populateBean(AbstractAutowireCapableBeanFactory.java:1010)

at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.doCreateBean(AbstractAutowireCapableBeanFactory.java:472)

at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory$1.run(AbstractAutowireCapableBeanFactory.java:409)

at java.security.AccessController.doPrivileged(Native Method)

at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.createBean(AbstractAutowireCapableBeanFactory.java:380)

at org.springframework.beans.factory.support.AbstractBeanFactory$1.getObject(AbstractBeanFactory.java:264)

at org.springframework.beans.factory.support.DefaultSingletonBeanRegistry.getSingleton(DefaultSingletonBeanRegistry.java:222)

at org.springframework.beans.factory.support.AbstractBeanFactory.doGetBean(AbstractBeanFactory.java:261)

at org.springframework.beans.factory.support.AbstractBeanFactory.getBean(AbstractBeanFactory.java:185)

at org.springframework.beans.factory.support.AbstractBeanFactory.getBean(AbstractBeanFactory.java:164)

at org.springframework.beans.factory.support.DefaultListableBeanFactory.preInstantiateSingletons(DefaultListableBeanFactory.java:429)

at org.springframework.context.support.AbstractApplicationContext.finishBeanFactoryInitialization(AbstractApplicationContext.java:728)

at org.springframework.context.support.AbstractApplicationContext.refresh(AbstractApplicationContext.java:380)

at org.springframework.web.context.ContextLoader.createWebApplicationContext(ContextLoader.java:255)

at org.springframework.web.context.ContextLoader.initWebApplicationContext(ContextLoader.java:199)

at org.springframework.web.context.ContextLoaderListener.contextInitialized(ContextLoaderListener.java:45)

at org.apache.catalina.core.StandardContext.listenerStart(StandardContext.java:3827)

at org.apache.catalina.core.StandardContext.start(StandardContext.java:4336)

at org.apache.catalina.core.ContainerBase.addChildInternal(ContainerBase.java:760)

at org.apache.catalina.core.ContainerBase.addChild(ContainerBase.java:740)

at org.apache.catalina.core.StandardHost.addChild(StandardHost.java:525)

at org.apache.catalina.startup.HostConfig.deployDirectory(HostConfig.java:920)

at org.apache.catalina.startup.HostConfig.deployDirectories(HostConfig.java:883)

at org.apache.catalina.startup.HostConfig.deployApps(HostConfig.java:492)

at org.apache.catalina.startup.HostConfig.start(HostConfig.java:1138)

at org.apache.catalina.startup.HostConfig.lifecycleEvent(HostConfig.java:311)

at org.apache.catalina.util.LifecycleSupport.fireLifecycleEvent(LifecycleSupport.java:120)

at org.apache.catalina.core.ContainerBase.start(ContainerBase.java:1022)

at org.apache.catalina.core.StandardHost.start(StandardHost.java:719)

at org.apache.catalina.core.ContainerBase.start(ContainerBase.java:1014)

at org.apache.catalina.core.StandardEngine.start(StandardEngine.java:443)

at org.apache.catalina.core.StandardService.start(StandardService.java:451)

at org.apache.catalina.core.StandardServer.start(StandardServer.java:710)

at org.apache.catalina.startup.Catalina.start(Catalina.java:552)

at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)

at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:39)

at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:25)

at java.lang.reflect.Method.invoke(Method.java:592)

at org.apache.catalina.startup.Bootstrap.start(Bootstrap.java:288)

at org.apache.catalina.startup.Bootstrap.main(Bootstrap.java:413)

Caused by: org.springframework.beans.NotWritablePropertyException: Invalid property 'chargeStandardDao' of bean class \[com.custody.service.system.chargeStandard.ChargeStandardService\]: Bean property 'chargeStandardDao' is not writable or has an invalid setter method. Does the parameter type of the setter match the return type of the getter?

at org.springframework.beans.BeanWrapperImpl.setPropertyValue(BeanWrapperImpl.java:801)

at org.springframework.beans.BeanWrapperImpl.setPropertyValue(BeanWrapperImpl.java:651)

at org.springframework.beans.AbstractPropertyAccessor.setPropertyValues(AbstractPropertyAccessor.java:78)

at org.springframework.beans.AbstractPropertyAccessor.setPropertyValues(AbstractPropertyAccessor.java:59)

at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.applyPropertyValues(AbstractAutowireCapableBeanFactory.java:1276)

... 40 more

2010-10-5 9:30:40 org.apache.catalina.core.StandardContext start

严重: Error listenerStart

2010-10-5 9:30:40 org.apache.catalina.core.StandardContext start

严重: Context \[/custody\] startup failed due to previous errors

2010-10-5 9:30:40 org.apache.catalina.core.ApplicationContext log

信息: Closing Spring root WebApplicationContext

log4j:ERROR LogMananger.repositorySelector was null likely due to error in class reloading, using NOPLoggerRepository.

2010-10-5 9:30:40 org.apache.catalina.loader.WebappClassLoader loadClass

信息: Illegal access: this web application instance has been stopped already.  Could not load java.net.HttpURLConnection.  The eventual following stack trace is caused by an error thrown for debugging purposes as well as to attempt to terminate the thread which caused the illegal access, and has no functional impact.

java.lang.IllegalStateException

at org.apache.catalina.loader.WebappClassLoader.loadClass(WebappClassLoader.java:1241)

at org.apache.catalina.loader.WebappClassLoader.loadClass(WebappClassLoader.java:1201)

at java.lang.ClassLoader.loadClassInternal(ClassLoader.java:320)

at org.apache.xerces.impl.XMLEntityManager.setupCurrentEntity(Unknown Source)

at org.apache.xerces.impl.XMLEntityManager.startEntity(Unknown Source)

at org.apache.xerces.impl.XMLEntityManager.startDTDEntity(Unknown Source)

at org.apache.xerces.impl.XMLDTDScannerImpl.setInputSource(Unknown Source)

at org.apache.xerces.impl.XMLDocumentScannerImpl$DTDDispatcher.dispatch(Unknown Source)

at org.apache.xerces.impl.XMLDocumentFragmentScannerImpl.scanDocument(Unknown Source)

at org.apache.xerces.parsers.XML11Configuration.parse(Unknown Source)

at org.apache.xerces.parsers.XML11Configuration.parse(Unknown Source)

at org.apache.xerces.parsers.XMLParser.parse(Unknown Source)

at org.apache.xerces.parsers.AbstractSAXParser.parse(Unknown Source)

at org.apache.tomcat.util.digester.Digester.parse(Digester.java:1562)

at org.apache.catalina.startup.ContextConfig.applicationWebConfig(ContextConfig.java:369)

at org.apache.catalina.startup.ContextConfig.start(ContextConfig.java:1060)

at org.apache.catalina.startup.ContextConfig.lifecycleEvent(ContextConfig.java:261)

at org.apache.catalina.util.LifecycleSupport.fireLifecycleEvent(LifecycleSupport.java:120)

at org.apache.catalina.core.StandardContext.start(StandardContext.java:4238)

at org.apache.catalina.core.ContainerBase.addChildInternal(ContainerBase.java:760)

at org.apache.catalina.core.ContainerBase.addChild(ContainerBase.java:740)

at org.apache.catalina.core.StandardHost.addChild(StandardHost.java:525)

at org.apache.catalina.startup.HostConfig.deployDirectory(HostConfig.java:920)

at org.apache.catalina.startup.HostConfig.deployDirectories(HostConfig.java:883)

at org.apache.catalina.startup.HostConfig.deployApps(HostConfig.java:492)

at org.apache.catalina.startup.HostConfig.start(HostConfig.java:1138)

at org.apache.catalina.startup.HostConfig.lifecycleEvent(HostConfig.java:311)

at org.apache.catalina.util.LifecycleSupport.fireLifecycleEvent(LifecycleSupport.java:120)

at org.apache.catalina.core.ContainerBase.start(ContainerBase.java:1022)

at org.apache.catalina.core.StandardHost.start(StandardHost.java:719)

at org.apache.catalina.core.ContainerBase.start(ContainerBase.java:1014)

at org.apache.catalina.core.StandardEngine.start(StandardEngine.java:443)

at org.apache.catalina.core.StandardService.start(StandardService.java:451)

at org.apache.catalina.core.StandardServer.start(StandardServer.java:710)

at org.apache.catalina.startup.Catalina.start(Catalina.java:552)

at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)

at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:39)

at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:25)

at java.lang.reflect.Method.invoke(Method.java:592)

at org.apache.catalina.startup.Bootstrap.start(Bootstrap.java:288)

at org.apache.catalina.startup.Bootstrap.main(Bootstrap.java:413)

2010-10-5 9:30:41 org.apache.coyote.http11.Http11AprProtocol start

信息: Starting Coyote HTTP/1.1 on http-8080

2010-10-5 9:30:41 org.apache.coyote.ajp.AjpAprProtocol start

信息: Starting Coyote AJP/1.3 on ajp-8009

2010-10-5 9:30:41 org.apache.catalina.startup.Catalina start

信息: Server startup in 5891 ms
