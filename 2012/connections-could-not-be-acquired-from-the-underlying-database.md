---
title: "Connections could not be acquired from the underlying database!"
date: "2012-05-30"
---

经查：

< property name \="jdbcUrl" \>

  < value\> jdbc:oracle:thin:@10.17.199.8:1521:lab1107 </value \>

</ property\>

数据库IP配置错误

\[DEBUG\] 2012-05-30 11:09:43 :{conn-100001} Connection

 \[DEBUG\] 2012-05-30 11:09:43 :{conn-100001} Preparing Statement:    select id,firstname,lastname,emailaddress from ACCOUNT 

 \[WARN \] 2012-05-30 11:16:59 :com.mchange.v2.resourcepool.BasicResourcePool$AcquireTask@d1287b -- Acquisition Attempt Failed!!! Clearing pending acquires. While trying to acquire a needed new resource, we failed to succeed more than the maximum number of allowed acquisition attempts (30). Last acquisition attempt exception:

 java.sql.SQLException: Io 异常: The Network Adapter could not establish the connection

 at oracle.jdbc.driver.DatabaseError.throwSqlException( DatabaseError.java:125)

 at oracle.jdbc.driver.DatabaseError.throwSqlException( DatabaseError.java:162)

 at oracle.jdbc.driver.DatabaseError.throwSqlException( DatabaseError.java:274)

 at oracle.jdbc.driver.T4CConnection.logon( T4CConnection.java:319 )

 at oracle.jdbc.driver.PhysicalConnection.<init>( PhysicalConnection.java:344)

 at oracle.jdbc.driver.T4CConnection.<init>( T4CConnection.java:148 )

 at oracle.jdbc.driver.T4CDriverExtension.getConnection( T4CDriverExtension.java:32)

 at oracle.jdbc.driver.OracleDriver.connect( OracleDriver.java:545 )

 at com.mchange.v2.c3p0.DriverManagerDataSource.getConnection( DriverManagerDataSource.java:135)

 at com.mchange.v2.c3p0.WrapperConnectionPoolDataSource.getPooledConnection( WrapperConnectionPoolDataSource.java:182)

 at com.mchange.v2.c3p0.WrapperConnectionPoolDataSource.getPooledConnection( WrapperConnectionPoolDataSource.java:171)

 at com.mchange.v2.c3p0.impl.C3P0PooledConnectionPool$1PooledConnectionResourcePoolManager.acquireResource( C3P0PooledConnectionPool.java:137)

 at com.mchange.v2.resourcepool.BasicResourcePool.doAcquire( BasicResourcePool.java:1014)

 at com.mchange.v2.resourcepool.BasicResourcePool.access$800( BasicResourcePool.java:32)

 at com.mchange.v2.resourcepool.BasicResourcePool$AcquireTask.run( BasicResourcePool.java:1810)

 at com.mchange.v2.async.ThreadPoolAsynchronousRunner$PoolThread.run( ThreadPoolAsynchronousRunner.java:547)

