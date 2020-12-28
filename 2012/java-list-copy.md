---
title: "Java List拷贝（深拷贝、浅拷贝）"
date: "2012-04-12"
categories: 
  - "java"
tags: 
  - "arraylist"
  - "javase"
---

> package com.zhouzhengxi.homework20120412;
> 
> import java.util.\*; /\*\* \*@Name:周正喜 \*@Date:Apr 12, 2012 7:41:43 PM \*@Function: 测试List浅拷贝(targetList的操作会影响originalList)和深拷贝(targetList的操作不会影响originalList) \*/ public class ListCopy {
> 
> public static void main(String args\[\]){ ListCopy.testListCopy(); }
> 
> private static void testListCopy(){ List<Object> originalList = new ArrayList<Object>(); originalList.add(1); originalList.add(2); originalList.add(3); HashMap<String, String> hm = new HashMap<String, String>(); hm.put("name", "Will"); hm.put("gender", "male"); originalList.add(hm);
> 
> /\*1. 直接赋值\*/ List<Object> targetList = originalList;
> 
> ((HashMap)targetList.get(3)).remove("name"); targetList.remove(0);
> 
> System.out.print("originalList: "); for(int i = 0; i< originalList.size(); i++){ System.out.print(originalList.get(i) + " "); }
> 
> System.out.print("\\ntargetList: ");
> 
> for(int i = 0; i< targetList.size(); i++){ System.out.print(targetList.get(i) + " "); }
> 
> /\*以上输出------------------------------------------------浅拷贝 \* originalList: 2 3 {gender=male} \* targetList: 2 3 {gender=male} \* \*/
> 
> //targetList = originalList. /\*2. Collection.copy\*/ Collections.copy(targetList, originalList); targetList.add(4);
> 
> System.out.print("\\n\\noriginalList: "); for(int i = 0; i< originalList.size(); i++){ System.out.print(originalList.get(i) + " "); }
> 
> System.out.print("\\ntargetList: ");
> 
> for(int i = 0; i< targetList.size(); i++){ System.out.print(targetList.get(i) + " "); }
> 
> /\*以上输出------------------------------------------------浅拷贝 \* originalList: 2 3 {gender=male} 4 \* targetList: 2 3 {gender=male} 4 \* \*/
> 
> /\*3. 定义新对象 \*/ targetList = new ArrayList(originalList); targetList.add(5);
> 
> System.out.print("\\n\\noriginalList: "); for(int i = 0; i< originalList.size(); i++){ System.out.print(originalList.get(i) + " "); }
> 
> System.out.print("\\ntargetList: ");
> 
> for(int i = 0; i< targetList.size(); i++){ System.out.print(targetList.get(i) + " "); }
> 
> /\*以上输出------------------------------------------------深拷贝 \* originalList: 2 3 {gender=male} 4 \* targetList: 2 3 {gender=male} 4 5 \* \*/
> 
> //targetList = new ArrayList<Integer>(originalList.toArray());
> 
> }
> 
> }
