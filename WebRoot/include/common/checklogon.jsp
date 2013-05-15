<%//@ page errorPage="/err/err.htm" isErrorPage="true" %>
<%//@ page language="java" contentType="text/html;charset=GBK"%>
<%
	String str_yhbm=(String)session.getAttribute("yhbm");
	if(str_yhbm==null||str_yhbm.trim().equals(""))
	{
		%><jsp:forward page="/direct.jsp"/><%
		return;
	}
	String strview="",stradd="",stredit="",strdel="",strcheck="",strnone="",strreply="",struncheck="",strback="";
	String qxlist = (String)session.getAttribute("qxlist");
	String remotehost=(String)session.getAttribute("remotehost");
	String tmpmkbm=";"+strmkbm+"#";
	int intmkbm=qxlist.indexOf(tmpmkbm);
	//于分号开始 #号结束
	String strqxlist=qxlist.substring(intmkbm+tmpmkbm.length(),qxlist.indexOf(";",intmkbm+tmpmkbm.length()));

	if (intmkbm<0 || straction.length()>2)
	{
		%><jsp:forward page="/direct.jsp"/><%
	}else
	{
		if (straction.length()==0){
			if (strqxlist.indexOf("V")<0) strview=" disabled style='display:none' ";    //浏览
			if (strqxlist.indexOf("A")<0) stradd=" disabled style='display:none' ";     //添加
			if (strqxlist.indexOf("E")<0) stredit=" disabled style='display:none' ";    //修改
			if (strqxlist.indexOf("D")<0) strdel=" disabled style='display:none' ";     //删除
			if (strqxlist.indexOf("C")<0) strcheck=" disabled style='display:none' ";   //审核
			if (strqxlist.indexOf("N")<0) strnone=" disabled style='display:none' ";    //清除
			if (strqxlist.indexOf("R")<0) strreply=" disabled style='display:none' ";   //回复
			if (strqxlist.indexOf("U")<0) struncheck=" disabled style='display:none' "; //撤销审核
			if (strqxlist.indexOf("B")<0) strback=" disabled style='display:none' ";    //撤销删除
		}else if (straction.length()==1)
		{
			if (strqxlist.indexOf(straction)<0)
			{
				%><jsp:forward page="/direct.jsp"/><%
			}
		}else
		{
			if (strqxlist.indexOf(straction.charAt(0))<0) {%>
				<jsp:forward page="/direct.jsp"/><%
			}
			//写入日志(straction.charAt(0)){
			//要求每个包含connon.jsi的页面必须定义String straction="";
			//凡涉及数据库更新操作的必须顶String straction="AS";如：在add.jsp页面String straction="A";add_submit.jsp页面String straction="AS";	
			if(straction.length()==2)
			   //SetLog属于static静态方法，所以不需要创建一个实例
				net.htjs.javabean.common.OutString.SetLog(str_yhbm.trim(),strmkbm.trim(),straction.charAt(0),request.getRemoteAddr(),remotehost,request.getRemoteUser());
		}
	}
%>
