
<%@ page import="com.ibatis.sqlmap.client.SqlMapClient,com.sn.util.DaoManageUtil"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%
	String pkrowid[] = request.getParameterValues("PKROWID");
	String outcount[] = request.getParameterValues("OUTCOUNT");
	String pid = request.getParameter("PID");
    String pname = request.getParameter("pname");
    SqlMapClient sqlmap = DaoManageUtil.getSqlMap();
	try {
		sqlmap.startTransaction();
	
		sqlmap.startBatch();
		for (int i = 0; i < pkrowid.length; i++) {
			Map map = new HashMap();
			map.put("form_out", outcount[i]);
			map.put("form_PID", pkrowid[i]);
			sqlmap.update("updateoutinfo", map);
		}
		sqlmap.executeBatch();
		sqlmap.commitTransaction();
		out.println("±£´æ³É¹¦");
		if(pid.length()==14){
			 response.sendRedirect("viewoutbilltype2.aspx?PID="+pid+"&pname="+pname);
		}else{
		 response.sendRedirect("viewoutbillcar2.aspx?PID="+pid+"&pname="+pname);
		}
		 
	}finally {
		
		sqlmap.endTransaction();
	}				
%>