\[ERROR\] 2012-05-30 11:16:59 :Error calling Connection.prepareStatement:

 java.sql.SQLException: Connections could not be acquired from the underlying database!

 at com.mchange.v2.sql.SqlUtils.toSQLException( SqlUtils.java:106 )

 at com.mchange.v2.c3p0.impl.C3P0PooledConnectionPool.checkoutPooledConnection( C3P0PooledConnectionPool.java:529)

 at com.mchange.v2.c3p0.impl.AbstractPoolBackedDataSource.getConnection( AbstractPoolBackedDataSource.java:128)

 at org.springframework.jdbc.datasource.DataSourceUtils.doGetConnection( DataSourceUtils.java:113)

 at org.springframework.jdbc.datasource.TransactionAwareDataSourceProxy$TransactionAwareInvocationHandler.invoke( TransactionAwareDataSourceProxy.java:210)

 at $Proxy5.prepareStatement(Unknown Source)

 at sun.reflect.NativeMethodAccessorImpl.invoke0( Native Method )

 at sun.reflect.NativeMethodAccessorImpl.invoke( NativeMethodAccessorImpl.java:39)

 at sun.reflect.DelegatingMethodAccessorImpl.invoke( DelegatingMethodAccessorImpl.java:25)

 at java.lang.reflect.Method.invoke( Method.java:597 )

 at com.ibatis.common.jdbc.logging.ConnectionLogProxy.invoke( ConnectionLogProxy.java:53)

 at $Proxy6.prepareStatement(Unknown Source)

 at com.ibatis.sqlmap.engine.execution.SqlExecutor.prepareStatement( SqlExecutor.java:497)

 at com.ibatis.sqlmap.engine.execution.SqlExecutor.executeQuery( SqlExecutor.java:175)

 at com.ibatis.sqlmap.engine.mapping.statement.MappedStatement.sqlExecuteQuery( MappedStatement.java:221)

 at com.ibatis.sqlmap.engine.mapping.statement.MappedStatement.executeQueryWithCallback( MappedStatement.java:189)

 at com.ibatis.sqlmap.engine.mapping.statement.MappedStatement.executeQueryForList( MappedStatement.java:139)

 at com.ibatis.sqlmap.engine.impl.SqlMapExecutorDelegate.queryForList( SqlMapExecutorDelegate.java:567)

 at com.ibatis.sqlmap.engine.impl.SqlMapExecutorDelegate.queryForList( SqlMapExecutorDelegate.java:541)

 at com.ibatis.sqlmap.engine.impl.SqlMapSessionImpl.queryForList( SqlMapSessionImpl.java:118)

 at org.springframework.orm.ibatis.SqlMapClientTemplate$3.doInSqlMapClient( SqlMapClientTemplate.java:298)

 at org.springframework.orm.ibatis.SqlMapClientTemplate.execute( SqlMapClientTemplate.java:209)

 at org.springframework.orm.ibatis.SqlMapClientTemplate.executeWithListResult( SqlMapClientTemplate.java:249)

 at org.springframework.orm.ibatis.SqlMapClientTemplate.queryForList( SqlMapClientTemplate.java:296)

 at org.springframework.orm.ibatis.SqlMapClientTemplate.queryForList( SqlMapClientTemplate.java:290)

 at info.zzxwill.ssi4freshman.dao.AccountDao.showAccount( AccountDao.java:24)

 at info.zzxwill.ssi4freshman.service.AccountService.showAccount( AccountService.java:21)

 at info.zzxwill.ssi4freshman.action.AccountAction.showAccount( AccountAction.java:20)

 at sun.reflect.NativeMethodAccessorImpl.invoke0( Native Method )

 at sun.reflect.NativeMethodAccessorImpl.invoke( NativeMethodAccessorImpl.java:39)

 at sun.reflect.DelegatingMethodAccessorImpl.invoke( DelegatingMethodAccessorImpl.java:25)

 at java.lang.reflect.Method.invoke( Method.java:597 )

 at com.opensymphony.xwork2.DefaultActionInvocation.invokeAction( DefaultActionInvocation.java:441)

 at com.opensymphony.xwork2.DefaultActionInvocation.invokeActionOnly( DefaultActionInvocation.java:280)

 at com.opensymphony.xwork2.DefaultActionInvocation.invoke( DefaultActionInvocation.java:243)

 at com.opensymphony.xwork2.interceptor.DefaultWorkflowInterceptor.doIntercept( DefaultWorkflowInterceptor.java:165)

 at com.opensymphony.xwork2.interceptor.MethodFilterInterceptor.intercept( MethodFilterInterceptor.java:87)

 at com.opensymphony.xwork2.DefaultActionInvocation.invoke( DefaultActionInvocation.java:237)

 at com.opensymphony.xwork2.validator.ValidationInterceptor.doIntercept( ValidationInterceptor.java:252)

 at org.apache.struts2.interceptor.validation.AnnotationValidationInterceptor.doIntercept( AnnotationValidationInterceptor.java:68)

 at com.opensymphony.xwork2.interceptor.MethodFilterInterceptor.intercept( MethodFilterInterceptor.java:87)

 at com.opensymphony.xwork2.DefaultActionInvocation.invoke( DefaultActionInvocation.java:237)

 at com.opensymphony.xwork2.interceptor.ConversionErrorInterceptor.intercept( ConversionErrorInterceptor.java:122)

 at com.opensymphony.xwork2.DefaultActionInvocation.invoke( DefaultActionInvocation.java:237)

 at com.opensymphony.xwork2.interceptor.ParametersInterceptor.doIntercept( ParametersInterceptor.java:195)

 at com.opensymphony.xwork2.interceptor.MethodFilterInterceptor.intercept( MethodFilterInterceptor.java:87)

 at com.opensymphony.xwork2.DefaultActionInvocation.invoke( DefaultActionInvocation.java:237)

 at com.opensymphony.xwork2.interceptor.ParametersInterceptor.doIntercept( ParametersInterceptor.java:195)

 at com.opensymphony.xwork2.interceptor.MethodFilterInterceptor.intercept( MethodFilterInterceptor.java:87)

 at com.opensymphony.xwork2.DefaultActionInvocation.invoke( DefaultActionInvocation.java:237)

 at com.opensymphony.xwork2.interceptor.StaticParametersInterceptor.intercept( StaticParametersInterceptor.java:179)

 at com.opensymphony.xwork2.DefaultActionInvocation.invoke( DefaultActionInvocation.java:237)

 at org.apache.struts2.interceptor.MultiselectInterceptor.intercept( MultiselectInterceptor.java:75)

 at com.opensymphony.xwork2.DefaultActionInvocation.invoke( DefaultActionInvocation.java:237)

 at org.apache.struts2.interceptor.CheckboxInterceptor.intercept( CheckboxInterceptor.java:94)

 at com.opensymphony.xwork2.DefaultActionInvocation.invoke( DefaultActionInvocation.java:237)

 at org.apache.struts2.interceptor.FileUploadInterceptor.intercept( FileUploadInterceptor.java:235)

 at com.opensymphony.xwork2.DefaultActionInvocation.invoke( DefaultActionInvocation.java:237)

 at com.opensymphony.xwork2.interceptor.ModelDrivenInterceptor.intercept( ModelDrivenInterceptor.java:89)

 at com.opensymphony.xwork2.DefaultActionInvocation.invoke( DefaultActionInvocation.java:237)

 at com.opensymphony.xwork2.interceptor.ScopedModelDrivenInterceptor.intercept( ScopedModelDrivenInterceptor.java:130)

 at com.opensymphony.xwork2.DefaultActionInvocation.invoke( DefaultActionInvocation.java:237)

 at org.apache.struts2.interceptor.debugging.DebuggingInterceptor.intercept( DebuggingInterceptor.java:267)

 at com.opensymphony.xwork2.DefaultActionInvocation.invoke( DefaultActionInvocation.java:237)

 at com.opensymphony.xwork2.interceptor.ChainingInterceptor.intercept( ChainingInterceptor.java:126)

 at com.opensymphony.xwork2.DefaultActionInvocation.invoke( DefaultActionInvocation.java:237)

 at com.opensymphony.xwork2.interceptor.PrepareInterceptor.doIntercept( PrepareInterceptor.java:138)

 at com.opensymphony.xwork2.interceptor.MethodFilterInterceptor.intercept( MethodFilterInterceptor.java:87)

 at com.opensymphony.xwork2.DefaultActionInvocation.invoke( DefaultActionInvocation.java:237)

 at com.opensymphony.xwork2.interceptor.I18nInterceptor.intercept( I18nInterceptor.java:165)

 at com.opensymphony.xwork2.DefaultActionInvocation.invoke( DefaultActionInvocation.java:237)

 at org.apache.struts2.interceptor.ServletConfigInterceptor.intercept( ServletConfigInterceptor.java:164)

 at com.opensymphony.xwork2.DefaultActionInvocation.invoke( DefaultActionInvocation.java:237)

 at com.opensymphony.xwork2.interceptor.AliasInterceptor.intercept( AliasInterceptor.java:179)

 at com.opensymphony.xwork2.DefaultActionInvocation.invoke( DefaultActionInvocation.java:237)

 at com.opensymphony.xwork2.interceptor.ExceptionMappingInterceptor.intercept( ExceptionMappingInterceptor.java:176)

 at com.opensymphony.xwork2.DefaultActionInvocation.invoke( DefaultActionInvocation.java:237)

 at org.apache.struts2.impl.StrutsActionProxy.execute( StrutsActionProxy.java:52)

 at org.apache.struts2.dispatcher.Dispatcher.serviceAction( Dispatcher.java:488)

 at org.apache.struts2.dispatcher.FilterDispatcher.doFilter( FilterDispatcher.java:395)

 at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter( ApplicationFilterChain.java:235)

 at org.apache.catalina.core.ApplicationFilterChain.doFilter( ApplicationFilterChain.java:206)

 at org.apache.catalina.core.StandardWrapperValve.invoke( StandardWrapperValve.java:233)

 at org.apache.catalina.core.StandardContextValve.invoke( StandardContextValve.java:191)

 at org.apache.catalina.core.StandardHostValve.invoke( StandardHostValve.java:127)

 at org.apache.catalina.valves.ErrorReportValve.invoke( ErrorReportValve.java:102)

 at org.apache.catalina.core.StandardEngineValve.invoke( StandardEngineValve.java:109)

 at org.apache.catalina.connector.CoyoteAdapter.service( CoyoteAdapter.java:291)

 at org.apache.coyote.http11.Http11Processor.process( Http11Processor.java:859)

 at org.apache.coyote.http11.Http11Protocol$Http11ConnectionHandler.process( Http11Protocol.java:602)

 at org.apache.tomcat.util.net.JIoEndpoint$Worker.run( JIoEndpoint.java:489)

 at java.lang.Thread.run( Thread.java:619 )

