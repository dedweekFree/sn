<link rel="stylesheet" type="text/css" href="/theme/1/style.css">
<script src="/js/xls/ccorrect_btn.js"></script>

<HTML>
<HEAD>
<TITLE><%=request.getParameter("ATTACHMENT_NAME")%> 在线阅读</TITLE>
<meta http-equiv="content-type" content="text/html;charset=gb2312">
<SCRIPT LANGUAGE="JavaScript" src="/js/xls/tangerocx.js"></SCRIPT>
<SCRIPT LANGUAGE="JavaScript" src="/js/xls/utility.js"></SCRIPT>
<script>
function myload()
{

  TANGER_OCX_SetInfo();
//  TANGER_OCX_OBJ.SetAutoCheckSignKey('726723666');
}
function GetLog(req)
{
  if(isUndefined(req))
  {
     _get("get_log.php","YM=1104&ATTACH_ID=726723666&ATTACH_NAME=%D2%BD%C1%C6%BF%A8%B7%A2%B7%C5%C3%FB%B5%A52011-0203.xls",GetLog);
  }
  else if(req.status==200)
  {
     $('OC_LOG').innerHTML = req.responseText;
  }
}

function GetHistory(req)
{
  if(isUndefined(req))
  {
     _get("get_history.php","YM=1104&ATTACH_ID=726723666&ATTACH_NAME=%D2%BD%C1%C6%BF%A8%B7%A2%B7%C5%C3%FB%B5%A52011-0203.xls",GetHistory);
  }
  else if(req.status==200)
  {
     $('OC_HISTORY').innerHTML = req.responseText;
  }
}
</script>
</HEAD>

<BODY class="bodycolor" leftmargin="0" topmargin="5" onLoad="myload();this.focus();" onunload="javascript:close_doc()">
<form name="form1" id="form1" method="post" action="upload_OC.php" enctype="multipart/form-data">

<table width=100% height=100% class="small" align="center">
<tr width=100%>
<td id="td_menu" valign=top width=100>
  <table class="TableBlock" width="100%" align="center">
     <tr class="TableHeader">
       <td nowrap align="center" onclick="ShowOperationBar();" style="cursor:pointer;">&lt;&lt; 隐藏常用操作</td>
     </tr>
   <tr class="TableHeader">
     <td nowrap align="center">电子认证</td>
   </tr>
     <tr class="TableData" onclick="DoCheckSign('726723666')" style="cursor:hand;line-height:20px;">
       <td nowrap align="center">验证签名及印章</td>
     </tr>
  </table>
<span class="small" style="cursor:hand;" title="点击打开操作提示与技巧窗口" onclick="javascript:window.open('/module/iask?FUNC=module_oc','iask','top=0,left=0,width=600,height=500,status=1,toolbar=no,menubar=no,location=no,scrollbars=yes,resizable=yes')">&nbsp;<img src="/images/iask_small.png" align="absmiddle"></span></td>
<td id="td_control" valign=top width=10 onclick="ShowOperationBar()" title="显示常用操作" style="display:none;cursor:pointer;padding:5px 2px 0px 5px;">
   &gt;&gt;显示常用操作
</td>
<td valign="top" style="padding-left:3px;">
<object id="TANGER_OCX" classid="clsid:C9BC4DFF-4248-4a3c-8A49-63A7D317F404"
codebase="OfficeControl.cab#version=5,0,1,1" width="100%" height="100%">

<param name="IsNoCopy" value="0">
<param name="FileSave" value="1">
<param name="FileSaveAs" value="1">
<param name="Caption" value="Office文档在线编辑">
<param name="BorderStyle" value="3">
<param name="BorderColor" value="14402205">
<param name="Titlebar" value="0">
<param name="TitlebarColor" value="14402205">
<param name="TitlebarTextColor" value="0">
<param name="Menubar" value="1">
<param name="MenubarColor" value="14402205">
<param name="MenuBarStyle" value="2">
<param name="MenuButtonFrameColor" value="102205">
<param name="ToolBars" value="1">
<param name="IsShowToolMenu" value="1">
<param name="IsHiddenOpenURL" value="0">
<param name="IsUseUTF8URL" value="-1">
<param name="MakerCaption" value="中国兵器工业信息中心通达科技">
<param name="MakerKey" value="EC38E00341678B7549B46F19D4CAF4D89866B164">
<param name="ProductCaption" value="Office Anywhere">
<param name="ProductKey" value="460655BF84C22ADA846B8AC7E4B3089882E368B3">

<SPAN STYLE="color:red"><br>不能装载文档控件，请设置好IE安全级别为中或中低，不支持非IE内核的浏览器。</SPAN>
</object>
<div id="OC_LOG" align="center" style="display:none;"></div>
<div id="OC_HISTORY" align="center" style="display:none;"></div>
</td>
</tr>
</table>
<script language="JScript" for=TANGER_OCX event="OnDocumentClosed()">
TANGER_OCX_OnDocumentClosed();
</script>

<script language="JScript">
var TANGER_OCX_str;
var TANGER_OCX_obj;

function close_doc()
{
   document.all("TANGER_OCX").setAttribute("IsNoCopy",false);
}
</script>

<script language="JScript" for=TANGER_OCX event="OnDocumentOpened(TANGER_OCX_str,TANGER_OCX_obj)">
TANGER_OCX_OnDocumentOpened(TANGER_OCX_str,TANGER_OCX_obj);
TANGER_OCX_SetReadOnly(false);
TANGER_OCX_SetMarkModify(true);</script>
<span id="TANGER_OCX_op" style="display:none">7</span>
<span id="TANGER_OCX_filename" style="display:none"><%=request.getParameter("ATTACHMENT_NAME")%></span>
<span id="TANGER_OCX_attachName" style="display:none"><%=request.getParameter("ATTACHMENT_NAME")%></span>
<!-- <span id="TANGER_OCX_attachURL" style="display:none">readxls.jsp?MODULE=email&YM=1104&OP=7&UTF8=&ATTACHMENT_ID=726723666&ATTACHMENT_NAME=<%=request.getParameter("ATTACHMENT_NAME")%></span> -->
<span id="TANGER_OCX_attachURL" style="display:none"><%=request.getParameter("ATTACHMENT_NAME")%></span>
<span id="TANGER_OCX_user" style="display:none">李杰峰</span>

<input style="display:none" type="file" name="ATTACHMENT">
<input type="hidden" name="MODULE" value="email">
<input type="hidden" name="YM" value="1104">
<input type="hidden" name="ATTACHMENT_ID" value="726723666">
<input type="hidden" name="ATTACHMENT_NAME" value="%D2%BD%C1%C6%BF%A8%B7%A2%B7%C5%C3%FB%B5%A52011-0203.xls">
<input type="hidden" name="DOC_SIZE" value="">
</form>

</body>
</html>
