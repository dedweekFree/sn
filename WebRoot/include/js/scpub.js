//���ĺ��ֵ��жϣ�����ַ����������ַ���1�����򷵻�0
function checkChinese(str)
{
   var strTemp=str;
   var retValue=0;

   for (i=0;i<strTemp.length;i++){
	   if(strTemp.charAt(i)>'��'){
	      retValue=1;
	      break;
	   } 
	}   	
	return retValue;
}
//�Ƿ��ַ����,�մ�ʱ����-1,�Ƿ�ʱ����[2,35]֮�������,�Ϸ�ʱ����1;
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

//���溯�������ж������ͺ����������ʽYYYY-MM-DD
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
  
//���볤��Խ��ʱ;  
  if (leng>10)  k="�������ڳ���Խ�磡";
  
//���봮������"-"ʱ;
  else if ((DateString!="") && (len!=2))    k="������������ʽΪ��YYYY-MM-DD��";
  
//���������յ�λ��Խ��ʱ;
  else if ((DateString!="") && (l1 != 4 || l2<0 || l2>2 || l3<0 || l3>2))  k="������-��-�յ�λ����YYYY-MM-DD����";
  
//������Ϊ������ʱ;  
  else if ((DateString!="") && (isNaN(yy) || isNaN(mm) || isNaN(dd)))  k="�������������ݣ�";
  
//�ж������շ�Χ 
  else if ((DateString!="") && (yy<=0))    k="��ļ���Ӧ����0��";
  
  else if ((DateString!="") && (mm < 1 || mm > 12))      k="�·�ΧΪ [1,12]��";
  
  else if ((DateString!="") && (dd < 1 || dd > 31))      k="�յķ�Χ[1��31]��";
  
  else if ((DateString!="") && (mm=="04" || mm=="06" || mm=="09" || mm=="11"||mm=="4" ||mm=="6" || mm=="9" || mm=="11") && (dd>30 || dd<1))  k="�յķ�Χ [0,30]��";
  
  else if ((DateString!="") && (mm=="01" || mm=="03" || mm=="05" || mm=="07"||mm=="08" ||mm=="10" || mm=="12" || mm=="1"|| mm=="3"|| mm=="5"|| mm=="7"|| mm=="8") && (dd>31 || dd<1))  k="�յķ�Χ [0,31]��";
  
  else if ((DateString!="") && (mm=="02" && parseInt(dd)>28  && (isLeapYear(yy)==0)|| mm=="2") && parseInt(dd)>28  && (isLeapYear(yy)==0))    k="�յķ�Χ [0,28]��";
    
  else if ((DateString!="") && (mm=="02" && parseInt(dd)>29 && (isLeapYear(yy)==1) || mm=="2") && parseInt(dd)>29 && (isLeapYear(yy)==1))  k="�յķ�Χ [0,29]��";
    
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
  
//�����������Ƿ�Ϸ�
function checkYear(stryear)
{ 
	var str=stryear;
	var k;
	
   if(isNaN(str)){
   	k="��ӦΪ�������ݣ�";
   } else if(str.length!=4||str.indexOf("+")==0){
   	k="��Ӧ����λ������";
   } else if(str<=0){
   	k="��ļ���Ӧ����0��";
   } else {
   	k=1;
   }
   
   return k;	
}
//�ú�����鿪ʼ�����Ƿ�С�ڽ������ڣ�С�ڷ���1�����ڷ���0
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