Caused by: com.mchange.v2.resourcepool.CannotAcquireResourceException : A ResourcePool could not acquire a resource from its primary factory or source.

 at com.mchange.v2.resourcepool.BasicResourcePool.awaitAvailable( BasicResourcePool.java:1319)

 at com.mchange.v2.resourcepool.BasicResourcePool.prelimCheckoutResource( BasicResourcePool.java:557)

 at com.mchange.v2.resourcepool.BasicResourcePool.checkoutResource( BasicResourcePool.java:477)

 at com.mchange.v2.c3p0.impl.C3P0PooledConnectionPool.checkoutPooledConnection( C3P0PooledConnectionPool.java:525)

 ... 90 more

\[ERROR\] 2012-05-30 11:16:59 :Error calling Connection.prepareStatement:

 java.sql.SQLException: Connections could not be acquired from the underlying database!

 at com.mchange.v2.sql.SqlUtils.toSQLException( SqlUtils.java:106 )

 at com.mchange.v2.c3p0.impl.C3P0PooledConnectionPool.checkoutPooledConnection( C3P0PooledConnectionPool.java:529)

 at com.mchange.v2.c3p0.impl.AbstractPoolBackedDataSource.getConnection( AbstractPoolBackedDataSource.java:128)

 at org.springframework.jdbc.datasource.DataSourceUtils.doGetConnection( DataSourceUtils.java:113)

 at org.springframework.jdbc.datasource.TransactionAwareDataSourceProxy$TransactionAwareInvocationHandler.invoke( TransactionAwareDataSourceProxy.java:210)

 at $Proxy5.prepareStatement(Unknown Source)

 at sun.reflect.NativeMethodAccessorImpl.invoke0( Native Method )

 at sun.reflect.NativeMethodAccessorImpl.invoke( NativeMethodAccessorImpl.java:39)

 at sun.reflect.DelegatingMethodAccessorImpl.invoke( DelegatingMethodAccessorImpl.java:25)

 at java.lang.reflect.Method.invoke( Method.java:597 )

 at com.ibatis.common.jdbc.logging.ConnectionLogProxy.invoke( ConnectionLogProxy.java:53)

 at $Proxy6.prepareStatement(Unknown Source)

 at com.ibatis.sqlmap.engine.execution.SqlExecutor.prepareStatement( SqlExecutor.java:497)

 at com.ibatis.sqlmap.engine.execution.SqlExecutor.executeQuery( SqlExecutor.java:175)

 at com.ibatis.sqlmap.engine.mapping.statement.MappedStatement.sqlExecuteQuery( MappedStatement.java:221)

 at com.ibatis.sqlmap.engine.mapping.statement.MappedStatement.executeQueryWithCallback( MappedStatement.java:189)

 at com.ibatis.sqlmap.engine.mapping.statement.MappedStatement.executeQueryForList( MappedStatement.java:139)

 at com.ibatis.sqlmap.engine.impl.SqlMapExecutorDelegate.queryForList( SqlMapExecutorDelegate.java:567)

 at com.ibatis.sqlmap.engine.impl.SqlMapExecutorDelegate.queryForList( SqlMapExecutorDelegate.java:541)

 at com.ibatis.sqlmap.engine.impl.SqlMapSessionImpl.queryForList( SqlMapSessionImpl.java:118)

 at org.springframework.orm.ibatis.SqlMapClientTemplate$3.doInSqlMapClient( SqlMapClientTemplate.java:298)

 at org.springframework.orm.ibatis.SqlMapClientTemplate.execute( SqlMapClientTemplate.java:209)

 at org.springframework.orm.ibatis.SqlMapClientTemplate.executeWithListResult( SqlMapClientTemplate.java:249)

 at org.springframework.orm.ibatis.SqlMapClientTemplate.queryForList( SqlMapClientTemplate.java:296)

 at org.springframework.orm.ibatis.SqlMapClientTemplate.queryForList( SqlMapClientTemplate.java:290)

 at info.zzxwill.ssi4freshman.dao.AccountDao.showAccount( AccountDao.java:24)

 at info.zzxwill.ssi4freshman.service.AccountService.showAccount( AccountService.java:21)

 at info.zzxwill.ssi4freshman.action.AccountAction.showAccount( AccountAction.java:20)

 at sun.reflect.NativeMethodAccessorImpl.invoke0( Native Method )

 at sun.reflect.NativeMethodAccessorImpl.invoke( NativeMethodAccessorImpl.java:39)

 at sun.reflect.DelegatingMethodAccessorImpl.invoke( DelegatingMethodAccessorImpl.java:25)

 at java.lang.reflect.Method.invoke( Method.java:597 )

 at com.opensymphony.xwork2.DefaultActionInvocation.invokeAction( DefaultActionInvocation.java:441)

 at com.opensymphony.xwork2.DefaultActionInvocation.invokeActionOnly( DefaultActionInvocation.java:280)

 at com.opensymphony.xwork2.DefaultActionInvocation.invoke( DefaultActionInvocation.java:243)

 at com.opensymphony.xwork2.interceptor.DefaultWorkflowInterceptor.doIntercept( DefaultWorkflowInterceptor.java:165)

 at com.opensymphony.xwork2.interceptor.MethodFilterInterceptor.intercept( MethodFilterInterceptor.java:87)

 at com.opensymphony.xwork2.DefaultActionInvocation.invoke( DefaultActionInvocation.java:237)

 at com.opensymphony.xwork2.validator.ValidationInterceptor.doIntercept( ValidationInterceptor.java:252)

 at org.apache.struts2.interceptor.validation.AnnotationValidationInterceptor.doIntercept( AnnotationValidationInterceptor.java:68)

 at com.opensymphony.xwork2.interceptor.MethodFilterInterceptor.intercept( MethodFilterInterceptor.java:87)

 at com.opensymphony.xwork2.DefaultActionInvocation.invoke( DefaultActionInvocation.java:237)

 at com.opensymphony.xwork2.interceptor.ConversionErrorInterceptor.intercept( ConversionErrorInterceptor.java:122)

 at com.opensymphony.xwork2.DefaultActionInvocation.invoke( DefaultActionInvocation.java:237)

 at com.opensymphony.xwork2.interceptor.ParametersInterceptor.doIntercept( ParametersInterceptor.java:195)

 at com.opensymphony.xwork2.interceptor.MethodFilterInterceptor.intercept( MethodFilterInterceptor.java:87)

 at com.opensymphony.xwork2.DefaultActionInvocation.invoke( DefaultActionInvocation.java:237)

 at com.opensymphony.xwork2.interceptor.ParametersInterceptor.doIntercept( ParametersInterceptor.java:195)

 at com.opensymphony.xwork2.interceptor.MethodFilterInterceptor.intercept( MethodFilterInterceptor.java:87)

 at com.opensymphony.xwork2.DefaultActionInvocation.invoke( DefaultActionInvocation.java:237)

 at com.opensymphony.xwork2.interceptor.StaticParametersInterceptor.intercept( StaticParametersInterceptor.java:179)

 at com.opensymphony.xwork2.DefaultActionInvocation.invoke( DefaultActionInvocation.java:237)

 at org.apache.struts2.interceptor.MultiselectInterceptor.intercept( MultiselectInterceptor.java:75)

 at com.opensymphony.xwork2.DefaultActionInvocation.invoke( DefaultActionInvocation.java:237)

 at org.apache.struts2.interceptor.CheckboxInterceptor.intercept( CheckboxInterceptor.java:94)

 at com.opensymphony.xwork2.DefaultActionInvocation.invoke( DefaultActionInvocation.java:237)

 at org.apache.struts2.interceptor.FileUploadInterceptor.intercept( FileUploadInterceptor.java:235)

 at com.opensymphony.xwork2.DefaultActionInvocation.invoke( DefaultActionInvocation.java:237)

 at com.opensymphony.xwork2.interceptor.ModelDrivenInterceptor.intercept( ModelDrivenInterceptor.java:89)

 at com.opensymphony.xwork2.DefaultActionInvocation.invoke( DefaultActionInvocation.java:237)

 at com.opensymphony.xwork2.interceptor.ScopedModelDrivenInterceptor.intercept( ScopedModelDrivenInterceptor.java:130)

 at com.opensymphony.xwork2.DefaultActionInvocation.invoke( DefaultActionInvocation.java:237)

 at org.apache.struts2.interceptor.debugging.DebuggingInterceptor.intercept( DebuggingInterceptor.java:267)

 at com.opensymphony.xwork2.DefaultActionInvocation.invoke( DefaultActionInvocation.java:237)

 at com.opensymphony.xwork2.interceptor.ChainingInterceptor.intercept( ChainingInterceptor.java:126)

 at com.opensymphony.xwork2.DefaultActionInvocation.invoke( DefaultActionInvocation.java:237)

 at com.opensymphony.xwork2.interceptor.PrepareInterceptor.doIntercept( PrepareInterceptor.java:138)

 at com.opensymphony.xwork2.interceptor.MethodFilterInterceptor.intercept( MethodFilterInterceptor.java:87)

 at com.opensymphony.xwork2.DefaultActionInvocation.invoke( DefaultActionInvocation.java:237)

 at com.opensymphony.xwork2.interceptor.I18nInterceptor.intercept( I18nInterceptor.java:165)

 at com.opensymphony.xwork2.DefaultActionInvocation.invoke( DefaultActionInvocation.java:237)

 at org.apache.struts2.interceptor.ServletConfigInterceptor.intercept( ServletConfigInterceptor.java:164)

 at com.opensymphony.xwork2.DefaultActionInvocation.invoke( DefaultActionInvocation.java:237)

 at com.opensymphony.xwork2.interceptor.AliasInterceptor.intercept( AliasInterceptor.java:179)

 at com.opensymphony.xwork2.DefaultActionInvocation.invoke( DefaultActionInvocation.java:237)

 at com.opensymphony.xwork2.interceptor.ExceptionMappingInterceptor.intercept( ExceptionMappingInterceptor.java:176)

 at com.opensymphony.xwork2.DefaultActionInvocation.invoke( DefaultActionInvocation.java:237)

 at org.apache.struts2.impl.StrutsActionProxy.execute( StrutsActionProxy.java:52)

 at org.apache.struts2.dispatcher.Dispatcher.serviceAction( Dispatcher.java:488)

 at org.apache.struts2.dispatcher.FilterDispatcher.doFilter( FilterDispatcher.java:395)

 at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter( ApplicationFilterChain.java:235)

 at org.apache.catalina.core.ApplicationFilterChain.doFilter( ApplicationFilterChain.java:206)

 at org.apache.catalina.core.StandardWrapperValve.invoke( StandardWrapperValve.java:233)

 at org.apache.catalina.core.StandardContextValve.invoke( StandardContextValve.java:191)

 at org.apache.catalina.core.StandardHostValve.invoke( StandardHostValve.java:127)

 at org.apache.catalina.valves.ErrorReportValve.invoke( ErrorReportValve.java:102)

 at org.apache.catalina.core.StandardEngineValve.invoke( StandardEngineValve.java:109)

 at org.apache.catalina.connector.CoyoteAdapter.service( CoyoteAdapter.java:291)

 at org.apache.coyote.http11.Http11Processor.process( Http11Processor.java:859)

 at org.apache.coyote.http11.Http11Protocol$Http11ConnectionHandler.process( Http11Protocol.java:602)

 at org.apache.tomcat.util.net.JIoEndpoint$Worker.run( JIoEndpoint.java:489)

 at java.lang.Thread.run( Thread.java:619 )

