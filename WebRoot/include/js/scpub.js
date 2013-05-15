//中文汉字的判断，如果字符串包含汉字返回1，否则返回0
function checkChinese(str)
{
   var strTemp=str;
   var retValue=0;

   for (i=0;i<strTemp.length;i++){
	   if(strTemp.charAt(i)>'　'){
	      retValue=1;
	      break;
	   } 
	}   	
	return retValue;
}
//非法字符检查,空串时返回-1,非法时返回[2,35]之间的整数,合法时返回1;
function CheckValidStr(strVariable)
{
  var illstr=new Array(':',';','~','`','!','@','#','$','&','*','(',')','+','=','|','^','%','{','}','[',']',':','<','>',',','.','?','/','\\','"',"'");
  var m;
  var k;
  var n=1;
   
  len=strVariable.length;
  len1=illstr.length;
  if (strVariable=="")  n=-1;
  if (len!=0) {  
    for (i=0;i<len;i++) {
       m=strVariable.charAt(i);
       for (j=0;j<len1;j++) {  
          if(m==illstr[j]) {
             k=j+2; 
             n=k ; 
             break;
          } else {
             k=1;
          } 
       }//endforj
    }//endfori
  }//endif     
     
  return n;     
}

//下面函数用于判断日期型函数，输入格式YYYY-MM-DD
function NKChkChar(strVariable)
{   
    k=0;
    k1=0;
    s1="";
    var s=new Array(0,0,0);
    length1=strVariable.length;  
    
    for(i=0;i<length1;i++)
    {
        a=strVariable.charAt(i);
        if(a=="-")
            {
                 n=i+1;
                 k=n;
                 break;  
             }
    }
    
    for(i=0;i<length1;i++)
    {
        a=strVariable.charAt(i);
        if(a=="-")
            {
                 j=i+1;
                 k1=j; 
                 s1=s1+a;               
             }
    }
        
     s[2]=s1.length;
     s[0]=k;
     s[1]=k1;
     
     return s;
} 

function DateString(DateString) 
{
  var str=new Array(0,0,0);
  var k; 
  leng=DateString.length;  
  str=NKChkChar(DateString);
    
  m=str[0];
  n=str[1];
  len=str[2];

  yy=DateString.substring(0,m-1);  
  mm=DateString.substring(m,n-1);
  dd=DateString.substring(n,10);

  l1=yy.length;
  l2=mm.length;
  l3=dd.length;
  
  y=parseInt(yy);
  m=parseInt(mm);
  d=parseInt(dd);
 
  r=yy-y;
  s=mm-m;
  t=dd-d;
  
//输入长度越界时;  
  if (leng>10)  k="输入日期长度越界！";
  
//输入串输入多个"-"时;
  else if ((DateString!="") && (len!=2))    k="请输入日期形式为：YYYY-MM-DD！";
  
//输入年月日的位数越界时;
  else if ((DateString!="") && (l1 != 4 || l2<0 || l2>2 || l3<0 || l3>2))  k="请检查年-月-日的位数（YYYY-MM-DD）！";
  
//年月日为非数据时;  
  else if ((DateString!="") && (isNaN(yy) || isNaN(mm) || isNaN(dd)))  k="请输入整形数据！";
  
//判断年月日范围 
  else if ((DateString!="") && (yy<=0))    k="年的计数应大于0！";
  
  else if ((DateString!="") && (mm < 1 || mm > 12))      k="月范围为 [1,12]！";
  
  else if ((DateString!="") && (dd < 1 || dd > 31))      k="日的范围[1，31]！";
  
  else if ((DateString!="") && (mm=="04" || mm=="06" || mm=="09" || mm=="11"||mm=="4" ||mm=="6" || mm=="9" || mm=="11") && (dd>30 || dd<1))  k="日的范围 [0,30]！";
  
  else if ((DateString!="") && (mm=="01" || mm=="03" || mm=="05" || mm=="07"||mm=="08" ||mm=="10" || mm=="12" || mm=="1"|| mm=="3"|| mm=="5"|| mm=="7"|| mm=="8") && (dd>31 || dd<1))  k="日的范围 [0,31]！";
  
  else if ((DateString!="") && (mm=="02" && parseInt(dd)>28  && (isLeapYear(yy)==0)|| mm=="2") && parseInt(dd)>28  && (isLeapYear(yy)==0))    k="日的范围 [0,28]！";
    
  else if ((DateString!="") && (mm=="02" && parseInt(dd)>29 && (isLeapYear(yy)==1) || mm=="2") && parseInt(dd)>29 && (isLeapYear(yy)==1))  k="日的范围 [0,29]！";
    
  else k=1;
  
  return k;
}

