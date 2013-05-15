<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page import="com.synear.session.UserList"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=GB2312">
<title>用户列表</title> 
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
<link rel="stylesheet" type="text/css" href="styles.css">
--> 
<script type="text/javascript" src="../../../js/refresh.js"></script>
</head><body>
<div id="userList">
<% UserList userList=UserList.getInstance();
List<String> list = userList.getList();
for (int i = 0; i < list.size(); i++  ) { 
	out.println(list.get(i)+"<br>"); 
}

%>
</div>
<!--form action="servlet/LogoutServlet" method="GET"> 
 <input type="submit" name="logout" value=" 注 销 "> 
 </form-->
 </body> </html>