Caused by: com.mchange.v2.resourcepool.CannotAcquireResourceException : A ResourcePool could not acquire a resource from its primary factory or source.

 at com.mchange.v2.resourcepool.BasicResourcePool.awaitAvailable( BasicResourcePool.java:1319)

 at com.mchange.v2.resourcepool.BasicResourcePool.prelimCheckoutResource( BasicResourcePool.java:557)

 at com.mchange.v2.resourcepool.BasicResourcePool.checkoutResource( BasicResourcePool.java:477)

 at com.mchange.v2.c3p0.impl.C3P0PooledConnectionPool.checkoutPooledConnection( C3P0PooledConnectionPool.java:525)

 ... 90 more

\[WARN \] 2012-05-30 11:16:59 :com.mchange.v2.resourcepool.BasicResourcePool$AcquireTask@976434 -- Acquisition Attempt Failed!!! Clearing pending acquires. While trying to acquire a needed new resource, we failed to succeed more than the maximum number of allowed acquisition attempts (30). Last acquisition attempt exception:

 java.sql.SQLException: Io 异常: The Network Adapter could not establish the connection

 at oracle.jdbc.driver.DatabaseError.throwSqlException( DatabaseError.java:125)

 at oracle.jdbc.driver.DatabaseError.throwSqlException( DatabaseError.java:162)

 at oracle.jdbc.driver.DatabaseError.throwSqlException( DatabaseError.java:274)

 at oracle.jdbc.driver.T4CConnection.logon( T4CConnection.java:319 )

 at oracle.jdbc.driver.PhysicalConnection.<init>( PhysicalConnection.java:344)

 at oracle.jdbc.driver.T4CConnection.<init>( T4CConnection.java:148 )

 at oracle.jdbc.driver.T4CDriverExtension.getConnection( T4CDriverExtension.java:32)

 at oracle.jdbc.driver.OracleDriver.connect( OracleDriver.java:545 )

 at com.mchange.v2.c3p0.DriverManagerDataSource.getConnection( DriverManagerDataSource.java:135)

 at com.mchange.v2.c3p0.WrapperConnectionPoolDataSource.getPooledConnection( WrapperConnectionPoolDataSource.java:182)

 at com.mchange.v2.c3p0.WrapperConnectionPoolDataSource.getPooledConnection( WrapperConnectionPoolDataSource.java:171)

 at com.mchange.v2.c3p0.impl.C3P0PooledConnectionPool$1PooledConnectionResourcePoolManager.acquireResource( C3P0PooledConnectionPool.java:137)

 at com.mchange.v2.resourcepool.BasicResourcePool.doAcquire( BasicResourcePool.java:1014)

 at com.mchange.v2.resourcepool.BasicResourcePool.access$800( BasicResourcePool.java:32)

 at com.mchange.v2.resourcepool.BasicResourcePool$AcquireTask.run( BasicResourcePool.java:1810)

 at com.mchange.v2.async.ThreadPoolAsynchronousRunner$PoolThread.run( ThreadPoolAsynchronousRunner.java:547)

