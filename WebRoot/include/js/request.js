//����˵����html����jsp���ܲ���
//��    ������������	                       
//���ض��󣺲���ֵ
///////////////////////////////////////////////////
function getParameter(key){
  var QueryString="";
  if(location.href.indexOf("?")>0){
    QueryString=location.href.substr(location.href.indexOf("?")+1);
  }else{
	return ""
  }

  QueryString="&"+QueryString+"&";
  var tempStr;
  key="&"+key+"=";
  if(QueryString.indexOf(key)>=0){
    tempStr=QueryString.substr(QueryString.indexOf(key)+key.length);
    return tempStr.substr(0,tempStr.indexOf("&"));
  }
  return "";
}