<%@ page import="com.ibatis.sqlmap.client.SqlMapClient,com.sn.util.DaoManageUtil"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
	<%
	String facname = request.getParameter("facname");
	String storid = request.getParameter("storid");
	String tem = request.getParameter("tem");
	String makedate = request.getParameter("makedate");
    String stor =  request.getParameter("stor");
	String billid = request.getParameter("billid").replaceAll("-","")+tem;

	SqlMapClient sqlmap = DaoManageUtil.getSqlMap();
	Map map = new HashMap();
	map.put("billid",billid);
    Map con = sqlmap.queryForMap("selectjbcount",map,"con");
	System.out.println(con);


	%>