---
title: "下拉列表选中后，改变其他文本框显示属性，使其显示"
date: "2010-10-20"
tags: 
  - "html"
  - "select"
  - "ssi"
---

## 1.1     下拉列表选中后，改变其他文本框显示属性，使其显示

<tr>

<td width="10%">

类别

</td>

<td width="40%">

<select id="personCategory" name="personCategory"

cssStyle="WIDTH:90%">

<option value=0>

请选择权利人类别

</option>

<option value=1>

自然人

</option>

<option value=2>

机关法人

</option>

<option value=3>

事业单位法人

</option>

<option value=4>

企业法人

</option>

<option value=5>

社团法人

</option>

<option value=6>

其他

</option>

</select>

<script language="javascript">

/\*选了法人后，显示法人单位成立日期\*/

document.getElementById("personCategory").onchange = function(){

var obj = document.getElementById("personCategory"); //selectid

var index = obj.selectedIndex; // 选中索引

var text = obj.options\[index\].text; // 选中文本

var value = obj.options\[index\].value; // 选中值

if(value!=1&&value!=6){

artificialSetUpDate1.style.visibility="visible";

artificialSetUpDate2.style.visibility="visible";

}

else{

artificialSetUpDate1.style.visibility="hidden";

artificialSetUpDate2.style.visibility="hidden";

}

document.g

}

</script>

<!--

<s:select id="personCategory"

cssStyle="WIDTH:90%"

list="#{'自然人':'自然人','机关法人':'机关法人','事业单位法人':'事业单位法人','企业法人':'企业法人','社团法人':'社团法人','其他':'其他'}"

headerKey="" headerValue="请选择权利人类别" /> -->

</td>

<td id="artificialSetUpDate1" class="lbTitle table\_td" width="10%"

style="visibility: hidden;">

法人成立日期

</td>

<td id="artificialSetUpDate2" class="table\_td" width="40%"

style="visibility: hidden;">

<s:textfield name="application.policynationality"

cssStyle="WIDTH:90%" />

</td>

</tr>

选中前：

[![](images/1.png "1")](https://www.zhouzhengxi.com/wordpress/wp-content/uploads/2010/10/1.png)

选中后：

[![](images/2.png "2")](https://www.zhouzhengxi.com/wordpress/wp-content/uploads/2010/10/2.png)
