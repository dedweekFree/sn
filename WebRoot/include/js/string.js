// 版本:1.0  2004-01-03 
// endsWith 判断字符串是否以c结尾
// startsWith 判断字符串是否以c开头
// onlyCN 判断字符串是否仅含有字母和数字
// isLeapYear 判断是否为闰年
// trim、Ltrim、Rtrim 去除字符串的空格
// haveChar 判断是否包含有指定字符
// getdate 得到当前日期()
// toFloat 浮点数四舍五入函数
// ISNULL 如果字符串为空，返回指定的值
// isPostCode 判断字符串是否是邮政编码
// isIdcard 判断字符串是否是身份证
// write 输出到页面
// toMultiText 转换为html文本
// toRealText  转换为实际文本
// left  取左边字符
// right  取右边字符
// replaceAll
///////////////////////////////////////  

//功能说明：判断字符串是否以c结尾
//返回对象：正确，返回true ,否则返回 false
String.prototype.endsWith=function(c){
   return (c==this.charAt(this.length-1))
}


//判断字符串是否以c开头
//返回对象：正确，返回true ,否则返回 false
String.prototype.startsWith=function(c){
   return (c==this.charAt(0))
}

//判断字符串是否以c开头
//返回对象：正确，返回true ,否则返回 false
String.prototype.beginsWith=function(c){
   return (c==this.charAt(0))
}

//功能说明：判断字符串的真实长度
//返回对象：字符串长度
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

//功能说明：判断是否包含有指定字符
//参    数：指定字符	
//返回对象：正确，返回true ,否则返回 false
String.prototype.haveChar=function() 
{
       	for(var i=0;i<arguments.length;i++)
	{
          if(this.indexOf(arguments[i])>-1)
             return true;
	}   
        return false;
}

//功能说明：判断字符串是否仅含有字母和数字
//返回对象：正确，返回true ,否则返回 false
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


//判断是否为闰年
//返回对象：正确，返回true ,否则返回 false
String.prototype.isLeapYear=function()
{

	if (this%4==0)
	{	  
	  if((this%100==0)&&(this%400!=0)) 	//不是闰年
              return false;
	  else//闰年
	      return true;
	}
	else//不是闰年
	  return false;
}

//功能说明：去除字符串的空格
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

//功能说明：去除字符串左边的空格
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

//功能说明：去除字符串右边的空格
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

//功能说明：如果字符串为空，返回指定的值
String.prototype.ISNULL=function(value)
{
  if (this=="" || this=='undefined')
    return value;
  else
    return this;
}


//功能说明：浮点数四舍五入函数
//参数说明：num为小数点后保留位数
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

//功能说明：判断字符串是否是邮政编码
//返回对象：正确，返回true ,否则返回 false
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


//功能说明：判断字符串是否是身份证
//返回对象：正确，返回true ,否则返回 false
String.prototype.isIdCard=function()
{
  var idcard=this;
  if(idcard=="") return "验证通过!";
  var Errors=new Array(
					"验证通过!",
					"身份证号码位数不对!",
					"身份证号码出生日期超出范围或含有非法字符!",
					"身份证号码校验错误!",
					"身份证地区非法!"
					);
  var area={11:"北京",12:"天津",13:"河北",14:"山西",15:"内蒙古",21:"辽宁",22:"吉林",23:"黑龙江",31:"上海",32:"江苏",33:"浙江",34:"安徽",35:"福建",36:"江西",37:"山东",41:"河南",42:"湖北",43:"湖南",44:"广东",45:"广西",46:"海南",50:"重庆",51:"四川",52:"贵州",53:"云南",54:"西藏",61:"陕西",62:"甘肃",63:"青海",64:"宁夏",65:"新疆",71:"台湾",81:"香港",82:"澳门",91:"国外"}
					
  var idcard,Y,JYM;
  var S,M;
  var idcard_array = new Array();
  idcard_array     = idcard.split("");

  //地区检验
  if(area[parseInt(idcard.substr(0,2))]==null) return Errors[4];

  //身份号码位数及格式检验
  switch(idcard.length){
  case 15:
	if ( (parseInt(idcard.substr(6,2))+1900) % 4 == 0 || ((parseInt(idcard.substr(6,2))+1900) % 100 == 0 && (parseInt(idcard.substr(6,2))+1900) % 4 == 0 )){
		ereg=/^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}$/;//测试出生日期的合法性
	} else {
		ereg=/^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}$/;//测试出生日期的合法性
	}

	if(ereg.test(idcard)) return Errors[0];
	else return Errors[2];
	break;
  case 18:
	//18位身份号码检测
	//出生日期的合法性检查 
	//闰年月日:((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))
	//平年月日:((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))
	if ( parseInt(idcard.substr(6,4)) % 4 == 0 || (parseInt(idcard.substr(6,4)) % 100 == 0 && parseInt(idcard.substr(6,4))%4 == 0 )){
		ereg=/^[1-9][0-9]{5}19[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}[0-9Xx]$/;//闰年出生日期的合法性正则表达式
	} else {
		ereg=/^[1-9][0-9]{5}19[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}[0-9Xx]$/;//平年出生日期的合法性正则表达式
	}
	if(ereg.test(idcard)){//测试出生日期的合法性
		//计算校验位
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
		M    = JYM.substr(Y,1);//判断校验位
		if(M == idcard_array[17]) return  Errors[0];		//检测ID的校验位
		else return  Errors[3];
	}
	else return Errors[2];
	break;
  default:
	return  Errors[1];
	break;
 }
}

//功能说明：判断字符串是否是日期
//返回对象：正确，返回true ,否则返回 false
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

//功能说明：得到当前日期
//参    数：	                       
//返回对象：返回字符串
///////////////////////////////////////////////////
function getdate()
{
  var nowyear=(new Date()).getYear();
  var nowmonth=(new Date()).getMonth()+1;
  var nowday=(new Date()).getDate();
  
   return nowyear + "-" + nowmonth +"-"+ nowday
 }

//功能说明：转换为格式文本
//返回对象：格式文本
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

//功能说明：转换为实际内容
//返回对象：
String.prototype.toRealText=function(condText,newTextTrue,newTextFalse){
  if (this==condText)
    return newTextTrue;
  else
    return newTextFalse;
}

String.prototype.write=function(){
	document.write(this);
}

//功能说明：取字符串左边字符
String.prototype.left=function(k)
{
	if (this.length<k)
	  return this;
	else
	  return this.substring(0,k);
}

//功能说明：取字符串右边字符
String.prototype.right=function(k)
{
	if (this.length<k)
	  return this;
	else
	  return this.substring(this.length-k,this.length);
}

//功能说明：全部替换
String.prototype.replaceAll=function(oldStr,reStr)
{
	return this.split(oldStr).join(reStr); 
}
