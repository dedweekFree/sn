<html>
<head>
    <title>������־</title>
    <link rel="stylesheet" type="text/css" href="../../../js/ZhrCss.css">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">

    <script src="../../../js/sunnyfunc.js"></script>

    <script src="../../../js/string.js"></script>

    <script>
var undefined;

function init(){
  uniteCols(document.all.tb);//ִ��
}

function uniteTable(thistab,colLength){   
  var   rn=thistab.rows.length;//ȡ������   
  var   rowspann=0;   
  for(j=colLength-1;j>=0;j--){//�ӵ�0�п�ʼ���ϲ�������   
    for(i=rn-1;i>0;i--){//�ӵ�����һ�п�ʼ���ϼ��   
      if(thistab.rows[i].cells[j].innerText==thistab.rows[i-1].cells[j].innerText&&thistab.rows[i].cells[j].colSpan==thistab.rows[i-1].cells[j].colSpan){//������һ�бȽϣ����������ȾͺϼƵ�ǰ�еĺϲ���������ɾ����ǰ�С�   
        rowspann+=thistab.rows[i].cells[j].rowSpan;   
        thistab.rows[i].deleteCell(j);   
      }else{   
        thistab.rows[i].cells[j].rowSpan+=rowspann;//������Ⱦ���ɵ�ǰ��ͬ���ݵĺϲ���   
        rowspann=0;   
      }   
    }   
    //����ޱ�ͷ�ı�   
    if(i==0&&rowspann>0){   
      thistab.rows[i].cells[j].rowSpan+=rowspann;//������Ⱦ���ɵ�ǰ��ͬ���ݵĺϲ���   
      rowspann=0;   
    }   
    
  }   
}  
//��ҵ��ϲ�
function uniteCols(thistab){   
  var   rn=thistab.rows.length;//ȡ������   
  var   rowspann=0;   
  for(i=rn-1;i>0;i--){//�ӵ�����һ�п�ʼ���ϼ��   
      if(thistab.rows[i].cells[0].innerText==thistab.rows[i-1].cells[0].innerText&&thistab.rows[i].cells[0].colSpan==thistab.rows[i-1].cells[0].colSpan){//������һ�бȽϣ����������ȾͺϼƵ�ǰ�еĺϲ���������ɾ����ǰ�С�   
        rowspann+=thistab.rows[i].cells[0].rowSpan;   
        thistab.rows[i].deleteCell(0);  
	thistab.rows[i].deleteCell(6);
	thistab.rows[i].deleteCell(6);
	thistab.rows[i].deleteCell(6);
	thistab.rows[i].deleteCell(6);
      }else{   
        thistab.rows[i].cells[0].rowSpan+=rowspann;//������Ⱦ���ɵ�ǰ��ͬ���ݵĺϲ���
	thistab.rows[i].cells[7].rowSpan+=rowspann;
	thistab.rows[i].cells[8].rowSpan+=rowspann;
	thistab.rows[i].cells[9].rowSpan+=rowspann;
	thistab.rows[i].cells[10].rowSpan+=rowspann;
        rowspann=0;   
      }   
  }   
  //����ޱ�ͷ�ı�   
  if(i==0&&rowspann>0){   
        thistab.rows[i].cells[0].rowSpan+=rowspann;//������Ⱦ���ɵ�ǰ��ͬ���ݵĺϲ���
        thistab.rows[i].cells[7].rowSpan+=rowspann;
        thistab.rows[i].cells[8].rowSpan+=rowspann;
	thistab.rows[i].cells[9].rowSpan+=rowspann;
	thistab.rows[i].cells[10].rowSpan+=rowspann;
      rowspann=0;   
  }   
} 

    </script>

</head>
<body onload="init()">
    <div class="Main">
        <div class="CaptionTxt">
            ������־
        </div>

<form name="form1" method='post' action="" target="dataframe">
        <table id="tb" class="List">
            <tr class="trtitle" bgcolor="abcdef">
                <th width="18%" height="25" nowrap>
                    �ͻ�����
                </th>
                <th width="8%" height="25" nowrap>
                    ����
                </th>
                <th width="8%" height="25" nowrap>
                    �е�����
                </th>
                <th width="8%" height="25" nowrap>
                    ���ÿ�Ŀ
                </th>
                <th width="8%" height="25" nowrap>
                    ��Ʒ���
                </th>
                <th width="8%" height="25" nowrap>
                    ��Ʒ����Ԥ��
                </th>
                <th width="8%" height="25" nowrap>
                    ˵��
                </th>
                <th width="8%" height="25" nowrap>
                    ����Ŀ��
                </th>
                <th width="8%" height="25" nowrap>
                    Ӧ��Ŀ��
                </th>
                <th width="8%" height="25" nowrap>
                    ����Ŀ��
                </th>
                <th width="8%" height="25" nowrap>
                    ����Ԥ��ϼ�
                </th>
            </tr>

        </table>
        </form>
    </div>
</body>
</html>
