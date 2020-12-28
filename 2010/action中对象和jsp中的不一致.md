---
title: "Action中对象和jsp中的不一致"
date: "2010-11-13"
tags: 
  - "ioc"
  - "struts2"
---

### 1.1.1  Action中对象和jsp中的不一致

1. 错误详情：

\[WARN \] 2010-11-13 12:56:35 :Error setting expression **'appraiserexpert.expert' with value '\[Ljava.lang.String;@192db17'**

**ognl.OgnlException: target is null for setProperty(null, "expert", \[Ljava.lang.String;@192db17)**

at ognl.OgnlRuntime.setProperty(OgnlRuntime.java:2219)

at ognl.ASTProperty.setValueBody(ASTProperty.java:127)

at ognl.SimpleNode.evaluateSetValueBody(SimpleNode.java:220)

at ognl.SimpleNode.setValue(SimpleNode.java:301)

at ognl.ASTChain.setValueBody(ASTChain.java:227)

at ognl.SimpleNode.evaluateSetValueBody(SimpleNode.java:220)

at ognl.SimpleNode.setValue(SimpleNode.java:301)

at ognl.Ognl.setValue(Ognl.java:737)

at com.opensymphony.xwork2.ognl.OgnlUtil.setValue(OgnlUtil.java:198)

at com.opensymphony.xwork2.ognl.OgnlValueStack.setValue(OgnlValueStack.java:161)

at com.opensymphony.xwork2.ognl.OgnlValueStack.setValue(OgnlValueStack.java:149)

at com.opensymphony.xwork2.interceptor.ParametersInterceptor.setParameters(ParametersInterceptor.java:276)

at com.opensymphony.xwork2.interceptor.ParametersInterceptor.doIntercept(ParametersInterceptor.java:187)

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

1. 错误原因

Action中对象和jsp中的不一致

JSP:

<td width="40%" colspan="3">

<s:textfield id="expert" **name="appraiserexpert.expert"**

size="40%" readonly="true" valid="required"

title="@#@T本系统中已经存在的外部用户@#@C签约客户不能为空" />

<input name="button" type="button" id="selectUser"

onclick="selectExpert(1);" value="选择" />

<input name="button" type="button" id="deleteExpert"

onclick="editExpert(1)" value="修改" />

<s:hidden name="appraiserexpertid2" id="id" />

</td>

Action:

**Appraiserexpert appraiseExpert;**
