<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link rel="stylesheet" type="text/css" href="../js/style.css">
<link rel="stylesheet" type="text/css" href="../js/spellCode.css">
<title>故障报修提交</title>
<style type="text/css">
<!--
.bcolor {color: #FF66FF;
		 font-size: 12px;
		}
-->
</style>
<script>
	function phonesvalue(){
		var array = new Array();
		array = [['num','phone','pk']
		#set($i=0)
		#foreach($!m in $selmoduser)
		,['$i','$!m.PHONE','$!m.PK_SENDTYPE']
		#set($i=$i+1)
		#end
		]
		var probpk = document.getElementById("probpk").value;
		for(var j=1;j<array.length;j++){
			if(probpk==array[j][2]){
			document.getElementById('phones').value=array[j][1]+","+document.getElementById('phones').value;
			}
		}var now = new Date(); //获取系统日期 
		var yyy ="'"+now.getYear()+"'"; //截取年		
		var yy = yyy.substring(3,5);
		var mon = now.getMonth()+1; //截取月
		var dd = now.getDate(); //截取日
		//取时间 
		var hh = now.getHours(); //截取小时 
		var mm = now.getMinutes(); //截取分钟
		var ss = now.getTime() % 60000; //获取时间，因为系统中时间是以毫秒计算的，所以秒要通过余60000得到。 
		var mil = now.getMilliseconds();//毫秒
		ss= (ss - (ss % 1000)) / 1000; //然后，将得到的毫秒数再处理成秒 
		var clock = yy; //将得到的各个部分连接成一个日期时间 
		if (parseInt(mon) < 10) mon += '0'; //字符串 
		clock += mon;  
		if (parseInt(dd) < 10) dd += '0';  
		clock += dd;
		if (parseInt(hh) < 10) hh += '0';  
		clock += hh; 
		if (parseInt(mm) < 10) mm += '0';  
		clock += mm;
		if (parseInt(ss) < 10) ss += '0';  
		clock += ss;
		if (parseInt(mil) < 10){mil += '00';
		}else if(10 <= parseInt(mil) < 100){mil += '0';}
		clock += (mil.substr(0,3));
		document.getElementById("sendcode").value="SD"+clock;
		form1.submit();
	}
	function showpf(){
		document.getElementById("a1").style.display="block";
		document.getElementById("a2").style.display="block";
		document.getElementById("a3").style.display="block";
		document.getElementById("a4").style.display="block";
	}
</script>
</head>

<body>
<form name="form1" action="insertmessagesub.aspx">
<table class="datatable">
  <tr class="trcolor">
    <td>报送部门</td>
    <td align="left"><input type="text" name="deptname" value=""/></td>
  </tr>
  <tr class="trcolor">
    <td>报送人姓名</td>
    <td align="left"><input type="text" name="name" value=$!form_username></td>
  </tr>
  <tr class="trcolor">
    <td>内线电话</td>
    <td align="left"><input type="text" name="phone" value=""/>
		<input type="hidden" name="sendcode" id="sendcode" value="">
    </td>
  </tr>
  <tr class="trcolor">
    <td>故障类型<input type="hidden" name="phones" id="phones" value=""></td>
    <td align="left"><select name="probpk" id="probpk">
	#set($i=0)
	#foreach($!m in $selesendprotype)
		<option value="$!m.PK_SENDTYPE">$!m.SENDTYPENAME</option>
	#set($i=$i+1)
	#end
      </select></td>
  </tr>
  <tr class="trcolor">
    <td>故障描述<br><span class='bcolor'>(不要超过50个字)</span></td>
    <td align="left"><textarea name="Text" id="Text" style="width: 300px; height: 150px"></textarea></td>
  </tr>
  <tr class="trcolor">
    <td><input type="button" class="bt1" name="sub" value="确认提交" onclick="phonesvalue()"/></td>
    <td align="left"><span class="bcolor">备注：同样的问题请您提交一次，以免影响受理人的工作</span></td>
  </tr>
</table>
</form>
<form name="form2" method="post" action="updatepjia.aspx" target="saveframe">
	<table class="datatable">
		<tr class="trcolor">
			<td>报修类型</td>
			<td>报修时间</td>
			<td>接单时间</td>
			<td>完成时间</td>
			<td>受理人反馈意见</td>
		</tr>
			#set($i=0)
			#foreach($!m in $selmesagedet)
		<tr class="trcolor">
			<td>$!m.SENDTYPENAME
			#if($!m.ENDTIME!='*') <input type="button" name="bt1" class="bt1" value="评分" onclick="showpf()">
			#else
			#end
			</td>
			<td>$!m.TS</td>
			<td>$!m.RECETIME <input type="hidden" name="sendcode" value="$!m.SENDCODE"></td>
			<td>$!m.ENDTIME</td>
			<td>$!m.REMARK</td>
		</tr>
			#set($i=$i+1)
			#end
		<tr style="display:none" id="a1">
			<td colspan='5' align="center"><span class="bcolor">故障处理不及时的定义:指信息技术部报修受理之时起至受理人员处理完毕间隔时间超过4小时，视为一次处理不及时</span>
			</td>
		</tr>
		<tr class="trcolor" style="display:none" id="a2">
			<td align="center" colspan="2">满意度:<select name="manyi">
						<option value='0'>满意</option>
						<option value='1'>不满意</option>
						</select>
			</td>
			<td align="center" colspan="2">及时性:<select name="jishi">
						<option value='0'>及时</option>
						<option value='1'>不及时</option>
						</select>
			</td>
			<td>&nbsp;</td>
		</tr>
		<tr class="trcolor" style="display:none" id="a3">
			<td colspan="2" align="right">备注:</td>
			<td align="left" colspan="3">
			<textarea name="bak" style="width: 300px; height: 150px"></textarea>
			</td>
		</tr>
		<tr class="trcolor" style="display:none" id="a4">
			<td colspan="5"><input type="submit" value="确认提交" name="bt1" class="bt1"></td>
		</tr>
	</table>
</form>
<iframe name="saveframe" src="about:blank" width="100%" height="0" noresize frameborder=0 framespacing=0 marginheight=0 marginwidth=0></iframe> 
</body>
</html>
