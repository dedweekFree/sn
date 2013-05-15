<%@ page language="java" contentType="text/html; charset=gb2312" pageEncoding="gb2312"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.my.DBOracleconn"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>




<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
request.setCharacterEncoding("gb2312");
String ptype=request.getParameter("ptype");
String ptypename=request.getParameter("ptypename");
String scode=request.getParameter("name1");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   
    <title>My JSP 'MyJsp.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="../../js/style.css">
    <link rel="stylesheet" type="text/css" href="../../js/spellCode.css">
<script type="text/javascript">
	function checkAll(m)   
	            {   
               var a = document.getElementsByName(m);   
              
               var b = a.length
               for(i=0;i<b;i++){
                if(document.form1.p.checked){
                  a[i].checked=true;
                
                }else{
                  a[i].checked=false;
                
                }
               
               }
            }   
	
	function m(){
		var  num =document.all.num;
	   var a = document.getElementsByName("p1");   
	  
		var str="";
		for(i=0;i<num.length;i++){
			
			if(num[i].value!=""&&a[i].checked==true){
				str+=num[i].value+";";
			}
			
		}
	
		document.getElementById("aaa").value=str;
		document.form1.action="/GoodsServlet";
		document.form1.submit();
	}
	</script>
  </head>
  
  <body topmargin="0">
   <form name="form1" method="post">
   <input type="hidden" name="ptype" value="<%=ptype%>">
  
   <input type="hidden" name="ptypename" value="<%=ptypename%>">
   <input type="hidden" name="scode" value="<%=scode%>">
   <input type="hidden" name="aaa" id="aaa">
   <table border="1" class="datatable" border="0" cellpadding="0" cellspacing="0">
   <% 
  try{
  Connection conn = DBOracleconn.getDBConn();
			String sql = " select distinct itemcode ,itemdesc from ent_item where itemcode like'"+ptype+"%'";
			PreparedStatement pt = conn.prepareStatement(sql);
			ResultSet rs = pt.executeQuery();
			%>
			
			<tr class="search"><td>操作</td><td>产品编码</td><td>产品名称</td><td>产品数量</td></tr>
			<% 
			while(rs.next()){
			%>
			
			<tr class="search"><td><input type="checkbox" name="p1" value="<%out.print(rs.getString(1)+";"+rs.getString(2)+";");%>"></td><td><%=rs.getString(1) %></td><td><%=rs.getString(2)%></td><td><input type="text" name="num" size="10" id="num"></td></tr><br>
			
			
			<% 
			}
			
			}catch(Exception e){
			  e.printStackTrace();
			} 
   %>
<%



 %>
 <tr class="search"><td><input type="checkbox" id="p" name="p" onclick="checkAll('p1')">全选</td>
 <td><input type="submit" name="s" value="提交" onclick="m()"><td>
 <td></td>
 
 </tr>
 </table>
</form>
  </body>
</html>
