<?
include_once("../inc/auth.php");

$query = "SELECT * from USER where USER_ID='$LOGIN_USER_ID'";
 $cursor= exequery($connection,$query);
 if($ROW=mysql_fetch_array($cursor))
 { 
    $USER_ID=$ROW["USER_ID"];
    $USER_NAME=$ROW["USER_NAME"];
    $DEPT_ID=$ROW["DEPT_ID"];
    
    $query1 = "SELECT * from DEPARTMENT where DEPT_ID='$DEPT_ID'";
    $cursor1= exequery($connection,$query1);
    if($ROW=mysql_fetch_array($cursor1))
       $DEPT_NAME=$ROW["DEPT_NAME"];
    
 }
?>
<script language=javascript>
var user='<? echo $USER_ID ?>';
var name='<? echo $USER_NAME ?>';
var department='<? echo $DEPT_NAME ?>';
var address = location.host;
//alert("address:"+address);
if((address == '100.100.1.72'))  						
{ this.location.href = 'http://100.100.1.74/videosession/vsessionapply.aspx?OAusername='+user+'&username='+name+'&deptname='+department+'&oaadip='+address}
else if((address == '222.88.22.72'))
{this.location.href = 'http://222.88.22.70/videosession/vsessionapply.aspx?OAusername='+user+'&username='+name+'&deptname='+department+'&oaadip='+address}
else if((address == '218.28.198.237'))
{
this.location.href = 'http://218.28.198.238:200/videosession/vsessionapply.aspx?OAusername='+user+'&username='+name+'&deptname='+department+'&oaadip='+address}
else{
//alert("×ßÁËelse:"+address);
this.location.href = 'http://218.28.198.238:200/videosession/vsessionapply.aspx?OAusername='+user+'&username='+name+'&deptname='+department+'&oaadip='+address}
</script>