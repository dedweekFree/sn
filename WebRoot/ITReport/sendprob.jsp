<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link rel="stylesheet" type="text/css" href="../js/style.css">
<link rel="stylesheet" type="text/css" href="../js/spellCode.css">
<title>���ϱ����ύ</title>
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
		}var now = new Date(); //��ȡϵͳ���� 
		var yyy ="'"+now.getYear()+"'"; //��ȡ��		
		var yy = yyy.substring(3,5);
		var mon = now.getMonth()+1; //��ȡ��
		var dd = now.getDate(); //��ȡ��
		//ȡʱ�� 
		var hh = now.getHours(); //��ȡСʱ 
		var mm = now.getMinutes(); //��ȡ����
		var ss = now.getTime() % 60000; //��ȡʱ�䣬��Ϊϵͳ��ʱ�����Ժ������ģ�������Ҫͨ����60000�õ��� 
		var mil = now.getMilliseconds();//����
		ss= (ss - (ss % 1000)) / 1000; //Ȼ�󣬽��õ��ĺ������ٴ������ 
		var clock = yy; //���õ��ĸ����������ӳ�һ������ʱ�� 
		if (parseInt(mon) < 10) mon += '0'; //�ַ��� 
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
    <td>���Ͳ���</td>
    <td align="left"><input type="text" name="deptname" value=""/></td>
  </tr>
  <tr class="trcolor">
    <td>����������</td>
    <td align="left"><input type="text" name="name" value=$!form_username></td>
  </tr>
  <tr class="trcolor">
    <td>���ߵ绰</td>
    <td align="left"><input type="text" name="phone" value=""/>
		<input type="hidden" name="sendcode" id="sendcode" value="">
    </td>
  </tr>
  <tr class="trcolor">
    <td>��������<input type="hidden" name="phones" id="phones" value=""></td>
    <td align="left"><select name="probpk" id="probpk">
	#set($i=0)
	#foreach($!m in $selesendprotype)
		<option value="$!m.PK_SENDTYPE">$!m.SENDTYPENAME</option>
	#set($i=$i+1)
	#end
      </select></td>
  </tr>
  <tr class="trcolor">
    <td>��������<br><span class='bcolor'>(��Ҫ����50����)</span></td>
    <td align="left"><textarea name="Text" id="Text" style="width: 300px; height: 150px"></textarea></td>
  </tr>
  <tr class="trcolor">
    <td><input type="button" class="bt1" name="sub" value="ȷ���ύ" onclick="phonesvalue()"/></td>
    <td align="left"><span class="bcolor">��ע��ͬ�������������ύһ�Σ�����Ӱ�������˵Ĺ���</span></td>
  </tr>
</table>
</form>
<form name="form2" method="post" action="updatepjia.aspx" target="saveframe">
	<table class="datatable">
		<tr class="trcolor">
			<td>��������</td>
			<td>����ʱ��</td>
			<td>�ӵ�ʱ��</td>
			<td>���ʱ��</td>
			<td>�����˷������</td>
		</tr>
			#set($i=0)
			#foreach($!m in $selmesagedet)
		<tr class="trcolor">
			<td>$!m.SENDTYPENAME
			#if($!m.ENDTIME!='*') <input type="button" name="bt1" class="bt1" value="����" onclick="showpf()">
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
			<td colspan='5' align="center"><span class="bcolor">���ϴ�����ʱ�Ķ���:ָ��Ϣ��������������֮ʱ����������Ա������ϼ��ʱ�䳬��4Сʱ����Ϊһ�δ�����ʱ</span>
			</td>
		</tr>
		<tr class="trcolor" style="display:none" id="a2">
			<td align="center" colspan="2">�����:<select name="manyi">
						<option value='0'>����</option>
						<option value='1'>������</option>
						</select>
			</td>
			<td align="center" colspan="2">��ʱ��:<select name="jishi">
						<option value='0'>��ʱ</option>
						<option value='1'>����ʱ</option>
						</select>
			</td>
			<td>&nbsp;</td>
		</tr>
		<tr class="trcolor" style="display:none" id="a3">
			<td colspan="2" align="right">��ע:</td>
			<td align="left" colspan="3">
			<textarea name="bak" style="width: 300px; height: 150px"></textarea>
			</td>
		</tr>
		<tr class="trcolor" style="display:none" id="a4">
			<td colspan="5"><input type="submit" value="ȷ���ύ" name="bt1" class="bt1"></td>
		</tr>
	</table>
</form>
<iframe name="saveframe" src="about:blank" width="100%" height="0" noresize frameborder=0 framespacing=0 marginheight=0 marginwidth=0></iframe> 
</body>
</html>
