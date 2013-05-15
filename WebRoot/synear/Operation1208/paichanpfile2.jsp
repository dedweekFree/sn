<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<%
String formname=request.getParameter("formname");
String picurl=request.getParameter("picurl");
String picsize=request.getParameter("picsize");
String pix=request.getParameter("pix");
String type = request.getParameter("type");
String tendtypeid = request.getParameter("tendtypeid");
String myframeurl = request.getParameter("myframeurl");

if(picsize == null){
	picsize = "";
}
if(pix == null){
	pix = "";
}
if(tendtypeid == null){
	tendtypeid = "";
}
%>
<title>文件上传</title>
<script language="JavaScript">
 function load_img(p_src,write_id){
	var t_html; 
	var width,height;
	if(p_src!=''){  
	t_html="<img src='"+p_src+"' onLoad='javascript:width=this.width;height=this.height;document.form1.width.value=width;document.form1.height.value=height;'>";  
	}else{ 
	t_html=""; 
	} 
	//write_id.innerHTML=t_html; 
	} 
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
<form name="form1" method="post" action="/PaichanUploadFileServlet2?formname=<%=formname%>&myframeurl=<%=myframeurl%>&picurl=<%=picurl%>&picsize=<%=picsize%>&pix=<%=pix%>&type=<%=type%>&tendtypeid=<%=tendtypeid%>" enctype="multipart/form-data" onsubmit="return chkfrom();">
  <div align="center">选择文件:
		<input name="upfile" type="file" id="w_s" onChange="load_img(this.value,img_s);"> 
		<input type="hidden" name="width">
		<input type="hidden" name="height">
		<input type="submit" name="Submit" value="开始上传" />
		<div id="img_s"></div>
    <br>
    <br>
  </div>
</form>
</body>
</html>