\[INFO \] 2012-05-30 11:16:59 :Loading XML bean definitions from class path resource \[org/springframework/jdbc/support/sql-error-codes.xml\]

 \[INFO \] 2012-05-30 11:16:59 :SQLErrorCodes loaded: \[DB2, Derby, H2, HSQL, Informix, MS-SQL, MySQL, Oracle, PostgreSQL, Sybase\]

 \[WARN \] 2012-05-30 11:16:59 :com.mchange.v2.resourcepool.BasicResourcePool$AcquireTask@140227c -- Acquisition Attempt Failed!!! Clearing pending acquires. While trying to acquire a needed new resource, we failed to succeed more than the maximum number of allowed acquisition attempts (30). Last acquisition attempt exception:

 java.sql.SQLException: Io 异常: The Network Adapter could not establish the connection

 at oracle.jdbc.driver.DatabaseError.throwSqlException( DatabaseError.java:125)

 at oracle.jdbc.driver.DatabaseError.throwSqlException( DatabaseError.java:162)

 at oracle.jdbc.driver.DatabaseError.throwSqlException( DatabaseError.java:274)

 at oracle.jdbc.driver.T4CConnection.logon( T4CConnection.java:319 )

 at oracle.jdbc.driver.PhysicalConnection.<init>( PhysicalConnection.java:344)

 at oracle.jdbc.driver.T4CConnection.<init>( T4CConnection.java:148 )

 at oracle.jdbc.driver.T4CDriverExtension.getConnection( T4CDriverExtension.java:32)

 at oracle.jdbc.driver.OracleDriver.connect( OracleDriver.java:545 )

 at com.mchange.v2.c3p0.DriverManagerDataSource.getConnection( DriverManagerDataSource.java:135)

 at com.mchange.v2.c3p0.WrapperConnectionPoolDataSource.getPooledConnection( WrapperConnectionPoolDataSource.java:182)

 at com.mchange.v2.c3p0.WrapperConnectionPoolDataSource.getPooledConnection( WrapperConnectionPoolDataSource.java:171)

 at com.mchange.v2.c3p0.impl.C3P0PooledConnectionPool$1PooledConnectionResourcePoolManager.acquireResource( C3P0PooledConnectionPool.java:137)

 at com.mchange.v2.resourcepool.BasicResourcePool.doAcquire( BasicResourcePool.java:1014)

 at com.mchange.v2.resourcepool.BasicResourcePool.access$800( BasicResourcePool.java:32)

 at com.mchange.v2.resourcepool.BasicResourcePool$AcquireTask.run( BasicResourcePool.java:1810)

 at com.mchange.v2.async.ThreadPoolAsynchronousRunner$PoolThread.run( ThreadPoolAsynchronousRunner.java:547)

