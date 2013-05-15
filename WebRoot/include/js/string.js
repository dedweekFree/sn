// �汾:1.0  2004-01-03 
// endsWith �ж��ַ����Ƿ���c��β
// startsWith �ж��ַ����Ƿ���c��ͷ
// onlyCN �ж��ַ����Ƿ��������ĸ������
// isLeapYear �ж��Ƿ�Ϊ����
// trim��Ltrim��Rtrim ȥ���ַ����Ŀո�
// haveChar �ж��Ƿ������ָ���ַ�
// getdate �õ���ǰ����()
// toFloat �������������뺯��
// ISNULL ����ַ���Ϊ�գ�����ָ����ֵ
// isPostCode �ж��ַ����Ƿ�����������
// isIdcard �ж��ַ����Ƿ������֤
// write �����ҳ��
// toMultiText ת��Ϊhtml�ı�
// toRealText  ת��Ϊʵ���ı�
// left  ȡ����ַ�
// right  ȡ�ұ��ַ�
// replaceAll
///////////////////////////////////////  

//����˵�����ж��ַ����Ƿ���c��β
//���ض�����ȷ������true ,���򷵻� false
String.prototype.endsWith=function(c){
   return (c==this.charAt(this.length-1))
}


//�ж��ַ����Ƿ���c��ͷ
//���ض�����ȷ������true ,���򷵻� false
String.prototype.startsWith=function(c){
   return (c==this.charAt(0))
}

//�ж��ַ����Ƿ���c��ͷ
//���ض�����ȷ������true ,���򷵻� false
String.prototype.beginsWith=function(c){
   return (c==this.charAt(0))
}

//����˵�����ж��ַ�������ʵ����
//���ض����ַ�������
String.prototype.len=function()
{
  var lens;
  var i;
  lens = 0;
  for (i=0;i<this.length;i++)
  {
    if (this.charCodeAt(i)>255) lens+=2; else lens++;
  }
  return lens;
}

//����˵�����ж��Ƿ������ָ���ַ�
//��    ����ָ���ַ�	
//���ض�����ȷ������true ,���򷵻� false
String.prototype.haveChar=function() 
{
       	for(var i=0;i<arguments.length;i++)
	{
          if(this.indexOf(arguments[i])>-1)
             return true;
	}   
        return false;
}

//����˵�����ж��ַ����Ƿ��������ĸ������
//���ض�����ȷ������true ,���򷵻� false
String.prototype.onlyCN=function()
{
  var i;
  var tems;
  
  for(i=0;i<this.length;i++)
   {
		tems=this.charAt(i);   
		if((tems >='0' && tems<='9' )|| (tems >= 'A' && tems <='Z') ||(tems >= 'a' && tems <='z'))
		 continue; 
		else
		 return false;
   }
    return true;
}


//�ж��Ƿ�Ϊ����
//���ض�����ȷ������true ,���򷵻� false
String.prototype.isLeapYear=function()
{

	if (this%4==0)
	{	  
	  if((this%100==0)&&(this%400!=0)) 	//��������
              return false;
	  else//����
	      return true;
	}
	else//��������
	  return false;
}

//����˵����ȥ���ַ����Ŀո�
String.prototype.trim=function()
{
	var tempadd="";
	var i;

	tempstr=this;
	if (this.length<1)
	  return this;
	for(i=0;i<this.length;i++)
	{
	  if(this.charAt(i)!=' ')
	   tempadd+=this.charAt(i);	
        }
	return tempadd;
      
}

//����˵����ȥ���ַ�����ߵĿո�
String.prototype.Ltrim=function()
{
       	var tempstr="";
	var tempadd="";
	var i;
        tempstr=this;
	if (this.length<1)
 	  return this;
	while((tempstr.length>0) && (tempstr.charAt(0)==' '))
	  tempstr = tempstr.substring(1,tempstr.length);
	return tempstr;
}

//����˵����ȥ���ַ����ұߵĿո�
String.prototype.Rtrim=function()
{
	var tempstr="";
	var tempadd="";
	var temp;
	var i;

	tempstr=this;
	if (tempstr.length<1)
	  return tempstr;
	while((tempstr.length>0) && (tempstr.charAt(tempstr.length-1)==' '))
	  tempstr = tempstr.substring(0,tempstr.length-1);
	return tempstr;
}

