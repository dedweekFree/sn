<%@ page import="com.ibatis.sqlmap.client.SqlMapClient,com.sn.util.DaoManageUtil"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>

<%
    String billid = request.getParameter("billid").replaceAll("-","");
	System.out.println("billid="+billid);
	String[] incode = request.getParameterValues("incode");
	String[] cls = request.getParameterValues("cls");
	String[] fsum = request.getParameterValues("fsum");
	String[] enums = request.getParameterValues("enum");
	String[] insum = request.getParameterValues("insum");
	String[] outnum = request.getParameterValues("outnum");
	String[] reads = request.getParameterValues("read");
	String[] diffs = request.getParameterValues("diffs");

	SqlMapClient sqlmap = DaoManageUtil.getSqlMap();
    
	String storid = request.getParameter("storid");
	String tem = request.getParameter("tem");
	String makedate = request.getParameter("makedate");
    String stor =  request.getParameter("stor");
	String facname = request.getParameter("facname");

	String operate = request.getParameter("operate");
	//#form_billid#,#from_cwarehouseid#,#form_team#,#from_makedate#
try {
		   Map tem1 = new HashMap();
	   tem1.put("form_billid", billid);
		sqlmap.startTransaction();
		sqlmap.startBatch();
  if("temp".equals(operate)){//为临时保存时的情况

       sqlmap.update("updateDAYSTOCK_TEMP",tem1);
       for (int i = 0; i < incode.length; i++) {
            Map map = new HashMap();
			map.put("form_billid", billid);
			map.put("form_invcode", incode[i]);
			map.put("form_diffcount",diffs[i]);
			map.put("form_realcount",reads[i]);
			map.put("form_cls", cls[i]);
	        sqlmap.insert("addDAYSTOCK_TEMP", map);
		}

   }else{//正试保存时的情况
         sqlmap.update("updateDAYSTOCK_TEMP",tem1);
	    Map map1 = new HashMap();
	    map1.put("form_billid", billid);
        map1.put("from_cwarehouseid", storid);
		map1.put("form_team", tem);
		map1.put("from_makedate", makedate);
       sqlmap.insert("addDAYSTOCK_H",map1);
      for (int i = 0; i < incode.length; i++) {
            Map map = new HashMap();
			map.put("form_billid", billid);
			map.put("form_invcode", incode[i]);
			map.put("form_precount", fsum[i]);
			map.put("form_incount", insum[i]);
			map.put("form_outcount", outnum[i]);
			map.put("form_havcount",enums[i]);
			map.put("form_outcount", outnum[i]);
			map.put("form_diffcount",diffs[i]);
			map.put("form_realcount",reads[i].equals("108")?"210":reads[i]);	
			map.put("form_cls", cls[i]);
	        sqlmap.insert("addDAYSTOCK_B", map);
		}

   }


		sqlmap.executeBatch();
		sqlmap.commitTransaction();
		  if("temp".equals(operate)){
			  response.sendRedirect("newselectyjjb.aspx?searchdate="+makedate+"&bz="+tem+"&stockId="+storid+"&facname="+facname+"&stor="+stor+"&billid="+billid+"&state=1");
		  }else{		
			  response.sendRedirect("newselectybjjb.aspx?searchdate="+makedate+"&bz="+tem+"&stockId="+storid+"&facname="+facname+"&stor="+stor+"&billid="+billid);
		  }
	} finally {
		sqlmap.endTransaction();
	}
%>