function isLeapYear (Year) 
  {

    if (((Year % 4)==0) && ((Year % 100)!=0) || ((Year % 400)==0))

        return (1);

    else

        return (0);

  }
  
//检查输入的年是否合法
function checkYear(stryear)
{ 
	var str=stryear;
	var k;
	
   if(isNaN(str)){
   	k="年应为整型数据！";
   } else if(str.length!=4||str.indexOf("+")==0){
   	k="年应是四位整数！";
   } else if(str<=0){
   	k="年的计数应大于0！";
   } else {
   	k=1;
   }
   
   return k;	
}
//该函数检查开始日期是否小于结束日期，小于返回1，大于返回0
function Date1VsDate2 (date1str,date2str) 
  {
	date1_len=date1str.length;    
	yy=""; 
	mm=""; 
	dd=""; 
	flag="0";
   	if (date1_len!=0)
    	{
      		for(i=0;i<date1_len;i++)
       		{       	
          	a=date1str.charAt(i);         
          	if(i<4)
               		{yy=yy+a;}                 			  		
 	  	else if (flag=="0" && a!='-')
               		{mm=mm+a;}                 		
       		else if (flag=="0" && a=='-'&&i>4) 
       			{flag="1";}
       			
       		else if (flag=="1") 
       			{dd=dd+a;} 
      		}
    	}   	
  	if (mm.length==1) {mm="0"+mm;}
  	if (dd.length==1) {dd="0"+dd;}
  	date_str1=yy+mm+dd;
  	//alert(date_str1);
 
 	date2_len=date2str.length;    
	yy=""; 
	mm=""; 
	dd=""; 
	flag="0";
   	if (date2_len!=0)
    	{
      		for(i=0;i<date2_len;i++)
       		{       	
          	a=date2str.charAt(i);         
          	if(i<4)
               		{yy=yy+a;}                 			  		
 	  	else if (flag=="0" && a!='-')
               		{mm=mm+a;}                 		
       		else if (flag=="0" && a=='-'&&i>4) 
       			{flag="1";}
       			
       		else if (flag=="1") 
       			{dd=dd+a;} 
      		}
    	}   	
  	if (mm.length==1) {mm="0"+mm;}
  	if (dd.length==1) {dd="0"+dd;}
  	date_str2=yy+mm+dd;
  	//alert(date_str2);
  
 	if (parseInt( date_str1)>parseInt( date_str2))
   	return (0);
   	else return (1); 

}

//获得当前系统日期
function getcurDate()
{
        	var now = new Date();
		var s="";
		s += now.getYear() + "-"; 
		if ((now.getMonth()+1)<10)
		{
			s+="0"+(now.getMonth()+ 1) + "-";
		}else{
		s += (now.getMonth()+ 1) + "-";
		}
		if (now.getDate()<10){
			s += "0"+(now.getDate());
		}else{
			s += now.getDate();
		}
		return(s);	
}    
//函数判断时间型的数据，录入格式hh:mm，成功返回1，错误返回错误信息
function isTimetype(timestr) {
		
	retflag="";		
	hh="";
	hnum=0;
	mnum=0;
	mm="";
	isNum="1";    //除:外其他字符全为数字型
	mediflag=0;   //记录:的个数
	for (i=0;i<timestr.length;i++) {
		 a=timestr.charAt(i);
		 if (a!=":"&& isNaN(a) ) 
		 	{isNum="0";break;}
		 if (a==":") { mediflag=mediflag+1;continue;}
		 else if ( mediflag==0) 
		 	{ hh=hh+a;hnum=hnum+1; continue;}
		 else if ( mediflag==1) 
		 	{mm=mm+a;mnum=mnum+1;}					 
	}
	
	if ( timestr.length<3 || isNum=="0" || mediflag!=1  || hh.length>2 ||hnum>2 ||mm.length>2 ||mnum>2) 
		{ retflag="输入时间为数字 ！";  }
   	else if (parseInt(hh)>23) 
   		{ retflag="输入的小时数超过24！";  }
   	else if (parseInt(mm)>59) 	
   		{ retflag="输入的分钟数超过60！";  }   	
   	
   	else {	retflag="1";}   	
   	return (retflag);

}
/**
 * Author      : jiangby
 * Function    : changeToTimeType
 * Description : 把两个时间输入域，转换成时间类型
 * Return      : string
 * Parameters  ：
 *    1。strHour  : 输入的小时 
 *    2。strMinute：输入的分钟
 */

