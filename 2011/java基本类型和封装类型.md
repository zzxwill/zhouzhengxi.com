---
title: "Java基本类型和封装类型"
date: "2011-04-08"
categories: 
  - "java"
---

基本类型和封装类型对应表 基本类型 封装类型 byte Byte short Short int Integer long Long boolean Boolean float Float double Double char Character 基本类型不具备面向对象的基本特征，没有属性和方法。 封装类属于应用类型，具有方法和属性，利用这些属性和方法可以很方便的实现一些基本类型难以完成的功能。 封装类都提供了valueOf(String s)方法，可以完成字符串到封装类之间的转化；toString()方法可以将封装类转化为字符串；同时也提供了将封装类转化为基本类型的方法，例如：intValue()、shortValue()和longValue()等；如果需要将基本类型转化为封装类可以使用封装类的构造方法。
