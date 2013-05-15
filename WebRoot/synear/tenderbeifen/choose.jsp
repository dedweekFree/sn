<%@ page language="java" contentType="text/html;charset=GBK"%>
<% String straction=""; %>
<HTML>
<HEAD>
<title>上传图片</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<LINK href="../../../include/css/mainstyle.css" rel="stylesheet" type="text/css">
<script Language="javascript" src="../../../include/js/scpub.js"></script>
</HEAD>
<script language="JavaScript">
<!--
function reparent(msg,pic){
	window.returnValue="reparent('"+msg+"','"+pic+"')";
	window.close();
}
function onUpload()
{
	if(strIsNull(document.upload.imgpath.value))
	{
		alert("请选择您要上传的！");
		document.upload.imgpath.focus();
		return;
	}
	document.upload.submit();
	//window.close();
}
-->
</script>
<BODY class=nomarg>
<table class=main cellspacing="0" cellpadding="0" align="center">
<form name=upload encType="multipart/form-data" method=post target=submit action="upload.jsp">
	<table border="0" width="95%" align="center" id=TABLE1 cellSpacing=1 cellPadding=1>
		<tr height="30">
			<td align=center>
				<input type="file" name="imgpath" class=pagebut>
			</td>
		</tr>
		<tr height="40">
			<td align=center>
				<input type="button" class=checkbut name="upBut" value="上传" onclick="onUpload()">
			</td>
		</tr>
	</table>
</form>
</table>
<iframe name="submit" src="about:blank" width="100%" height="30%" noresize frameborder=0 framespacing=0 marginheight=0 marginwidth=0></iframe>
</BODY>
</HTML>