function changeToTimeType(strHour,strMinute)
{
  
  if((strHour==null||strHour==""||strHour==" "||strHour=="  ")&&(strMinute==null||strMinute==""||strMinute==" "||strMinute=="  ")) 	
  return ("");
  if(strHour!=null&&strHour.length==1)
  {strHour="0"+strHour;}
  if(strMinute!=null&&strMinute.length==1)
  strMinute="0"+strMinute;
  if(strHour==null||strHour==""||strHour==" "||strHour=="  ")
  return ("00:"+strMinute);
  if(strMinute==null||strMinute==""||strMinute==" "||strMinute=="  ")
  return (strHour+":00");
  
  return (strHour+":"+strMinute);
}/**
 × Author      : jiangby
 * Function    : compareTime
 * Description : 比较两个时间
 * Return      : 小于返回-1,相等返回0，大于返回1
 * Parameters  ：
 *    1。strTime1  : 
 *    2。strTime2  ：
 */

function compileTo(strTime1,strTime2)
{  
   iPosition1=strTime1.indexOf(':');
   iPosition2=strTime2.indexOf(':');
   strTemp1=strTime1;
   strTemp2=strTime2;
   strHour1=strTemp1.substring(0,iPosition1);
   strHour2=strTemp2.substring(0,iPosition2);   
   strTemp1=strTime1;
   strTemp2=strTime2;   
   strMinute1=strTemp1.substring(iPosition1+1);
   strMinute2=strTemp2.substring(iPosition2+1);            
   
   if(strHour1>strHour2)
   
     return 1;
     
   else if(strHour1<strHour2)
   
          return -1;
          
        else 
          { 
            if(strMinute1>strMinute2)
            
              return 1;
              
            else if(strMinute1<strMinute2)
            
                  return -1;
                  
                 else return 0;                                  	   
           }
}             

//该函数用于数字型校验，返回值：非数字型返回0，整型返回1，浮点型返回2
function testNum(strNum)
{
   if(strNum.indexOf("+")==0){
   	return (0);
   	}
   if (isNaN(strNum)) {
		return (0);	
	}	
	else 
	{
		isInt=true;
		for (i=0;i<strNum.length;i++)			 
	  	{
	  		a=strNum.charAt(i)
	  		if(a==".")
        		{
        			isInt=false;
        			break;
        		}
        	}
        	if (isInt==true) return (1);
        	else return (2);
	}
}
//判断字符串是否由数字和字母组成
function jdgStr(tmpStr)
	{
		for(var i=0;i<tmpStr.length;i++)
		{
			var ch=tmpStr.substring(i,i+1);
			if (((ch>="0")&&(ch<="9"))||((ch>="a")&&(ch<="z"))||((ch>="A")&&(ch<="Z")))
			{
				
			}else{
				return false;
			}
			     
		}	
		return true;
	}

//判断字符串是否仅由数字或字母组成
function testLetter(tmpStr) {
	var ch =tmpStr.substring(0,1);
	var jdg0 = -1;
	var jdg1 = -1;
	if ((ch>="0")&&(ch<="9")) jdg0 = 0;
	else if ((ch>="a")&&(ch<="z")) jdg0 = 1;
	else if ((ch>="A")&&(ch<="Z")) jdg0 = 2;
	else if (ch=="-") jdg0 = 3;
	else if (ch=="_") jdg0 = 4;
	
	for(var i=1;i<tmpStr.length;i++) {
		ch = tmpStr.substring(i,i+1);
		if ((ch>="0")&&(ch<="9")) jdg1 = 0;
		else if ((ch>="a")&&(ch<="z")) jdg1 = 1;
		else if ((ch>="A")&&(ch<="Z")) jdg1 = 2;
		else if (ch=="-") jdg1 = 3;
		else if (ch=="_") jdg1 = 4;
		else jdg1 = -1;
		
		if (jdg0==jdg1) {
		}else{
			return false;
		}
	}	
	return true;
}

