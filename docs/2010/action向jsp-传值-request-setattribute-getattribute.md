---
title: "Action向JSP 传值    request  setAttribute  getAttribute"
date: "2010-11-26"
categories: 
  - "javaee"
tags: 
  - "request"
---

## 1.1     Action向JSP 传值

Action: request.setAttribute("deeplinkid", deeplinkid);

JSP: <%=request.getAttribute("deeplinkid") %>