//����˵��������ַ���Ϊ�գ�����ָ����ֵ
String.prototype.ISNULL=function(value)
{
  if (this=="" || this=='undefined')
    return value;
  else
    return this;
}


//����˵�����������������뺯��
//����˵����numΪС�������λ��
String.prototype.toFloat=function(num)
{
  if (this=="" || this=='undefined')
    return "";
  var tail="0."
  var fNum=0;
  for(var i=0;i<num;i++)
  {
    tail+="0";
  }
  tail+="5";
  if(parseFloat(this)>=0)
    fNum=parseFloat(this)+parseFloat(tail);
  else
    fNum=parseFloat(this)-parseFloat(tail);
  var len=fNum.toString().indexOf(".")+parseInt(num)+1;
  var newNum=fNum.toString().substring(0,len);
  return parseFloat(newNum); 
}

//����˵�����ж��ַ����Ƿ�����������
//���ض�����ȷ������true ,���򷵻� false
String.prototype.isPostCode=function()
{
  var i;
  var tems;
  if(this.length>6 && this.length>0)
    return false;
  for(i=0;i<this.length;i++)
   {
		tems=this.charAt(i);   
		if((tems >='0' && tems<='9' ))
		 continue; 
		else
		 return false;
   }
    return true;
}


//����˵�����ж��ַ����Ƿ������֤
//���ض�����ȷ������true ,���򷵻� false
String.prototype.isIdCard=function()
{
  var idcard=this;
  if(idcard=="") return "��֤ͨ��!";
  var Errors=new Array(
					"��֤ͨ��!",
					"���֤����λ������!",
					"���֤����������ڳ�����Χ���зǷ��ַ�!",
					"���֤����У�����!",
					"���֤�����Ƿ�!"
					);
  var area={11:"����",12:"���",13:"�ӱ�",14:"ɽ��",15:"���ɹ�",21:"����",22:"����",23:"������",31:"�Ϻ�",32:"����",33:"�㽭",34:"����",35:"����",36:"����",37:"ɽ��",41:"����",42:"����",43:"����",44:"�㶫",45:"����",46:"����",50:"����",51:"�Ĵ�",52:"����",53:"����",54:"����",61:"����",62:"����",63:"�ຣ",64:"����",65:"�½�",71:"̨��",81:"���",82:"����",91:"����"}
					
  var idcard,Y,JYM;
  var S,M;
  var idcard_array = new Array();
  idcard_array     = idcard.split("");

  //��������
  if(area[parseInt(idcard.substr(0,2))]==null) return Errors[4];

  //��ݺ���λ������ʽ����
  switch(idcard.length){
  case 15:
	if ( (parseInt(idcard.substr(6,2))+1900) % 4 == 0 || ((parseInt(idcard.substr(6,2))+1900) % 100 == 0 && (parseInt(idcard.substr(6,2))+1900) % 4 == 0 )){
		ereg=/^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}$/;//���Գ������ڵĺϷ���
	} else {
		ereg=/^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}$/;//���Գ������ڵĺϷ���
	}

	if(ereg.test(idcard)) return Errors[0];
	else return Errors[2];
	break;
  case 18:
	//18λ��ݺ�����
	//�������ڵĺϷ��Լ�� 
	//��������:((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))
	//ƽ������:((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))
	if ( parseInt(idcard.substr(6,4)) % 4 == 0 || (parseInt(idcard.substr(6,4)) % 100 == 0 && parseInt(idcard.substr(6,4))%4 == 0 )){
		ereg=/^[1-9][0-9]{5}19[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}[0-9Xx]$/;//����������ڵĺϷ���������ʽ
	} else {
		ereg=/^[1-9][0-9]{5}19[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}[0-9Xx]$/;//ƽ��������ڵĺϷ���������ʽ
	}
	if(ereg.test(idcard)){//���Գ������ڵĺϷ���
		//����У��λ
		S  =  (parseInt(idcard_array[0]) + parseInt(idcard_array[10])) * 7
			+ (parseInt(idcard_array[1]) + parseInt(idcard_array[11])) * 9
			+ (parseInt(idcard_array[2]) + parseInt(idcard_array[12])) * 10
			+ (parseInt(idcard_array[3]) + parseInt(idcard_array[13])) * 5
			+ (parseInt(idcard_array[4]) + parseInt(idcard_array[14])) * 8
			+ (parseInt(idcard_array[5]) + parseInt(idcard_array[15])) * 4
			+ (parseInt(idcard_array[6]) + parseInt(idcard_array[16])) * 2
			+  parseInt(idcard_array[7]) * 1 
			+  parseInt(idcard_array[8]) * 6
			+  parseInt(idcard_array[9]) * 3 ;
		Y    = S % 11;
		M    = "F";
		JYM  = "10X98765432";
		M    = JYM.substr(Y,1);//�ж�У��λ
		if(M == idcard_array[17]) return  Errors[0];		//���ID��У��λ
		else return  Errors[3];
	}
	else return Errors[2];
	break;
  default:
	return  Errors[1];
	break;
 }
}