//函数返回字符串的长度
function StrLenght(str1){
	
	strTALen=new String(str1);
	return(strTALen.length);
}       
function strIsNull(str1){

var strTemp1,strTemp2

	strTemp1=new String(str1);
	
	if ((strTemp1=="")||(strTemp1==null))
	{	return true;
	}
		
	strTemp2=new String();
	for (t=0;t<strTemp1.length;t++){
		strTemp2=strTemp2 + " ";
	}
	if (strTemp1==strTemp2 )
		return true;
	else
		return false;
}
//电话号码的输入正确性判断
function judgeTel(tmpStr)
{
  	if(tmpStr.indexOf('-')==0) {
 		return false;
   } else if(tmpStr.lastIndexOf('-')==tmpStr.length-1) {
 		return false;
   }
   for (var i = 0;i < tmpStr.length;i++)
   {
     var ch = tmpStr.substring(i,i+1);
     if ((ch >= "0"&&ch<="9")||ch=="-"||ch==" "||ch=="("||ch==")") {
  
     } else {
        return false;
     }
   }
} 
//按yyyy-mm-dd格式化日期
function formatDate(dateStr)
{
	var split;
	var tmpSplit=0;
	var splitcount=0;
	var tmpArray=new Array();
	
	for(var i=0;i<dateStr.length;i++) 
	{
		var ch = dateStr.substring(i, i + 1);
		if (ch < "0" || "9" < ch)
		{
			splitcount++;
			tmpArray[splitcount-1]=dateStr.substring(tmpSplit,i);
			tmpSplit=i+1;
		}
		
	}
	tmpArray[2]=dateStr.substring(tmpSplit,dateStr.length);
	
	if(tmpArray[0].length==2){
		tmpArray[0]="20" + tmpArray[0]; 		
	}
   if(tmpArray[1].length==1){
	   tmpArray[1]="0"+tmpArray[1];
	}
	if(tmpArray[2].length==1){
		tmpArray[2]="0"+tmpArray[2];
	}
	return(tmpArray[0]+"-"+tmpArray[1]+"-"+tmpArray[2]);

}
//检查email地址的格式是否正确
function mailaddrChk(mailStr)
{
    
    if (mailStr.indexOf("@")<=0) {
	alert("请输入正确的Email地址！");      	
      	return("fail");
    } else if (mailStr.lastIndexOf("@")==(mailStr.length-1)) {
	alert("请输入正确的Email地址！");      	
      	return("fail");
    } else if (mailStr.indexOf(".")<=0) {
	alert("请输入正确的Email地址！");      	
      	return("fail");
    } else if (mailStr.lastIndexOf(".")==(mailStr.length-1)) {
	alert("请输入正确的Email地址！");      	
      	return("fail");
    } else if(checkChinese(mailStr)==1){
   alert("email地址不能包含中文！"); 
    	   return("fail");
    } else {
        return("succeed");
    }    
} 

 function floatButton(id, text, action, imageOff, imageOver, 
	width, height, title, bgColor, fontFamily, fontSize, fontColor)
{
    this.id			= id;			//用于给这个button指定唯一ID，必须和实例名一致
    this.text		= text;			//button上的文字
    this.action		= action;		//点击button后触发的动作，可为空
    this.imageOff	= imageOff;		//平时button的图标，可为空
    this.imageOver	= imageOver;	//鼠标移到button上的图标，可为空
    this.width		= width;		//button长，格式推荐为12px
    this.height		= height;		//button
    this.title		= title;		//tooltip
    this.bgColor	= bgColor;		//button背景色，缺省为透明
    this.fontFamily	= fontFamily;	//button字体
    this.fontSize	= fontSize;		//button字体大小，格式推荐为12px
    this.fontColor	= fontColor;	//button字体颜色
    //定义对象的方法
    this.show		= showButton;
    this.over		= overButton;	
    this.off		= offButton;
    this.down		= downButton;
    this.up			= upButton;
    this.fire		= fireAction;
}

function showButton(){
	var strHTML = '';
	strHTML += '<span id="'+ this.id + '" class="ButtonNormal" ';
	strHTML += 'onmouseover="' + this.id + '.over()" onmouseout="' + this.id + '.off()" ';
	strHTML += 'onmouseup="' + this.id + '.up()" onmousedown="' + this.id + '.down()" ';
 	if (this.title != null)
		strHTML += ' title="' + this.title + '"';
 	if (this.action != null)
		strHTML += ' onclick="' + this.id + '.fire()"';
	strHTML += ' style="LINE-HEIGHT: 16px;';
	if (this.width != null)
		strHTML += 'width:' + this.width + ';';
	if (this.height != null)
		strHTML += 'height:' + this.height + ';';
	if (this.bgColor != null)
		strHTML += 'background-color:' + this.bgColor + ';';
	if (this.fontFamily != null)
		strHTML += 'font-family:' + this.fontFamily + ';';
	if (this.fontSize != null)
		strHTML += 'font-size:' + this.fontSize + ';';
	if (this.fontColor != null)
		strHTML += 'color:' + this.fontColor + ';';
	strHTML += '"><center>';
	if (this.imageOff != null)
		strHTML += '<img id="' + this.id + '_image" src="' + this.imageOff + '" style="vertical-align:middle"> ';
	strHTML += this.text;
	strHTML += '</center></span>';
	//alert(strHTML);
	document.write(strHTML);
}

function fireAction(){
	eval(this.action);
}

