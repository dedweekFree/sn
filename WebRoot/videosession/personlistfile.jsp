<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../../../js/style.css">
<link rel="stylesheet" type="text/css" href="../../../js/spellCode.css">
<%
String vname=request.getParameter("vname");
String vremark=request.getParameter("vremark");
String vmaker = request.getParameter("vmaker");
String vdate = request.getParameter("vdate");
String vdatescope = request.getParameter("vdatescope");
String vaddress = request.getParameter("vaddress");
String vdeptid = request.getParameter("vdeptid");
String vdeptname = request.getParameter("vdeptname");
%>
<title>文件上传</title>
<script language="JavaScript">
 function chkfrom()
 {
       if (document.form1.upfile.value==""){
	      alert("请选择一个要上传的文件!");
		  document.form1.upfile.focus();
          return false;
	  }
}
</script>
</head>

<body>
<form name="form1" method="post" action="/PersonListServlet?vname=<%=vname%>&vremark=<%=vremark%>&vmaker=<%=vmaker%>&vdate=<%=vdate%>&vdatescope=<%=vdatescope%>&vdeptid=<%=vdeptid%>&vaddress=<%=vaddress%>" enctype="multipart/form-data" onsubmit="return chkfrom();">
  <div align="center">选择文件:

		<input name="upfile" type="file" /> 
		<input type="submit" name="Submit" value="开始上传" />
		<br>
		<table class="datatable" width="50%">
			<tr class="trcolor">
				<td align="right">会议主题</td>
				<td align="left"><%=vname%></td>
			</tr>
			<tr class="trcolor">
				<td align="right">会议概要</td>
				<td align="left"><%=vremark%></td>
			</tr>
			<tr class="trcolor">
				<td align="right">会议开始时间</td>
				<td align="left"><%=vdate%></td>
			</tr>
			<tr class="trcolor">
				<td align="right">会议时长</td>
				<td align="left"><%=vdatescope%> 小时</td>
			</tr>
			<tr class="trcolor">
				<td align="right">会议室名称</td>
				<td align="left"><%=vaddress%></td>
			</tr>
			<tr class="trcolor">
				<td align="right">会议所属部门</td>
				<td align="left"><%=vdeptname%></td>
			</tr>
			<tr class="trcolor">
				<td align="right">申请人</td>
				<td align="left"><%=vmaker%></td>
			</tr>	
		</table>
    <br>
    <br>
  </div>
</form>
</body>
</html>
