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
<title>�ļ��ϴ�</title>
<script language="JavaScript">
 function chkfrom()
 {
       if (document.form1.upfile.value==""){
	      alert("��ѡ��һ��Ҫ�ϴ����ļ�!");
		  document.form1.upfile.focus();
          return false;
	  }
}
</script>
</head>

<body>
<form name="form1" method="post" action="/PersonListServlet?vname=<%=vname%>&vremark=<%=vremark%>&vmaker=<%=vmaker%>&vdate=<%=vdate%>&vdatescope=<%=vdatescope%>&vdeptid=<%=vdeptid%>&vaddress=<%=vaddress%>" enctype="multipart/form-data" onsubmit="return chkfrom();">
  <div align="center">ѡ���ļ�:

		<input name="upfile" type="file" /> 
		<input type="submit" name="Submit" value="��ʼ�ϴ�" />
		<br>
		<table class="datatable" width="50%">
			<tr class="trcolor">
				<td align="right">��������</td>
				<td align="left"><%=vname%></td>
			</tr>
			<tr class="trcolor">
				<td align="right">�����Ҫ</td>
				<td align="left"><%=vremark%></td>
			</tr>
			<tr class="trcolor">
				<td align="right">���鿪ʼʱ��</td>
				<td align="left"><%=vdate%></td>
			</tr>
			<tr class="trcolor">
				<td align="right">����ʱ��</td>
				<td align="left"><%=vdatescope%> Сʱ</td>
			</tr>
			<tr class="trcolor">
				<td align="right">����������</td>
				<td align="left"><%=vaddress%></td>
			</tr>
			<tr class="trcolor">
				<td align="right">������������</td>
				<td align="left"><%=vdeptname%></td>
			</tr>
			<tr class="trcolor">
				<td align="right">������</td>
				<td align="left"><%=vmaker%></td>
			</tr>	
		</table>
    <br>
    <br>
  </div>
</form>
</body>
</html>