\[WARN \] 2012-05-30 11:16:59 :Error while extracting database product name - falling back to empty error codes

 org.springframework.jdbc.support.MetaDataAccessException : Error while extracting DatabaseMetaData; nested exception is java.sql.SQLException : Connections could not be acquired from the underlying database!

 at org.springframework.jdbc.support.JdbcUtils.extractDatabaseMetaData( JdbcUtils.java:296)

 at org.springframework.jdbc.support.JdbcUtils.extractDatabaseMetaData( JdbcUtils.java:320)

 at org.springframework.jdbc.support.SQLErrorCodesFactory.getErrorCodes( SQLErrorCodesFactory.java:216)

 at org.springframework.jdbc.support.SQLErrorCodeSQLExceptionTranslator.setDataSource( SQLErrorCodeSQLExceptionTranslator.java:140)

 at org.springframework.jdbc.support.SQLErrorCodeSQLExceptionTranslator.<init>( SQLErrorCodeSQLExceptionTranslator.java:103)

 at org.springframework.jdbc.support.JdbcAccessor.getExceptionTranslator( JdbcAccessor.java:99)

 at org.springframework.orm.ibatis.SqlMapClientTemplate.execute( SqlMapClientTemplate.java:212)

 at org.springframework.orm.ibatis.SqlMapClientTemplate.executeWithListResult( SqlMapClientTemplate.java:249)

 at org.springframework.orm.ibatis.SqlMapClientTemplate.queryForList( SqlMapClientTemplate.java:296)

 at org.springframework.orm.ibatis.SqlMapClientTemplate.queryForList( SqlMapClientTemplate.java:290)

 at info.zzxwill.ssi4freshman.dao.AccountDao.showAccount( AccountDao.java:24)

 at info.zzxwill.ssi4freshman.service.AccountService.showAccount( AccountService.java:21)

 at info.zzxwill.ssi4freshman.action.AccountAction.showAccount( AccountAction.java:20)

 at sun.reflect.NativeMethodAccessorImpl.invoke0( Native Method )

 at sun.reflect.NativeMethodAccessorImpl.invoke( NativeMethodAccessorImpl.java:39)

 at sun.reflect.DelegatingMethodAccessorImpl.invoke( DelegatingMethodAccessorImpl.java:25)

 at java.lang.reflect.Method.invoke( Method.java:597 )

 at com.opensymphony.xwork2.DefaultActionInvocation.invokeAction( DefaultActionInvocation.java:441)

 at com.opensymphony.xwork2.DefaultActionInvocation.invokeActionOnly( DefaultActionInvocation.java:280)

 at com.opensymphony.xwork2.DefaultActionInvocation.invoke( DefaultActionInvocation.java:243)

 at com.opensymphony.xwork2.interceptor.DefaultWorkflowInterceptor.doIntercept( DefaultWorkflowInterceptor.java:165)

 at com.opensymphony.xwork2.interceptor.MethodFilterInterceptor.intercept( MethodFilterInterceptor.java:87)

 at com.opensymphony.xwork2.DefaultActionInvocation.invoke( DefaultActionInvocation.java:237)

 at com.opensymphony.xwork2.validator.ValidationInterceptor.doIntercept( ValidationInterceptor.java:252)

 at org.apache.struts2.interceptor.validation.AnnotationValidationInterceptor.doIntercept( AnnotationValidationInterceptor.java:68)

 at com.opensymphony.xwork2.interceptor.MethodFilterInterceptor.intercept( MethodFilterInterceptor.java:87)

 at com.opensymphony.xwork2.DefaultActionInvocation.invoke( DefaultActionInvocation.java:237)

 at com.opensymphony.xwork2.interceptor.ConversionErrorInterceptor.intercept( ConversionErrorInterceptor.java:122)

 at com.opensymphony.xwork2.DefaultActionInvocation.invoke( DefaultActionInvocation.java:237)

 at com.opensymphony.xwork2.interceptor.ParametersInterceptor.doIntercept( ParametersInterceptor.java:195)

 at com.opensymphony.xwork2.interceptor.MethodFilterInterceptor.intercept( MethodFilterInterceptor.java:87)

 at com.opensymphony.xwork2.DefaultActionInvocation.invoke( DefaultActionInvocation.java:237)

 at com.opensymphony.xwork2.interceptor.ParametersInterceptor.doIntercept( ParametersInterceptor.java:195)

 at com.opensymphony.xwork2.interceptor.MethodFilterInterceptor.intercept( MethodFilterInterceptor.java:87)

 at com.opensymphony.xwork2.DefaultActionInvocation.invoke( DefaultActionInvocation.java:237)

 at com.opensymphony.xwork2.interceptor.StaticParametersInterceptor.intercept( StaticParametersInterceptor.java:179)

 at com.opensymphony.xwork2.DefaultActionInvocation.invoke( DefaultActionInvocation.java:237)

 at org.apache.struts2.interceptor.MultiselectInterceptor.intercept( MultiselectInterceptor.java:75)

 at com.opensymphony.xwork2.DefaultActionInvocation.invoke( DefaultActionInvocation.java:237)

 at org.apache.struts2.interceptor.CheckboxInterceptor.intercept( CheckboxInterceptor.java:94)

 at com.opensymphony.xwork2.DefaultActionInvocation.invoke( DefaultActionInvocation.java:237)

 at org.apache.struts2.interceptor.FileUploadInterceptor.intercept( FileUploadInterceptor.java:235)

 at com.opensymphony.xwork2.DefaultActionInvocation.invoke( DefaultActionInvocation.java:237)

 at com.opensymphony.xwork2.interceptor.ModelDrivenInterceptor.intercept( ModelDrivenInterceptor.java:89)

 at com.opensymphony.xwork2.DefaultActionInvocation.invoke( DefaultActionInvocation.java:237)

 at com.opensymphony.xwork2.interceptor.ScopedModelDrivenInterceptor.intercept( ScopedModelDrivenInterceptor.java:130)

 at com.opensymphony.xwork2.DefaultActionInvocation.invoke( DefaultActionInvocation.java:237)

 at org.apache.struts2.interceptor.debugging.DebuggingInterceptor.intercept( DebuggingInterceptor.java:267)

 at com.opensymphony.xwork2.DefaultActionInvocation.invoke( DefaultActionInvocation.java:237)

 at com.opensymphony.xwork2.interceptor.ChainingInterceptor.intercept( ChainingInterceptor.java:126)

 at com.opensymphony.xwork2.DefaultActionInvocation.invoke( DefaultActionInvocation.java:237)

 at com.opensymphony.xwork2.interceptor.PrepareInterceptor.doIntercept( PrepareInterceptor.java:138)

 at com.opensymphony.xwork2.interceptor.MethodFilterInterceptor.intercept( MethodFilterInterceptor.java:87)

 at com.opensymphony.xwork2.DefaultActionInvocation.invoke( DefaultActionInvocation.java:237)

 at com.opensymphony.xwork2.interceptor.I18nInterceptor.intercept( I18nInterceptor.java:165)

 at com.opensymphony.xwork2.DefaultActionInvocation.invoke( DefaultActionInvocation.java:237)

 at org.apache.struts2.interceptor.ServletConfigInterceptor.intercept( ServletConfigInterceptor.java:164)

 at com.opensymphony.xwork2.DefaultActionInvocation.invoke( DefaultActionInvocation.java:237)

 at com.opensymphony.xwork2.interceptor.AliasInterceptor.intercept( AliasInterceptor.java:179)

 at com.opensymphony.xwork2.DefaultActionInvocation.invoke( DefaultActionInvocation.java:237)

 at com.opensymphony.xwork2.interceptor.ExceptionMappingInterceptor.intercept( ExceptionMappingInterceptor.java:176)

 at com.opensymphony.xwork2.DefaultActionInvocation.invoke( DefaultActionInvocation.java:237)

 at org.apache.struts2.impl.StrutsActionProxy.execute( StrutsActionProxy.java:52)

 at org.apache.struts2.dispatcher.Dispatcher.serviceAction( Dispatcher.java:488)

 at org.apache.struts2.dispatcher.FilterDispatcher.doFilter( FilterDispatcher.java:395)

 at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter( ApplicationFilterChain.java:235)

 at org.apache.catalina.core.ApplicationFilterChain.doFilter( ApplicationFilterChain.java:206)

 at org.apache.catalina.core.StandardWrapperValve.invoke( StandardWrapperValve.java:233)

 at org.apache.catalina.core.StandardContextValve.invoke( StandardContextValve.java:191)

 at org.apache.catalina.core.StandardHostValve.invoke( StandardHostValve.java:127)

 at org.apache.catalina.valves.ErrorReportValve.invoke( ErrorReportValve.java:102)

 at org.apache.catalina.core.StandardEngineValve.invoke( StandardEngineValve.java:109)

 at org.apache.catalina.connector.CoyoteAdapter.service( CoyoteAdapter.java:291)

 at org.apache.coyote.http11.Http11Processor.process( Http11Processor.java:859)

 at org.apache.coyote.http11.Http11Protocol$Http11ConnectionHandler.process( Http11Protocol.java:602)

 at org.apache.tomcat.util.net.JIoEndpoint$Worker.run( JIoEndpoint.java:489)

 at java.lang.Thread.run( Thread.java:619 )

