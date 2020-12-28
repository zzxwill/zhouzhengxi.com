---
title: "Java：获取本地时间和GMT(格林尼治)时间"
date: "2011-11-06"
categories: 
  - "java"
tags: 
  - "calendar"
---

> package info.momoyi.test20111102;
> import java.text.SimpleDateFormat;
> import java.text.ParseException;
> import java.util.Calendar;
> 
> /\*\*
>  \*@Name:
>  \*@Date:Nov 6, 2011 11:02:57 AM
>  \*@Function:获取本地时间和GMT时间
>  \*/
> class Time{
>     public static void main(String\[\] args) throws ParseException {
>     	/\*转换时间格式\*/
>         SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
>         
>         /\*获取本地时间\*/
>         Calendar calendar4Local = Calendar.getInstance();
>         System.out.println("Local Time:\\n"+sf.format(calendar4Local.getTime()));
>         
>         
>         /\*获取GMT时间\*/
>         Calendar calendar4GMT = Calendar.getInstance();
>         int offset = calendar4GMT.get(Calendar.ZONE\_OFFSET)/3600000 + calendar4GMT.get(Calendar.DST\_OFFSET)/3600000;
>         calendar4GMT.add(Calendar.HOUR,-offset);
>         System.out.println("GMT:\\n"+sf.format(calendar4GMT.getTime()));    
>         
>     }
> }
