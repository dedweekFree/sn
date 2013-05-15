<%@ page import="com.ibatis.sqlmap.client.SqlMapClient,com.sn.util.DaoManageUtil"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.math.BigDecimal"%>

	<%
	String facname = request.getParameter("facname");
	String storid = request.getParameter("stockId");
	String tem = request.getParameter("bz");
	String makedate = request.getParameter("searchdate");
	String stor =  request.getParameter("stor");
	String billid = request.getParameter("searchdate").replaceAll("-","")+storid;

	SqlMapClient sqlmap = DaoManageUtil.getSqlMap();

	Map map = new HashMap();
	map.put("billid",billid);
    List con = sqlmap.queryForList("selectjbcount",map);
    List con1= sqlmap.queryForList("isEmptyDAYSTOCK_TEMP",map);

    Object obj = ((Map)con.get(0)).get("CON");
	Object obj1 = ((Map)con1.get(0)).get("CON");

	
    int count = ((BigDecimal)obj).intValue();
    int count1 = ((BigDecimal)obj1).intValue();

    if(count>0){
		response.sendRedirect("newselectybjjb.aspx?searchdate="+makedate+"&bz="+tem+"&stockId="+storid+"&facname="+facname+"&stor="+stor+"&billid="+billid);
	}else{
		response.sendRedirect("newselectyjjb.aspx?searchdate="+makedate+"&bz="+tem+"&stockId="+storid+"&facname="+facname+"&stor="+stor+"&billid="+billid+"&state="+(count1>0?"1":"0"));
	}
   

	%>