<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import="java.sql.ResultSet,java.sql.Statement,java.sql.Connection,com.tend.servlet.DBOracleconn"%>
<% 
 String code = request.getParameter("ordercode");//条形码内容 
%> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"> 
<html><head><title>派车单</title> 
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style>
    .datatable{
		width:100%;
		border:1px black solid;
		border-bottom-style:none;
		border-right-style:none;
		font:12px;
		padding: 0; 
		margin: 0; 
	} 
	.datatable td { 
		border-right: 1px solid black; 
		border-bottom: 1px solid black;  
		font-size:12px;
		line-height:200%;
		padding: 0px 4px 0px 4px; 
		margin: 0;
	}
	.trcolor {text-align:center}
</style>
<script language="javascript"> 
<!-- 
NS4 = (document.layers) ? 1 : 0; 
visble_property_prefix = (NS4) ? "document.layers." : ""; 
visble_property_suffix = (NS4) ? ".visibility" : ".style.display"; 
visble_property_true = (NS4) ? "show" : "block"; 
visble_property_false = (NS4) ? "hide" : "none"; 
visble_property_printview = visble_property_prefix + "viewpanel" + visble_property_suffix; 
function nowprint() { 
 window.print(); 
} 
function window.onbeforeprint() { 
 eval(visble_property_printview + " = \"" + visble_property_false + "\""); 
} 
function window.onafterprint() { 
 eval(visble_property_printview + " = \"" + visble_property_true + "\""); 
} 
//--> 
</script> 
</head> 
<body> 
<% 
 StringBuffer barCode = new StringBuffer(); 
 barCode.append("<img src='"); 
 barCode.append(request.getContextPath()); 
 barCode.append("/CreateBarCode?code="); 
 barCode.append(code); 
 barCode.append("&barType=CODE39&checkCharacter=n&checkCharacterInText=n'>"); 
%>
<table cellpadding=0 cellspacing=0 border = 0 >
<tr>
   <td colspan="3" align="center"><h2>派车单</td>
</tr>
<%
 Connection conn = null;
 Statement stmt = null;
 ResultSet rs = null;
 conn = DBOracleconn.getDBConn();
 stmt = conn.createStatement();
 String sql = "";
 sql += "select a.sendid,a.drivernumber,a.sendcorpname,a.phone,a.createdate,a.orderdate,a.ordertime,";
 sql += " a.address,a.address1,a.remark,sum(d.nshouldoutnum) quantity";
 sql += " from sn_send_manage a,sn_send_manager_d b,ic_general_h c,ic_general_b  d";
 sql += " where a.sendid = b.sendid ";
 sql += " and c.cgeneralhid = d.cgeneralhid ";
		sql += " and c.dr = 0";
		sql += " 	and d.dr = 0";
			sql += " 	   and b.csaleid = d.csourcebillhid(+)";
          sql += " and a.sendid =  '"+code+"'";
        sql += " group by a.sendid,a.drivernumber,a.sendcorpname,a.phone,a.createdate,a.orderdate,a.ordertime,";
        sql += " a.address,a.address1,a.remark";
 rs = stmt.executeQuery(sql);
 String remark = "";
 String add1 = "";
 String add2 = "";
 String stime = "";
 try{
 while(rs.next()){
	 remark = rs.getString("remark");
	 add1 = rs.getString("ADDRESS");
	 add2 = rs.getString("ADDRESS1");
	 stime = rs.getString("ORDERDATE") + " " + rs.getString("ORDERTIME");
	 if(remark == null){
	    remark = "";
	 }
	 if(add1 != null && "chenzhai".equals(add1)){
	     add1 = "陈砦";
	 }else if(add1 != null && "sinian".equals(add1)){
         add1 = "思念";
	 }
	 if(add2 != null &&"chenzhai".equals(add2)){
	     add2 = "陈砦";
	 }else if(add2 != null &&"sinian".equals(add2)){
         add2 = "思念";
	 }else{
	     add2 = "";
	 }
 %>
 <tr  style="font:12px">
    <td width="40%" style="font:12px">派车单号：<%=rs.getString("sendid")%></td>
	<td width="40%" style="font:12px">物流公司：<%=rs.getString("sendcorpname")%></td>
	<td rowspan="4">
 <%out.println(barCode.toString()); %>
 </td>
 </tr>
 <tr>
    <td width="40%" style="font:12px">车牌号：<%=rs.getString("DRIVERNUMBER")%></td>
	<td width="40%" style="font:12px">联系电话：<%=rs.getString("PHONE")%></td>
 </tr>
 <tr>
	<td width="40%" style="font:12px">单据日期：<%=rs.getString("CREATEDATE")%></td>
	<td width="40%" style="font:12px">预约装车时间：<%=stime%></td>
    
 </tr>
 <tr>
	
	<td style="font:12px">第一装车地：<%=add1%></td>
	<td style="font:12px">第二装车地：<%=add2%></td>
 </tr>
 <tr>
   <td style="font:12px">总量：<%=rs.getString("quantity")%></td>
   <td colspan="2" style="font:12px">备注：<%=remark%></td>
 </tr>
 <%
 }
%> 
</table>
<table border="0" cellspacing="0" cellpadding="0" class="datatable">
 <tr class="trcolor">
    <td height="25" nowrap>订单号</td>
    <td height="25" nowrap>数量</td>
    <td height="25" nowrap>到货地</td>
    <td height="25" nowrap>车型</td>
    <td height="25" nowrap>运输公司</td>
  </tr>
  <%
	String sql1 = "";
	 sql1 += "select b.ordercode,b.receiptaddress,b.drivertype,b.drivercorp,sum(d.nshouldoutnum) nnumber";
	 sql1 += " from sn_send_manage a,sn_send_manager_d b,ic_general_h c,ic_general_b  d";
	 sql1 += " where a.sendid = b.sendid ";
	 sql1 += " and c.cgeneralhid = d.cgeneralhid ";
		sql1 += " and c.dr = 0";
		sql1 += " 	and d.dr = 0";
		sql1 += " 	   and b.csaleid = d.csourcebillhid(+)";
        sql1 += " and a.sendid =  '"+code+"'";
        sql1 += " group by b.ordercode,b.receiptaddress,b.drivertype,b.drivercorp order by b.ordercode";
    rs = stmt.executeQuery(sql1);
    int number = 0;
	 while(rs.next()){
		 number +=rs.getInt("NNUMBER");
	 %>
       <tr class="trcolor">
		 <td><%=rs.getString("ORDERCODE")%></td>
		 <td><%=rs.getString("NNUMBER")%></td>
		 <td><%=rs.getString("RECEIPTADDRESS")%></td>
		 <td><%=rs.getString("DRIVERTYPE")%></td>
		 <td><%=rs.getString("DRIVERCORP")%></td>
	  </tr>
	 <%
     }
	 %>
	 <tr>
       <td align="center">合计</td>
	   <td align="center"><%=number%></td>
	   <td>&nbsp;</td>
	   <td>&nbsp;</td>
	   <td>&nbsp;</td>
     </tr>
	 <%
 }catch(Exception e){
    e.printStackTrace();
 }finally{
   DBOracleconn.closeDBconn();
 }
  %>
</table>
<br>
<div id="viewpanel" align="center"> 
<input name="bequery" type="button" value="打 印" style="cursor:hand;" onclick="nowprint();"> 
</div> 
</body> 
</html>
