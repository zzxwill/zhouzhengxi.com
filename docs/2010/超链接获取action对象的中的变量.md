---
title: "超链接获取action对象的中的变量"
date: "2010-11-19"
tags: 
  - "传值"
---

## 1.1     超链接获取action对象的中的变量

超链接获取action对象的中的变量<%=request.getAttribute("classcase.getClasscaseid()") %>或<%=request.getAttribute("classcase.classcaseid") %>

JSP:<a href="<%=basePath%>getClassCase4Link.action?operateType=unLinked&classcaseid=<%=request.getAttribute("classcase.getClasscaseid()") %>" target="\_blank">制作链接</a>

Action:

/\*\*

\* @Name:zzxwill

\* @Date:Nov 18, 2010 10:45:00 PM

\* @TODO:链接制作选择案例

\* @Parameter:

\*/

public String getClassCase4Link() {

HashMap param =this.getCountQueryParam();

String operateType = request.getParameter("operateType");

if("unLinked".equals(operateType)){

param.put("STATUS", 2);

}else if("linked".equals(operateType)){

param.put("STATUS", 0);

}

param.put("classcaseid", classcase.getClasscaseid());

int totalRows = linkService.getClassCaseCount4Link(param);

//               refreshPage(totalRows, param);

param = this.getQueryParam(totalRows);

classCaseList4Link = linkService.getClassCaseList4Link(param);

if("unLinked".equals(operateType)){

return "unLinked";

}else if("linked".equals(operateType)){

return "linked";

}

return SUCCESS;
