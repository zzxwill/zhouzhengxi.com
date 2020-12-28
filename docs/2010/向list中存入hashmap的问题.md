---
title: "向List中存入HashMap的问题"
date: "2010-11-26"
categories: 
  - "java"
tags: 
  - "hashmap"
  - "javase"
  - "list"
---

## 1.1     向List<HashMap>中存入HashMap的问题

### 1.1.1  情况一：

private List<HashMap> linkedClassCase;

HashMap hm = this.getCountQueryParam();

hm = this.getQueryParam(totalClasscase);

for (int i = 0; i < id.length; i++) {

if (!("".equals(id\[i\]))) {

int classcaseid = Integer.parseInt(id\[i\]);

hm.put("CLASSCASE", linkService.getInfoFromClasscase(classcaseid));

linkedClassCase.add(hm);

}

}

在实际情况下，每回得到的HashMap都不一样。

在这种情况下，存入list中的hashmap都是一样的，这是为什么呢？

由HashMap hm = this.getCountQueryParam(); 知，HashMap实例化后，系统会给其分配一处内存，也就是给其标记一个地址，在for循环过程中，第一次hm的值为hm1, 放入List后，List中该元素为hm1, 然后继续循环，第二次hm的值为hm2, 放入List后，List中该元素为并不是hm2, 但是在调试过程中，发现第一次存入的HashMap由hm1变成hm2了，这是为什么呢？

因为hm是在开始初始化的，所以内存中分配的地址是固定的，也就是该地址第一次存入了hm1, 后来，该地址又存入了hm2, 所以第一次存入的hm1 的内容发生了变化。

### 1.1.2  情况二：

for (int i = 0; i < id.length; i++) {

if (!("".equals(id\[i\]))) {

HashMap hm = this.getCountQueryParam();

hm = this.getQueryParam(totalClasscase);

int classcaseid = Integer.parseInt(id\[i\]);

hm.put("CLASSCASE", linkService.getInfoFromClasscase(classcaseid));

linkedClassCase.add(hm);

}

}

这种情况跟上面不一样的是，它每回都回给HashMap一个新的地址，所以不会发生上面的情况，存值正常。
