---
title: "trim()去掉首尾的空白"
date: "2012-06-27"
---

**trim()去掉首尾的空白**

**private** **static** **void** testDemo(){

  /\*半角空格 输出 str\="ab " trim可以去掉半角空格\*/

 String str = " ab" ;

 str = str.trim();

  /\*全角空格 输出 str\="　ab " trim去不掉圆角空格\*/

 str = "　ab" ;

 str = str.trim();

  /\*ASCII 32 空格 输出 str\="ab " trim可以去掉ASCII 32 空格\*/

  **char** ch = ( **char**) Integer. _parseInt_("32" );

 str = ch + "ab" ;

 str = str.trim();

  /\*ASCII 160 空格\*/

 ch = ( **char** ) Integer._parseInt_( "160" );

 str = String. _valueOf_(ch);

 str = ch + "ab" ;

  /\* 输出 str\="　ab" trim不可以去掉ASCII 160 空格\*/

 str = str.trim();

  /\* 可以替换ASCII 160 空格 但是，如果 // str = ch + "ab"; 则搞不定。\*/

 str = String. _valueOf_(ch);

 str = str.replaceAll( "\[\\\\s\\\\u00A0\]+$" , "" );

 }
