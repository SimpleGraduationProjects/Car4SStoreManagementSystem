<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>类别信息</title>
	<link rel="stylesheet" href="images/hsgcommon/common.css" type="text/css">
<link rel="stylesheet" href="images/hsgcommon/div.css" type="text/css">
	<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
  </head>


  <body >
  <p>已有类别信息列表：</p>
  <form name="form1" id="form1" method="post" action="">
   搜索:  商品类别：<input name="shangpinleibie" type="text" id="shangpinleibie" class="form-control2" />
   <input type="submit" name="Submit" value="查找" class="btn btn-info btn-small" /> <input type="button" name="Submit2" value="导出EXCEL" class="btn btn-info btn-small" onClick="javascript:location.href='leibiexinxi_listxls.jsp';" />
</form>

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#F3F3F3" class="table table-striped table-bordered table-hover">  
  <tr>
    <td width="35" height="30" align="center" bgcolor='#E6E6E6'>序号</td>
    <td bgcolor='#E6E6E6'>商品类别</td>
    
    
	
    <td width="138" height="30" align="center" bgcolor='#E6E6E6'>添加时间</td>
    
    <td width="220" height="30" align="center" bgcolor='#E6E6E6'>操作</td>
  </tr>
  <% 
  	


  	 new CommDAO().delete(request,"leibiexinxi"); 
    String url = "leibiexinxi_list.jsp?1=1"; 
    String sql =  "select * from leibiexinxi where 1=1";
	
if(request.getParameter("shangpinleibie")=="" ||request.getParameter("shangpinleibie")==null ){}else{sql=sql+" and shangpinleibie like '%"+request.getParameter("shangpinleibie")+"%'";}
    sql+=" order by id desc";
	ArrayList<HashMap> list = PageManager.getPages(url,15,sql, request); 
	int i=0;
	for(HashMap map:list){ 
	i++;
	
	


     %>
  <tr>
    <td width="35" align="center"><%=i %></td>
    <td><%=map.get("shangpinleibie") %></td>
    
    
	
    <td width="138" align="center"><%=map.get("addtime") %></td>
    <td width="220" align="center"><a class="btn btn-info btn-small" href="leibiexinxi_updt.jsp?id=<%=map.get("id")%>">修改</a>  <a class="btn btn-info btn-small" href="leibiexinxi_list.jsp?scid=<%=map.get("id") %>" onClick="return confirm('真的要删除？')">删除</a> <a class="btn btn-info btn-small" href="leibiexinxi_detail.jsp?id=<%=map.get("id")%>">详细</a> </td>
  </tr>
  	<%
  }
   %>
</table>
<br>
  
<p class="fy">${page.info }</p>


  </body>
</html>