//����õ�ǰϵͳ����
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
//�����ж�ʱ���͵����ݣ�¼���ʽhh:mm���ɹ�����1�����󷵻ش�����Ϣ
function isTimetype(timestr) {
		
	retflag="";		
	hh="";
	hnum=0;
	mnum=0;
	mm="";
	isNum="1";    //��:�������ַ�ȫΪ������
	mediflag=0;   //��¼:�ĸ���
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
		{ retflag="����ʱ��Ϊ���� ��";  }
   	else if (parseInt(hh)>23) 
   		{ retflag="�����Сʱ������24��";  }
   	else if (parseInt(mm)>59) 	
   		{ retflag="����ķ���������60��";  }   	
   	
   	else {	retflag="1";}   	
   	return (retflag);

}
/**
 * Author      : jiangby
 * Function    : changeToTimeType
 * Description : ������ʱ��������ת����ʱ������
 * Return      : string
 * Parameters  ��
 *    1��strHour  : �����Сʱ 
 *    2��strMinute������ķ���
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
 �� Author      : jiangby
 * Function    : compareTime
 * Description : �Ƚ�����ʱ��
 * Return      : С�ڷ���-1,��ȷ���0�����ڷ���1
 * Parameters  ��
 *    1��strTime1  : 
 *    2��strTime2  ��
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

//�ú�������������У�飬����ֵ���������ͷ���0�����ͷ���1�������ͷ���2
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
//�ж��ַ����Ƿ������ֺ���ĸ���
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

//�ж��ַ����Ƿ�������ֻ���ĸ���
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

//���������ַ����ĳ���
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
//�绰�����������ȷ���ж�
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
//��yyyy-mm-dd��ʽ������
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
//���email��ַ�ĸ�ʽ�Ƿ���ȷ
function mailaddrChk(mailStr)
{
    
    if (mailStr.indexOf("@")<=0) {
	alert("��������ȷ��Email��ַ��");      	
      	return("fail");
    } else if (mailStr.lastIndexOf("@")==(mailStr.length-1)) {
	alert("��������ȷ��Email��ַ��");      	
      	return("fail");
    } else if (mailStr.indexOf(".")<=0) {
	alert("��������ȷ��Email��ַ��");      	
      	return("fail");
    } else if (mailStr.lastIndexOf(".")==(mailStr.length-1)) {
	alert("��������ȷ��Email��ַ��");      	
      	return("fail");
    } else if(checkChinese(mailStr)==1){
   alert("email��ַ���ܰ������ģ�"); 
    	   return("fail");
    } else {
        return("succeed");
    }    
} 

 function floatButton(id, text, action, imageOff, imageOver, 
	width, height, title, bgColor, fontFamily, fontSize, fontColor)
{
    this.id			= id;			//���ڸ����buttonָ��ΨһID�������ʵ����һ��
    this.text		= text;			//button�ϵ�����
    this.action		= action;		//���button�󴥷��Ķ�������Ϊ��
    this.imageOff	= imageOff;		//ƽʱbutton��ͼ�꣬��Ϊ��
    this.imageOver	= imageOver;	//����Ƶ�button�ϵ�ͼ�꣬��Ϊ��
    this.width		= width;		//button������ʽ�Ƽ�Ϊ12px
    this.height		= height;		//button
    this.title		= title;		//tooltip
    this.bgColor	= bgColor;		//button����ɫ��ȱʡΪ͸��
    this.fontFamily	= fontFamily;	//button����
    this.fontSize	= fontSize;		//button�����С����ʽ�Ƽ�Ϊ12px
    this.fontColor	= fontColor;	//button������ɫ
    //�������ķ���
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
   
   
   //�ú�����鿪ʼ�����Ƿ���ڽ������ڣ�С�ڷ���1�����ڷ���0�����ڷ���2
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
//���ð�ť
function resetdefine(obj){
	
	obj.reset();   
}

//�÷������ڼ���������Ƿֿ�д����� ����ֵΪ1�������пյ��������������������ȷ,���������������� by lichj
function isYMD(strYear,strMonth,strDate)
{
	var retInfo = "1";
	if(strYear!=""&&strMonth!=""&&strDate!="")
	{
	  if(testNum(strYear)==1&&testNum(strMonth)==1&&testNum(strDate)==1)
	  {
		if(strYear.length!=4)
		  retInfo = "��ҪΪ��λ�������ݣ�";
		else if(strYear<=0)
			retInfo = "���Ҫ����1��";
		else if(strMonth<1||strMonth>12)
		  retInfo = "�·ݷ�Χ��[1,12]��";
		else
		{
		  if(strMonth==1||strMonth==3||strMonth==5||strMonth==7||strMonth==8||strMonth==10||strMonth==12)
		  {
			if(strDate<1||strDate>31)
			  retInfo = "���ڵķ�Χ��[1,31]��";
			else
			  retInfo = "1";
		  }
		  if(strMonth==4||strMonth==6||strMonth==9||strMonth==11)
		  {
			if(strDate<1||strDate>30)
			  retInfo = "���ڵķ�Χ��[1,30]��";
			else
			  retInfo = "1";
		  }
		  if(strMonth==2)
		  {
			if(isLeapYear(strYear)==1&&(strDate<1||strDate>29))
			  retInfo = "���ڵķ�Χ��[1,29]��";
			else if(strDate>0&&strDate<30)
				retInfo = "1";
			if(isLeapYear(strYear)==0&&(strDate<1||strDate>28))
			  retInfo = "���ڵķ�Χ��[1,28]��";
			else if(strDate>0&&strDate<29)
				retInfo = "1";
		  }
		}
	  }
	  else
		retInfo = "��ݣ��·ݺ�����ҪΪ�������ͣ�";
	}
	return retInfo;
}