function overButton(){
	if (typeof(document.all(this.id)) == "object")
		document.all(this.id).className = "ButtonUp";
	if (this.imageOver != null)
		if (typeof(document.all(this.id + "_image")) == "object")
			document.all(this.id + "_image").src = this.imageOver;
}

function offButton(){
	if (typeof(document.all(this.id)) == "object")
		document.all(this.id).className = "ButtonNormal";
	if (this.imageOff != null)
		if (typeof(document.all(this.id + "_image")) == "object")
			document.all(this.id + "_image").src = this.imageOff;
}

function downButton(){
	if (typeof(document.all(this.id)) == "object")
		document.all(this.id).className = "ButtonDown";
}

function upButton(){
	if (typeof(document.all(this.id)) == "object")
		document.all(this.id).className = "ButtonUp";
}
   
   
   //该函数检查开始日期是否等于结束日期，小于返回1，大于返回0，等于返回2
function Date1EqualDate2 (date1str,date2str) 
  {
	date1_len=date1str.length;    
	yy=""; 
	mm=""; 
	dd=""; 
	flag="0";
   	if (date1_len!=0)
    	{
      		for(i=0;i<date1_len;i++)
       		{       	
          	a=date1str.charAt(i);         
          	if(i<4)
               		{yy=yy+a;}                 			  		
 	  	else if (flag=="0" && a!='-')
               		{mm=mm+a;}                 		
       		else if (flag=="0" && a=='-'&&i>4) 
       			{flag="1";}
       			
       		else if (flag=="1") 
       			{dd=dd+a;} 
      		}
    	}   	
  	if (mm.length==1) {mm="0"+mm;}
  	if (dd.length==1) {dd="0"+dd;}
  	date_str1=yy+mm+dd;
  	//alert(date_str1);
 
 	date2_len=date2str.length;    
	yy=""; 
	mm=""; 
	dd=""; 
	flag="0";
   	if (date2_len!=0)
    	{
      		for(i=0;i<date2_len;i++)
       		{       	
          	a=date2str.charAt(i);         
          	if(i<4)
               		{yy=yy+a;}                 			  		
 	  	else if (flag=="0" && a!='-')
               		{mm=mm+a;}                 		
       		else if (flag=="0" && a=='-'&&i>4) 
       			{flag="1";}
       			
       		else if (flag=="1") 
       			{dd=dd+a;} 
      		}
    	}   	
  	if (mm.length==1) {mm="0"+mm;}
  	if (dd.length==1) {dd="0"+dd;}
  	date_str2=yy+mm+dd;
  	//alert(date_str2);
  
 	if (parseInt( date_str1)>parseInt( date_str2))
   	   return (0);
   	else if (parseInt( date_str1)==parseInt( date_str2))
   	   return (2);
   	else return (1); 
}    
//重置按钮
function resetdefine(obj){
	
	obj.reset();   
}

//该方法用于检查年月日是分开写的情况 返回值为1年月日有空的情况或者年月日输入正确,否则日期输入有误 by lichj
function isYMD(strYear,strMonth,strDate)
{
	var retInfo = "1";
	if(strYear!=""&&strMonth!=""&&strDate!="")
	{
	  if(testNum(strYear)==1&&testNum(strMonth)==1&&testNum(strDate)==1)
	  {
		if(strYear.length!=4)
		  retInfo = "年要为四位整型数据！";
		else if(strYear<=0)
			retInfo = "年份要大于1！";
		else if(strMonth<1||strMonth>12)
		  retInfo = "月份范围是[1,12]！";
		else
		{
		  if(strMonth==1||strMonth==3||strMonth==5||strMonth==7||strMonth==8||strMonth==10||strMonth==12)
		  {
			if(strDate<1||strDate>31)
			  retInfo = "日期的范围是[1,31]！";
			else
			  retInfo = "1";
		  }
		  if(strMonth==4||strMonth==6||strMonth==9||strMonth==11)
		  {
			if(strDate<1||strDate>30)
			  retInfo = "日期的范围是[1,30]！";
			else
			  retInfo = "1";
		  }
		  if(strMonth==2)
		  {
			if(isLeapYear(strYear)==1&&(strDate<1||strDate>29))
			  retInfo = "日期的范围是[1,29]！";
			else if(strDate>0&&strDate<30)
				retInfo = "1";
			if(isLeapYear(strYear)==0&&(strDate<1||strDate>28))
			  retInfo = "日期的范围是[1,28]！";
			else if(strDate>0&&strDate<29)
				retInfo = "1";
		  }
		}
	  }
	  else
		retInfo = "年份，月份和日期要为数字类型！";
	}
	return retInfo;
}