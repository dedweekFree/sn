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
	//�ڷֺſ�ʼ #�Ž���
	String strqxlist=qxlist.substring(intmkbm+tmpmkbm.length(),qxlist.indexOf(";",intmkbm+tmpmkbm.length()));

	if (intmkbm<0 || straction.length()>2)
	{
		%><jsp:forward page="/direct.jsp"/><%
	}else
	{
		if (straction.length()==0){
			if (strqxlist.indexOf("V")<0) strview=" disabled style='display:none' ";    //���
			if (strqxlist.indexOf("A")<0) stradd=" disabled style='display:none' ";     //���
			if (strqxlist.indexOf("E")<0) stredit=" disabled style='display:none' ";    //�޸�
			if (strqxlist.indexOf("D")<0) strdel=" disabled style='display:none' ";     //ɾ��
			if (strqxlist.indexOf("C")<0) strcheck=" disabled style='display:none' ";   //���
			if (strqxlist.indexOf("N")<0) strnone=" disabled style='display:none' ";    //���
			if (strqxlist.indexOf("R")<0) strreply=" disabled style='display:none' ";   //�ظ�
			if (strqxlist.indexOf("U")<0) struncheck=" disabled style='display:none' "; //�������
			if (strqxlist.indexOf("B")<0) strback=" disabled style='display:none' ";    //����ɾ��
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
			//д����־(straction.charAt(0)){
			//Ҫ��ÿ������connon.jsi��ҳ����붨��String straction="";
			//���漰���ݿ���²����ı��붥String straction="AS";�磺��add.jspҳ��String straction="A";add_submit.jspҳ��String straction="AS";	
			if(straction.length()==2)
			   //SetLog����static��̬���������Բ���Ҫ����һ��ʵ��
				net.htjs.javabean.common.OutString.SetLog(str_yhbm.trim(),strmkbm.trim(),straction.charAt(0),request.getRemoteAddr(),remotehost,request.getRemoteUser());
		}
	}
%>
