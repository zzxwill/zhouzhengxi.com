---
title: "1.1.1  日期 date 空值 null"
date: "2010-11-13"
tags: 
  - "ibatis"
  - "null"
---

### 1.1.1  日期 date 空值 null

1. 错误详情

\[DEBUG\] 2010-11-13 13:18:32 :{conn-100024} Connection

\[DEBUG\] 2010-11-13 13:18:32 :{conn-100024} Preparing Call: {call   PKG\_CLASSCASE.insertClasscase(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}

org.springframework.jdbc.UncategorizedSQLException: SqlMapClient operation; uncategorized SQLException for SQL \[\]; SQL state \[null\]; error code \[17004\];

\--- The error occurred in com/classcase/map/CLASSCASE\_SqlMap.xml.

\--- The error occurred while applying a parameter map.

\--- Check the CLASSCASE.classcaseParameter.

\--- Check the parameter mapping for the 'refereedate' property.

\--- Cause: java.sql.SQLException: 无效的列类型; nested exception is com.ibatis.common.jdbc.exception.NestedSQLException:

\--- The error occurred in com/classcase/map/CLASSCASE\_SqlMap.xml.

\--- The error occurred while applying a parameter map.

\--- Check the CLASSCASE.classcaseParameter.

\--- Check the parameter mapping for the 'refereedate' property.

\--- Cause: java.sql.SQLException: 无效的列类型

at org.springframework.jdbc.support.AbstractFallbackSQLExceptionTranslator.translate(AbstractFallbackSQLExceptionTranslator.java:83)

at org.springframework.jdbc.support.AbstractFallbackSQLExceptionTranslator.translate(AbstractFallbackSQLExceptionTranslator.java:80)

at org.springframework.orm.ibatis.SqlMapClientTemplate.execute(SqlMapClientTemplate.java:212)

at org.springframework.orm.ibatis.SqlMapClientTemplate.insert(SqlMapClientTemplate.java:397)

at com.classcase.dao.system.classcase.ClasscaseDao.insertClasscase(ClasscaseDao.java:110)

at com.classcase.dao.system.classcase.ClasscaseDao$$FastClassByCGLIB$$5870fa00.invoke(<generated>)

at net.sf.cglib.proxy.MethodProxy.invoke(MethodProxy.java:149)

at org.springframework.aop.framework.Cglib2AopProxy$CglibMethodInvocation.invokeJoinpoint(Cglib2AopProxy.java:700)

at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:149)

at org.springframework.transaction.interceptor.TransactionInterceptor.invoke(TransactionInterceptor.java:106)

at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:171)

at org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:89)

at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:171)

at org.springframework.aop.framework.Cglib2AopProxy$DynamicAdvisedInterceptor.intercept(Cglib2AopProxy.java:635)

at com.classcase.dao.system.classcase.ClasscaseDao$$EnhancerByCGLIB$$64033a4b.insertClasscase(<generated>)

at com.classcase.service.system.classcase.ClasscaseService.insertClasscase(ClasscaseService.java:45)

at com.classcase.action.system.classcase.ClasscaseAction.insertClasscase(ClasscaseAction.java:155)

at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)

at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:39)

at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:25)

at java.lang.reflect.Method.invoke(Method.java:592)

at com.opensymphony.xwork2.DefaultActionInvocation.invokeAction(DefaultActionInvocation.java:441)

at com.opensymphony.xwork2.DefaultActionInvocation.invokeActionOnly(DefaultActionInvocation.java:280)

at com.opensymphony.xwork2.DefaultActionInvocation.invoke(DefaultActionInvocation.java:243)

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

Caused by: com.ibatis.common.jdbc.exception.NestedSQLException:

\--- The error occurred in com/classcase/map/CLASSCASE\_SqlMap.xml.

\--- The error occurred while applying a parameter map.

\--- Check the CLASSCASE.classcaseParameter.

\--- Check the parameter mapping for the 'refereedate' property.

\--- Cause: java.sql.SQLException: 无效的列类型

at com.ibatis.sqlmap.engine.mapping.statement.MappedStatement.executeUpdate(MappedStatement.java:107)

at com.ibatis.sqlmap.engine.impl.SqlMapExecutorDelegate.insert(SqlMapExecutorDelegate.java:393)

at com.ibatis.sqlmap.engine.impl.SqlMapSessionImpl.insert(SqlMapSessionImpl.java:82)

at org.springframework.orm.ibatis.SqlMapClientTemplate$9.doInSqlMapClient(SqlMapClientTemplate.java:399)

at org.springframework.orm.ibatis.SqlMapClientTemplate.execute(SqlMapClientTemplate.java:209)

... 85 more

Caused by: java.sql.SQLException: 无效的列类型

at oracle.jdbc.driver.DatabaseError.throwSqlException(DatabaseError.java:125)

at oracle.jdbc.driver.DatabaseError.throwSqlException(DatabaseError.java:162)

at oracle.jdbc.driver.DatabaseError.throwSqlException(DatabaseError.java:227)

at oracle.jdbc.driver.OracleStatement.get\_internal\_type(OracleStatement.java:3150)

at oracle.jdbc.driver.OraclePreparedStatement.setNullInternal(OraclePreparedStatement.java:3665)

at oracle.jdbc.driver.OracleCallableStatement.setNull(OracleCallableStatement.java:4145)

at com.mchange.v2.c3p0.impl.NewProxyCallableStatement.setNull(NewProxyCallableStatement.java:2212)

at sun.reflect.GeneratedMethodAccessor66.invoke(Unknown Source)

at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:25)

at java.lang.reflect.Method.invoke(Method.java:592)

at com.ibatis.common.jdbc.logging.PreparedStatementLogProxy.invoke(PreparedStatementLogProxy.java:70)

at $Proxy9.setNull(Unknown Source)

at com.ibatis.sqlmap.engine.mapping.parameter.ParameterMap.setParameter(ParameterMap.java:174)

at com.ibatis.sqlmap.engine.mapping.parameter.ParameterMap.setParameters(ParameterMap.java:126)

at com.ibatis.sqlmap.engine.execution.SqlExecutor.executeUpdateProcedure(SqlExecutor.java:227)

at com.ibatis.sqlmap.engine.mapping.statement.ProcedureStatement.sqlExecuteUpdate(ProcedureStatement.java:34)

at com.ibatis.sqlmap.engine.mapping.statement.MappedStatement.executeUpdate(MappedStatement.java:94)

... 89 more

2.  错误原因：

从JSP页面一中获取到的日期为null，传到存储过程无法处理。

1. 解决方法：

**if**(classcase.getRefereedate()==**null**){

classcase.setRefereedate(**new** Date());

}
