---
title: ""
date: "2011-05-07"
categories: 
  - "technology_summary"
tags: 
  - "hashmap"
  - "treemap"
---

# 方法一：双重循环

(从略)

# 方法二：HashMap/TreeMap解决

**package** test;

 

**import** java.util.\*;

 

**public** **class** HashSearch {

 

/\*\*

\***@Name**:

\***@Date**:May 7, 2011 10:18:03 AM

\***@TODO**:找出两个数组中相同的元素

\***@Parameter**:

\*/

**public** **static** **void** main(String\[\] args) {

// **TODO** Auto-generated method stub

**int** array1\[\] = {1,2,4,7,9,11};

**int** array2\[\] = {1,4,9,12,19};

HashSearch hashSearch = **new** HashSearch();

/\*1-1: 用HashMap获取的结果是{4=4, 1=1, 9=9}，无序\*/

//HashMap hm = hashSearch.getSameItemFromTwoArrays(array1, array2);

/\*1-1: 用TreeMap获取的结果是{1=1, 4=4, 9=9}，有序\*/

TreeMap<Integer, Integer> hm = hashSearch.getSameItemFromTwoArraysByTreeMap(array1, array2);

 

/\*将Map中的Key只放到Set中\*/

Set<Integer> set = (Set<Integer>) hm.keySet();

 

/\*将Set转化为Iterator，便于输出\*/

Iterator iterator = set.iterator();

**while**(iterator.hasNext()){

System._out_.print(iterator.next().toString()+" ");

}

}

 

 

 

 

/\*\*

\***@Name**:

\***@Date**:May 7, 2011 2:57:17 PM

\***@TODO**:将结果放入HashMap中

\***@Parameter**:

\*/

**public** HashMap getSameItemFromTwoArrays(**int** array1\[\], **int** array2\[\]){

/\*定义两个HashMap，存放数组元素\*/

HashMap hm1 = **new** HashMap();

HashMap hm2 = **new** HashMap();

/\*\*/

**for**(**int** i=0;i<array1.length;i++){

hm1.put(array1\[i\], array1\[i\]);

}

**for**(**int** j=0;j<array2.length;j++){

**if**(hm1.containsKey(array2\[j\])){

hm2.put(array2\[j\], array2\[j\]);

}

}

**return** hm2;

 

}

 

/\*\*

\***@Name**:

\***@Date**:May 7, 2011 2:57:17 PM

\***@TODO**:将结果放入TreeMap中

\***@Parameter**:

\*/

**public** TreeMap getSameItemFromTwoArraysByTreeMap(**int** array1\[\], **int** array2\[\]){

/\*定义两个HashMap，存放数组元素\*/

TreeMap hm1 = **new** TreeMap();

TreeMap hm2 = **new** TreeMap();

/\*\*/

**for**(**int** i=0;i<array1.length;i++){

hm1.put(array1\[i\], array1\[i\]);

}

**for**(**int** j=0;j<array2.length;j++){

**if**(hm1.containsKey(array2\[j\])){

hm2.put(array2\[j\], array2\[j\]);

}

}

**return** hm2;

 

 

 

 

}

 

}
