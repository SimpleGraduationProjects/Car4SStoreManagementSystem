<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>

<%
response.setContentType("application/vnd.ms-excel");
response.addHeader("Content-Disposition", "attachment;filename=jifenshangpin.xls");
%>
<html>
  <head>
    <title>������Ʒ</title>
	<link rel="stylesheet" href="images/hsgcommon/common.css" type="text/css">
<link rel="stylesheet" href="images/hsgcommon/div.css" type="text/css">
  </head>

  <body >
  <p>���л�����Ʒ�б���</p>
  

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#F3F3F3" class="table table-striped table-bordered table-hover">  
  <tr>
    <td width="30" align="center" bgcolor='#E6E6E6'>���</td>
    <td bgcolor='#E6E6E6'>��Ʒ���</td>
    <td bgcolor='#E6E6E6'>��Ʒ����</td>
    <td bgcolor='#E6E6E6'>��Ʒ���</td>
    <td bgcolor='#E6E6E6'>Ʒ��</td>
    <td bgcolor='#E6E6E6'>�������</td>
    <td bgcolor='#E6E6E6'>����</td>
    <td bgcolor='#E6E6E6' width='90' align='center'>ͼƬ</td>
    
    
    <td width="138" align="center" bgcolor='#E6E6E6'>����ʱ��</td>
  </tr>
  <% 

    String url = "jifenshangpin_list.jsp?1=1"; 
    String sql =  "select * from jifenshangpin where 1=1";
    sql+=" order by id desc";
	ArrayList<HashMap> list = PageManager.getPages(url,15,sql, request); 
	int i=0;
	for(HashMap map:list){ 
	i++;

     %>
  <tr>
    <td width="30" align="center"><%=i %></td>
    <td><%=map.get("shangpinbianhao") %></td>
    <td><%=map.get("shangpinmingcheng") %></td>
    <td><%=map.get("shangpinleibie") %></td>
    <td><%=map.get("pinpai") %></td>
    <td><%=map.get("suoxujifen") %></td>
    <td><%=map.get("xiaoliang") %></td>
    <td width='90' align='center'><a class="btn btn-info btn-small" href='<%=map.get("tupian") %>' target='_blank'><img src='<%=map.get("tupian") %>' width=88 height=99 border=0 /></a></td>
    
    
    <td width="138" align="center"><%=map.get("addtime") %></td>
  </tr>
  	<%
  }
   %>
</table>

<br>
�������ݹ�<%=i %>��
  </body>
</html>
