---
title: "No result defined for action com.custody.action.system.chargeStandard.ChargeStandardAction and result error"
date: "2010-10-05"
categories: 
  - "database"
tags: 
  - "spring"
  - "ssi"
---

## 1.1     No result defined for action XXAction and result error

**解决方案：**

<!-- 缴费标准管理Action -->

<action name="chargeStandard"

method="chargeStandardContent">

<result name="success">

/custodyWeb/custodyInternalWeb/custodyCodeManage/chargeStandard.jsp

</result>

</action>

_加上_

<result name="error">

/custodyWeb/custodyInternalWeb/custodyCodeManage/chargeStandard.jsp

</result>

**报错信息**：

\[WARN \] 2010-10-05 11:46:59 :Could not find action or result

No result defined for action com.custody.action.system.chargeStandard.ChargeStandardAction and result error

at com.opensymphony.xwork2.DefaultActionInvocation.executeResult(DefaultActionInvocation.java:364)

at com.opensymphony.xwork2.DefaultActionInvocation.invoke(DefaultActionInvocation.java:266)

at com.opensymphony.xwork2.interceptor.DefaultWorkflowInterceptor.doIntercept(DefaultWorkflowInterceptor.java:165)

at com.opensymphony.xwork2.interceptor.MethodFilterInterceptor.intercept(MethodFilterInterceptor.java:87)

at com.opensymphony.xwork2.DefaultActionInvocation.invoke(DefaultActionInvocation.java:237)

at com.opensymphony.xwork2.validator.ValidationInterceptor.doIntercept(ValidationInterceptor.java:252)

at org.apache.struts2.interceptor.validation.AnnotationValidationInterceptor.doIntercept(AnnotationValidationInterceptor.java:68)

at com.opensymphony.xwork2.interceptor.MethodFilterInterceptor.intercept(MethodFilterInterceptor.java:87)

at com.opensymphony.xwork2.DefaultActionInvocation.invoke(DefaultActionInvocation.java:237)

at com.opensymphony.xwork2.interceptor.ConversionErrorInterceptor.intercept(ConversionErrorInterceptor.java:122)

at com.opensymphony.xwork2.DefaultActionInvocation.invoke(DefaultActionInvocation.java:237)

at com.opensymphony.xwork2.interceptor.ParametersInterceptor.doIntercept(ParametersInterceptor.java:195)

at com.opensymphony.xwork2.interceptor.MethodFilterInterceptor.intercept(MethodFilterInterceptor.java:87)

at com.opensymphony.xwork2.DefaultActionInvocation.invoke(DefaultActionInvocation.java:237)

at com.opensymphony.xwork2.interceptor.ParametersInterceptor.doIntercept(ParametersInterceptor.java:195)

at com.opensymphony.xwork2.interceptor.MethodFilterInterceptor.intercept(MethodFilterInterceptor.java:87)

at com.opensymphony.xwork2.DefaultActionInvocation.invoke(DefaultActionInvocation.java:237)

at com.opensymphony.xwork2.interceptor.StaticParametersInterceptor.intercept(StaticParametersInterceptor.java:179)

at com.opensymphony.xwork2.DefaultActionInvocation.invoke(DefaultActionInvocation.java:237)

at org.apache.struts2.interceptor.MultiselectInterceptor.intercept(MultiselectInterceptor.java:75)

at com.opensymphony.xwork2.DefaultActionInvocation.invoke(DefaultActionInvocation.java:237)

at org.apache.struts2.interceptor.CheckboxInterceptor.intercept(CheckboxInterceptor.java:94)

at com.opensymphony.xwork2.DefaultActionInvocation.invoke(DefaultActionInvocation.java:237)

at org.apache.struts2.interceptor.FileUploadInterceptor.intercept(FileUploadInterceptor.java:235)

at com.opensymphony.xwork2.DefaultActionInvocation.invoke(DefaultActionInvocation.java:237)

at com.opensymphony.xwork2.interceptor.ModelDrivenInterceptor.intercept(ModelDrivenInterceptor.java:89)

at com.opensymphony.xwork2.DefaultActionInvocation.invoke(DefaultActionInvocation.java:237)

at com.opensymphony.xwork2.interceptor.ScopedModelDrivenInterceptor.intercept(ScopedModelDrivenInterceptor.java:130)

at com.opensymphony.xwork2.DefaultActionInvocation.invoke(DefaultActionInvocation.java:237)

at org.apache.struts2.interceptor.debugging.DebuggingInterceptor.intercept(DebuggingInterceptor.java:267)

at com.opensymphony.xwork2.DefaultActionInvocation.invoke(DefaultActionInvocation.java:237)

at com.opensymphony.xwork2.interceptor.ChainingInterceptor.intercept(ChainingInterceptor.java:126)

at com.opensymphony.xwork2.DefaultActionInvocation.invoke(DefaultActionInvocation.java:237)

at com.opensymphony.xwork2.interceptor.PrepareInterceptor.doIntercept(PrepareInterceptor.java:138)

at com.opensymphony.xwork2.interceptor.MethodFilterInterceptor.intercept(MethodFilterInterceptor.java:87)

at com.opensymphony.xwork2.DefaultActionInvocation.invoke(DefaultActionInvocation.java:237)

at com.opensymphony.xwork2.interceptor.I18nInterceptor.intercept(I18nInterceptor.java:165)

at com.opensymphony.xwork2.DefaultActionInvocation.invoke(DefaultActionInvocation.java:237)

at org.apache.struts2.interceptor.ServletConfigInterceptor.intercept(ServletConfigInterceptor.java:164)

at com.opensymphony.xwork2.DefaultActionInvocation.invoke(DefaultActionInvocation.java:237)

at com.opensymphony.xwork2.interceptor.AliasInterceptor.intercept(AliasInterceptor.java:179)

at com.opensymphony.xwork2.DefaultActionInvocation.invoke(DefaultActionInvocation.java:237)

at com.opensymphony.xwork2.interceptor.ExceptionMappingInterceptor.intercept(ExceptionMappingInterceptor.java:176)

at com.opensymphony.xwork2.DefaultActionInvocation.invoke(DefaultActionInvocation.java:237)

at org.apache.struts2.impl.StrutsActionProxy.execute(StrutsActionProxy.java:52)

at org.apache.struts2.dispatcher.Dispatcher.serviceAction(Dispatcher.java:488)

at org.apache.struts2.dispatcher.FilterDispatcher.doFilter(FilterDispatcher.java:395)

at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:235)

at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:206)

at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:96)

at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:76)

at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:235)

at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:206)

at org.ecside.filter.ECSideFilter.doFilter(ECSideFilter.java:154)

at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:235)

at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:206)

at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:228)

at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:175)

at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:128)

at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:105)

at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:109)

at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:212)

at org.apache.coyote.http11.Http11AprProcessor.process(Http11AprProcessor.java:867)

at org.apache.coyote.http11.Http11AprProtocol$Http11ConnectionHandler.process(Http11AprProtocol.java:706)

at org.apache.tomcat.util.net.AprEndpoint$Worker.run(AprEndpoint.java:1487)

at java.lang.Thread.run(Thread.java:595)