//����˵�����ж��ַ����Ƿ�������
//���ض�����ȷ������true ,���򷵻� false
String.prototype.isDate=function(){
  if(this=="") return true;
if(parseInt(this)>10000000) return this.isDate2();
var reg = /^(\d{1,4})(-|\/)(\d{1,2})\2(\d{1,2})$/; 
var r = this.match(reg); 
if(r==null)return false; 
if(r[3].substring(0,1)=='0') r[3]=r[3].substring(1,2);
if(r[4].substring(0,1)=='0') r[4]=r[4].substring(1,2);
var d= new Date(r[1], parseInt(r[3])-1,r[4]); 
var oldStr=r[1]+r[2]+r[3]+r[2]+r[4];
var newStr=d.getFullYear()+r[2]+(d.getMonth()+1)+r[2]+d.getDate()
return newStr==oldStr
}

String.prototype.isDate2=function(){
  if(this.length!=8) return false;
  var yy=this.substring(0,4);
  var mm=this.substring(4,6);
  var dd=this.substring(6,this.length);
  if(mm.substring(0,1)=='0') mm=mm.substring(1,2);
  if(dd.substring(0,1)=='0') dd=dd.substring(1,2);
  var d= new Date(yy, mm-1,dd); 
  var oldStr=yy+"-"+mm+"-"+dd;
  var newStr=d.getFullYear()+"-"+(d.getMonth()+1)+"-"+d.getDate()
  return newStr==oldStr
}

//����˵�����õ���ǰ����
//��    ����	                       
//���ض��󣺷����ַ���
///////////////////////////////////////////////////
function getdate()
{
  var nowyear=(new Date()).getYear();
  var nowmonth=(new Date()).getMonth()+1;
  var nowday=(new Date()).getDate();
  
   return nowyear + "-" + nowmonth +"-"+ nowday
 }

//����˵����ת��Ϊ��ʽ�ı�
//���ض��󣺸�ʽ�ı�
String.prototype.toMultiText=function(){
	var conversionContext = "&nbsp;&nbsp;&nbsp;&nbsp;";
	for (var k=0;k<this.length ;k++ )
	{
		if (this.substring(k,k+1)=="\n" || this.substring(k,k+1)=="\r")
		{
			if(this.substring(k,k+1)=="\r"){
				conversionContext+="<br>";
			}
		}
		else if(this.substring(k,k+1)==" "){
		  conversionContext+="<br>&nbsp;&nbsp;&nbsp;&nbsp;";
		}
		else
		{
			conversionContext+=this.substring(k,k+1);
		}
	}
	return conversionContext;
}

//����˵����ת��Ϊʵ������
//���ض���
String.prototype.toRealText=function(condText,newTextTrue,newTextFalse){
  if (this==condText)
    return newTextTrue;
  else
    return newTextFalse;
}

String.prototype.write=function(){
	document.write(this);
}

//����˵����ȡ�ַ�������ַ�
String.prototype.left=function(k)
{
	if (this.length<k)
	  return this;
	else
	  return this.substring(0,k);
}

//����˵����ȡ�ַ����ұ��ַ�
String.prototype.right=function(k)
{
	if (this.length<k)
	  return this;
	else
	  return this.substring(this.length-k,this.length);
}

//����˵����ȫ���滻
String.prototype.replaceAll=function(oldStr,reStr)
{
	return this.split(oldStr).join(reStr); 
}
