
<%@ page import="com.ibatis.sqlmap.client.SqlMapClient,com.sn.util.DaoManageUtil"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%
	String pkrowid[] = request.getParameterValues("PKROWID");
	String incount[] = request.getParameterValues("INCOUNT");
	String pid = request.getParameter("PID");
    String pname = request.getParameter("pname");
    SqlMapClient sqlmap = DaoManageUtil.getSqlMap();
	try {
		sqlmap.startTransaction();
	
		sqlmap.startBatch();
		for (int i = 0; i < pkrowid.length; i++) {
			Map map = new HashMap();
			map.put("form_incount", incount[i]);
			map.put("form_PID", pkrowid[i]);
			sqlmap.update("updateininfo", map);
		}
		sqlmap.executeBatch();
		sqlmap.commitTransaction();
		out.println("����ɹ�");
		 response.sendRedirect("viewDayInbill2.aspx?PID="+pid+"&pname="+pname);
	} catch(Exception ex){
		out.println("����ʧ��");
	}finally {
		
		sqlmap.endTransaction();
	}

	
%>