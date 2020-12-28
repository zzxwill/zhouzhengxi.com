---
title: "日期-时间控件"
date: "2012-04-14"
---

这里一篇文章http://www.open-open.com/ajax/DatePicker.htm特别详细的介绍了日期和时间选择控件，其中，既可以选择日期，又可以选择时间的控件主要有：

1.Protoplasm

[http://jongsma.org/software/protoplasm/control/datepicker](http://jongsma.org/software/protoplasm/control/datepicker)

![](images/041412_0603_1.png) 

兼容IE7，8，Google Chrome, Firefox

在IE6下，空间呈透明态，并且样式发生了变化

 

如下，可以改变产生的时间格式

<script type="text/javascript" language="javascript"> // transform() calls can be chained together Protoplasm.use('datepicker') .transform('.datetimepicker', { timePicker: true , **dateTimeFormat: 'yyyy-MM-dd HH:mm:ss'**} );

</script>

 

 

2. Meteora.Calendar

[http://meteora.astrata.com.mx/pages/demo/meteora-calendar](http://meteora.astrata.com.mx/pages/demo/meteora-calendar)

![](images/041412_0603_2.png) 

兼容IE 6

 

3\. JQuery UI和配合下拉列表

![](images/041412_0603_3.png) 

 

 

另外，ASP自带了一款简洁的Calendar

![](images/041412_0603_4.png) 

通过Calendar1.SelectedDate可以获取时间。

但是，这款Calendar不能选择时间，并且总是处于展开状态。
