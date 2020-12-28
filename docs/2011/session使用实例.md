---
title: "Session使用实例"
date: "2011-11-16"
---

@RequestMapping(value = "/list.do", method = RequestMethod.GET)

public ModelAndView list(HttpServletRequest request, HttpServletResponse response, ProductQuery query) {

String temp = request.getParameter("chkstatus");

if (temp != null && !temp.equals(""))

{

query.setAllstatus(temp);

}

if(query.getSortColumns()==null)

{

query.setSortColumns("RDATE asc");

}

String quicksearch = request.getParameter("quicksearch");//快速搜索

if(quicksearch==null)

{

quicksearch=this.getFromSession(request,"shfp","quicksearch");

}

if (quicksearch != null) {

putIntoSession(request, "shfp",quicksearch);

query.setPname(quicksearch);//节目名称

query.setMaker(quicksearch);//制作者

query.setPublisher(quicksearch); //出版者

query.setActor(quicksearch);//表演者

query.setIsrc(quicksearch);//ISRC

query.setRname(quicksearch);//登记者

query.setQuicksearch(quicksearch);//是否是快速搜索

}

Page page = this.productService.findPage(query);

ModelAndView result = new ModelAndView("/chkisrcrepeat/list");

result.addObject("chkstatus", query.getAllstatus());

//将参数回传至前台query

if (quicksearch != null)

result.addObject("quicksearch", quicksearch);

result.addAllObjects(toModelMap(page, query));

return result;

}

/\*\*

\* 根据模块名和键名设置session中的值

\* @param request 输入HttpServletRequest参数

\* @param modualname 模块名称

\* @param quicksearch 当前模块中键名

\*/

private void putIntoSession(HttpServletRequest request, String modualname, String quicksearch) {

Map<String,String> map = new HashMap<String, String>();

map.put("quicksearch",quicksearch);

request.getSession().setAttribute(modualname,map);

}

/\*\*

\* 根据模块名和键名获取session中的值

\* @param request 输入HttpServletRequest参数

\* @param modualname 模块名称

\* @param quicksearch 当前模块中键名

\*/

private String getFromSession(HttpServletRequest request,String modualname, String quicksearch) {

Map<String,String> map = (Map<String,String>) request.getSession().getAttribute(modualname);

if(map == null) return null;

else {

return map.get(quicksearch) ;

}

}
