//����˵����ƴ���ַ���
//��    ������һ��Ϊ������	                       
//���ض�����
///////////////////////////////////////////////////
function memoURL(form_obj){
     var tempurl=top.frames[5].location+"?";
	 oldurl=corpurl.substring(0,corpurl.indexOf("?"));
	 corpurl=oldurl+"?";
     for(i=0;i<form_obj.elements.length;i++){
	     corpurl+=form_obj.elements(i).name+"="+form_obj.elements(i).value+"&";
     }
}



