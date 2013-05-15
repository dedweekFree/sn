
<%@ page import="com.ibatis.sqlmap.client.SqlMapClient,com.sn.util.DaoManageUtil"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%
	String billid = request.getParameter("billid");
	String[] incode = request.getParameterValues("incode");
	String[] cls = request.getParameterValues("cls");
	String[] fsum = request.getParameterValues("fsum");
	String[] enums = request.getParameterValues("enum");
	String[] insum = request.getParameterValues("insum");
	String[] outnum = request.getParameterValues("outnum");
	SqlMapClient sqlmap = DaoManageUtil.getSqlMap();
	try {
		sqlmap.startTransaction();
		//#form_billid#,#form_invcode#,#form.precount#,#form_incount#,#form_outcount#,#form_havcount#,#form_diffcount#,#form_realcount#,#form_cls#
		sqlmap.startBatch();
		for (int i = 0; i < incode.length; i++) {
			Map map = new HashMap();
			map.put("form_billid", billid);
			map.put("form_invcode", incode[i]);
			map.put("form.precount", fsum[i]);
			map.put("form_incount", insum[i]);
			map.put("form_outcount", outnum[i]);
			map.put("form_havcount", enums[i]);
			map.put("form_diffcount", "0");
			map.put("form_cls", cls[i]);
			sqlmap.insert("addDAYSTOCK_B", map);
		}
		sqlmap.executeBatch();
		sqlmap.commitTransaction();
		out.println("保存成功");
	} catch(Exception ex){
		out.println("保存失败");
	}finally {
		
		sqlmap.endTransaction();
	}
%>