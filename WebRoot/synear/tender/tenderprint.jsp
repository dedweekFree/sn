<%@ page contentType="text/html;charset=GBK"%>   
  
<HTML><HEAD><TITLE>web��ӡȥ��ҳüҳ�ţ��Լ������ӡ����ҳ��Ԫ��</TITLE>   
<META http-equiv=Content-Type content="text/html; charset=gb2312">   
<SCRIPT language=javascript>   
function printpr() //Ԥ������   
{   
document.all("qingkongyema").click();//��ӡ֮ǰȥ��ҳü��ҳ��   
document.all("dayinDiv").style.display="none"; //��ӡ֮ǰ�����ز����ӡ�����Ԫ�أ����������ء���ӡ���͡���ӡԤ����������ť��   
var OLECMDID = 7;   
var PROMPT = 1;   
var WebBrowser = '<OBJECT ID="WebBrowser1" WIDTH=0 HEIGHT=0 CLASSID="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2"></OBJECT>';   
document.body.insertAdjacentHTML('beforeEnd', WebBrowser);   
WebBrowser1.ExecWB(OLECMDID, PROMPT);   
WebBrowser1.outerHTML = "";   
document.all("dayinDiv").style.display="";//��ӡ֮�󽫸�Ԫ����ʾ��������ʾ������ӡ���͡���ӡԤ����������ť����������´δ�ӡ��   
}   
   
function printTure() //��ӡ����   
{   
 document.all('qingkongyema').click();//ͬ��   
 document.all("dayinDiv").style.display="none";//ͬ��   
 window.print();   
 document.all("dayinDiv").style.display="";   
}   
function doPage()   
{   
 layLoading.style.display = "none";//ͬ��   
}   
   
</SCRIPT>   
   
<script language="VBScript">   
dim hkey_root,hkey_path,hkey_key   
hkey_root="HKEY_CURRENT_USER"   
hkey_path="\Software\Microsoft\Internet Explorer\PageSetup"   
'//������ҳ��ӡ��ҳüҳ��Ϊ��   
function pagesetup_null()   
on error resume next   
Set RegWsh = CreateObject("WScript.Shell")   
hkey_key="\header"   
RegWsh.RegWrite hkey_root+hkey_path+hkey_key,""   
hkey_key="\footer"   
RegWsh.RegWrite hkey_root+hkey_path+hkey_key,""   
end function   
'//������ҳ��ӡ��ҳüҳ��ΪĬ��ֵ   
function pagesetup_default()   
on error resume next   
Set RegWsh = CreateObject("WScript.Shell")   
hkey_key="\header"   
RegWsh.RegWrite hkey_root+hkey_path+hkey_key,"&w&bҳ�룬&p/&P"   
hkey_key="\footer"   
RegWsh.RegWrite hkey_root+hkey_path+hkey_key,"&u&b&d"   
end function   
</script>   
   
</HEAD>   
<BODY background="images/background_01.gif" leftMargin=0   
topMargin=0 rightMargin=0 bottomMargin=0 style="BACKGROUND-POSITION: center 50%">   
   
<DIV align=center>   
    
 ��ϣ����ӡ������..........   
 </DIV>   
   
<DIV align="center" id="dayinDiv" name="dayinDiv"><input type="button" class="tab" value="��ӡ" onclick="printTure();">&nbsp;&nbsp;   
<input type="button" class="tab" value="��ӡԤ��" onclick="printpr();">   
<input type="hidden" name="qingkongyema" id="qingkongyema" class="tab" value="���ҳ��" onclick="pagesetup_null()">&nbsp;&nbsp;   
<input type="hidden" class="tab" value="�ָ�ҳ��" onclick="pagesetup_default()">   
</DIV>   
   
</BODY>   
</HTML>  