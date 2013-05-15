<html>
<head>
    <title>审批日志</title>
    <link rel="stylesheet" type="text/css" href="../../../js/ZhrCss.css">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">

    <script src="../../../js/sunnyfunc.js"></script>

    <script src="../../../js/string.js"></script>

    <script>
var undefined;

function init(){
  uniteCols(document.all.tb);//执行
}

function uniteTable(thistab,colLength){   
  var   rn=thistab.rows.length;//取得行数   
  var   rowspann=0;   
  for(j=colLength-1;j>=0;j--){//从第0列开始，合并多少列   
    for(i=rn-1;i>0;i--){//从倒数第一行开始往上检查   
      if(thistab.rows[i].cells[j].innerText==thistab.rows[i-1].cells[j].innerText&&thistab.rows[i].cells[j].colSpan==thistab.rows[i-1].cells[j].colSpan){//与上面一行比较，如果两行相等就合计当前行的合并行数，并删除当前行。   
        rowspann+=thistab.rows[i].cells[j].rowSpan;   
        thistab.rows[i].deleteCell(j);   
      }else{   
        thistab.rows[i].cells[j].rowSpan+=rowspann;//如果不等就完成当前相同数据的合并。   
        rowspann=0;   
      }   
    }   
    //检测无表头的表   
    if(i==0&&rowspann>0){   
      thistab.rows[i].cells[j].rowSpan+=rowspann;//如果不等就完成当前相同数据的合并。   
      rowspann=0;   
    }   
    
  }   
}  
//本业务合并
function uniteCols(thistab){   
  var   rn=thistab.rows.length;//取得行数   
  var   rowspann=0;   
  for(i=rn-1;i>0;i--){//从倒数第一行开始往上检查   
      if(thistab.rows[i].cells[0].innerText==thistab.rows[i-1].cells[0].innerText&&thistab.rows[i].cells[0].colSpan==thistab.rows[i-1].cells[0].colSpan){//与上面一行比较，如果两行相等就合计当前行的合并行数，并删除当前行。   
        rowspann+=thistab.rows[i].cells[0].rowSpan;   
        thistab.rows[i].deleteCell(0);  
	thistab.rows[i].deleteCell(6);
	thistab.rows[i].deleteCell(6);
	thistab.rows[i].deleteCell(6);
	thistab.rows[i].deleteCell(6);
      }else{   
        thistab.rows[i].cells[0].rowSpan+=rowspann;//如果不等就完成当前相同数据的合并。
	thistab.rows[i].cells[7].rowSpan+=rowspann;
	thistab.rows[i].cells[8].rowSpan+=rowspann;
	thistab.rows[i].cells[9].rowSpan+=rowspann;
	thistab.rows[i].cells[10].rowSpan+=rowspann;
        rowspann=0;   
      }   
  }   
  //检测无表头的表   
  if(i==0&&rowspann>0){   
        thistab.rows[i].cells[0].rowSpan+=rowspann;//如果不等就完成当前相同数据的合并。
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
            审批日志
        </div>

<form name="form1" method='post' action="" target="dataframe">
        <table id="tb" class="List">
            <tr class="trtitle" bgcolor="abcdef">
                <th width="18%" height="25" nowrap>
                    客户名称
                </th>
                <th width="8%" height="25" nowrap>
                    部门
                </th>
                <th width="8%" height="25" nowrap>
                    承担部门
                </th>
                <th width="8%" height="25" nowrap>
                    费用科目
                </th>
                <th width="8%" height="25" nowrap>
                    产品类别
                </th>
                <th width="8%" height="25" nowrap>
                    产品费用预算
                </th>
                <th width="8%" height="25" nowrap>
                    说明
                </th>
                <th width="8%" height="25" nowrap>
                    销售目标
                </th>
                <th width="8%" height="25" nowrap>
                    应收目标
                </th>
                <th width="8%" height="25" nowrap>
                    其它目标
                </th>
                <th width="8%" height="25" nowrap>
                    费用预算合计
                </th>
            </tr>

        </table>
        </form>
    </div>
</body>
</html>
