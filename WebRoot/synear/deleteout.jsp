<%@ page import="com.ibatis.sqlmap.client.SqlMapClient,com.sn.util.DaoManageUtil"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.math.BigDecimal"%>
<%
	String pkrowid = request.getParameter("PKROWID");
	String pid = request.getParameter("PID");
    String pname = request.getParameter("pname");
    SqlMapClient sqlmap = DaoManageUtil.getSqlMap();
	try {
		    sqlmap.startTransaction();
			Map map = new HashMap();
			map.put("form_PID",pkrowid);

            List con = sqlmap.queryForList("selectoutcode",map);

			Object obj = ((Map)con.get(0)).get("CBILLCODE");

		    Map mapcode = new HashMap();


		    mapcode.put("form_PID",(String)obj);

		    sqlmap.update("deleteoutinfo", map);

            List con1 = sqlmap.queryForList("selectoutcount",mapcode);

      
	       Object obj1 = ((Map)con1.get(0)).get("CON");
            int count = ((BigDecimal)obj1).intValue();
            if(count<=0){
                 Map mapr = new HashMap();
			     mapr.put("form_PID",(String)obj);
				 sqlmap.update("deletein", mapr);
			}

		sqlmap.commitTransaction();
	 response.sendRedirect("viewoutbilltype2.aspx?PID="+pid+"&pname="+pname);
	
	}finally {
		
		sqlmap.endTransaction();
	}

	
%>