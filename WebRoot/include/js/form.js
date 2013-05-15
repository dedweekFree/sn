//功能说明：拼表单字符串
//参    数：第一个为表单名称	                       
//返回对象：无
///////////////////////////////////////////////////
function memoURL(form_obj){
     var tempurl=top.frames[5].location+"?";
	 oldurl=corpurl.substring(0,corpurl.indexOf("?"));
	 corpurl=oldurl+"?";
     for(i=0;i<form_obj.elements.length;i++){
	     corpurl+=form_obj.elements(i).name+"="+form_obj.elements(i).value+"&";
     }
}



