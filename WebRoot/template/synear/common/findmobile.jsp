<%@ page contentType="text/html;charset=gb2312" language="java" errorPage=""%>
<%
	try{
		System.out.println("**********");
		response.getWriter().write("false,您所查询的手机ID不存在！");
	}catch(Exception e){
		e.printStackTrace();
	}
%>