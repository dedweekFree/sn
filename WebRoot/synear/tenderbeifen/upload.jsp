<%@ page language="java" contentType="text/html;charset=GBK"%>
<% String straction=""; %>
<%@ page import="com.jspsmart.upload.*" %>
<%
	String picName = "/UpLoad/News/";
	SmartUpload jspSmart = new SmartUpload();
	jspSmart.initialize(pageContext);
	jspSmart.setMaxFileSize(1*1024*1024);
	jspSmart.setAllowedFilesList("gif,bmp,jpeg,jpg,JPEG,JPG");
	jspSmart.upload();
	com.jspsmart.upload.File pic = jspSmart.getFiles().getFile(0);
	System.out.println("***********"+pic);
	if (!pic.isMissing())
	{
		String ext = pic.getFileExt();           
		int fileSize = pic.getSize();
		try
		{
			picName += System.currentTimeMillis()+"."+ext;
			pic.saveAs(picName);
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
	}else
	{
		%>
		<script language="javascript">
			parent.reparent("�ϴ�ʧ�ܣ���֪ͨ����Ա","")
		</script>
		<%
	}
	
%>
<script language="javascript">
    parent.reparent("�ϴ��ɹ�111","<%=picName%>")
	//alert("�ϴ�ͼƬ�ɹ�");
	//parent.xuanze.style.display="none";
	//parent.xianshi.style.display="";
	//parent.document.img_prod.src="<%=picName%>";
	//parent.document.theform.imgpath.value="<%=picName%>";
	//this.location.replace("about:blank");
</script>