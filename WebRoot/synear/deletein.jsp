<!-- 中文控制 -->
<%@ page contentType="text/html;charset=GBK" %>
<!-- 中文控制 -->

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

            List con = sqlmap.queryForList("selectcode",map);

             Object obj = ((Map)con.get(0)).get("VBILLCODE");
		     Map mapcode = new HashMap();
		     mapcode.put("form_PID",(String)obj);

			 System.out.println("VBILLCODE-----------------------------------"+(String)obj);

		     sqlmap.update("deleteininfo", map);
          

         
           List con1 = sqlmap.queryForList("selectcount",mapcode);

		   System.out.println("CON1-----------------------------------"+con1);

	       Object obj1 = ((Map)con1.get(0)).get("CON");

		     System.out.println("OBJ1-----------------------------------"+obj1);
		   
           int count = ((BigDecimal)obj1).intValue();

		   System.out.println("COUNT-----------------------------------"+count);
	
            if(count<=0){
                 Map mapr = new HashMap();
			     mapr.put("form_PID",(String)obj);
				 sqlmap.update("deletein", mapr);
			}
        
		
	
		sqlmap.commitTransaction();
		out.println("保存成功");
		 response.sendRedirect("viewDayInbill2.aspx?PID="+pid+"&pname="+pname);
	} catch(Exception ex){
		out.println("保存失败"+ex);
	}finally {
		
		sqlmap.endTransaction();
	}

	
%>