Caused by: java.sql.SQLException: Connections could not be acquired from the underlying database!

 at com.mchange.v2.sql.SqlUtils.toSQLException( SqlUtils.java:106 )

 at com.mchange.v2.c3p0.impl.C3P0PooledConnectionPool.checkoutPooledConnection( C3P0PooledConnectionPool.java:529)

 at com.mchange.v2.c3p0.impl.AbstractPoolBackedDataSource.getConnection( AbstractPoolBackedDataSource.java:128)

 at org.springframework.jdbc.datasource.DataSourceUtils.doGetConnection( DataSourceUtils.java:113)

 at org.springframework.jdbc.datasource.TransactionAwareDataSourceProxy$TransactionAwareInvocationHandler.invoke( TransactionAwareDataSourceProxy.java:210)

 at $Proxy5.getMetaData(Unknown Source)

 at org.springframework.jdbc.support.JdbcUtils.extractDatabaseMetaData( JdbcUtils.java:285)

 ... 76 more

Caused by: com.mchange.v2.resourcepool.CannotAcquireResourceException : A ResourcePool could not acquire a resource from its primary factory or source.

 at com.mchange.v2.resourcepool.BasicResourcePool.awaitAvailable( BasicResourcePool.java:1319)

 at com.mchange.v2.resourcepool.BasicResourcePool.prelimCheckoutResource( BasicResourcePool.java:557)

 at com.mchange.v2.resourcepool.BasicResourcePool.checkoutResource( BasicResourcePool.java:477)

 at com.mchange.v2.c3p0.impl.C3P0PooledConnectionPool.checkoutPooledConnection( C3P0PooledConnectionPool.java:525)

 ... 81 more
