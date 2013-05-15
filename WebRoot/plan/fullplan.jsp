<!-- 中文控制 -->
<%@ page contentType="text/html;charset=UTF-8"%>
<!-- 中文控制 -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/storeBasicService.js'></script>
<%@ include file="/headscript.jsp"%>
<script type='text/javascript' src='<%=request.getContextPath()%>/extjs/GroupSummary.js'></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/extjs/summary.css" />
<script type="text/javascript">

MyGridView=Ext.extend(Ext.grid.GridView,{ 
  renderHeaders : function(){ 
      var cm = this.cm, ts = this.templates; 
      var ct = ts.hcell,ct2=ts.mhcell; 
      
      var cb = [], sb = [], p = {},mcb=[];    
      for(var i = 0, len = cm.getColumnCount(); i < len; i++){ 
          p.id = cm.getColumnId(i); 
          p.value = cm.getColumnHeader(i) || ""; 
          p.style = this.getColumnStyle(i, true); 
          if(cm.config[i].align == 'right'){ 
              p.istyle = 'padding-right:16px'; 
          } 
          cb[cb.length] = ct.apply(p); 
          if(cm.config[i].mtext)mcb[mcb.length]=ct2.apply({value:cm.config[i].mtext,mcols:cm.config[i].mcol}); 
      } 
      var s=ts.header.apply({cells: cb.join(""), tstyle:'width:'+this.getTotalWidth()+';',mergecells:mcb.join("")}); 
      return s; 
  } 
}); 
viewConfig={ 
           forceFit:false,
          templates:{              
              header:new Ext.Template( 
                  ' <table border="0" cellspacing="0" cellpadding="0" style="{tstyle}">', 
                  ' <thead> <tr class="x-grid3-hd-row">{mergecells} </tr>' + 
                  ' <tr class="x-grid3-hd-row">{cells} </tr> </thead>', 
                  " </table>" 
                  ), 
          mhcell: new Ext.Template( 
                  ' <td class="x-grid-cell" colspan="{mcols}"> <div align="center"> <b>{value} </b> </div>', 
                  " </td>" 
                  )    
          } 
      }; 
Ext.onReady(function(){    
  var data=[{id:1, 
              productId:'0316010105', 
              productName:'320g金牌金玉豆沙汤圆', 
              unit:'01/件', 
              weight:'0', 
              unitprice:'120', 
              
              tasknum:'30',
              taskmoney:'1300',
              taskweight:'4514',
              
              plannum:'30',
              planmoney:'1300',
              planweight:'4514',
              
              nexttasknum:'30',
              nexttaskmoney:'1300',
              nexttaskweight:'4514',
              
              
              nextplannum:'30',
              nextplanmoney:'1300',
              nextplanweight:'4514'
              
              } 
                  
          ]; 
          
  var store=new  Ext.data.JsonStore({ 
      data:data, 
      fields:["id","productId","productName","unit","weight","unitprice","tasknum","taskmoney","taskweight","plannum"
      ,"planmoney","planweight","nexttasknum","nexttaskmoney","nexttaskweight"
      ,"nextplannum","nextplanmoney","nextplanweight"
      ] 
          });  
          
          
   var edit_from = new Ext.FormPanel({
	   labelAlign: 'left',   
	   title:'计划填报', 
	   bodyStyle:'padding:5px',    
	   autoWidth: true,   
	   height:200, 
	   //frame:true,  
	   labelWidth:75,
       region:'north',
	  
    items: [{       
     layout:'column',       
     border:false,  
                     
     items:[{            
         columnWidth:.4,            
         layout: 'form',            
         border:false,  
              
         items: [{                
            fieldLabel: '计划编号',
			name: 'startdata',
		    width: 200,
			xtype:'textfield'  
            }]        
      },{     
        columnWidth:.4,            
        layout: 'form',            
        border:false,            
        items: [{  
	        fieldLabel: '填报日期',
			name: 'enddata',
		    width: 200,
			xtype:'textfield'         
        }]        
      },{     
        columnWidth:.4,            
        layout: 'form',            
        border:false,            
        items: [{  
	        fieldLabel: '机构/客户',
			name: 'enddata',
		    width: 200,
			xtype:'textfield'         
        }]        
      }
      ,{     
        columnWidth:.4,            
        layout: 'form',            
        border:false,            
        items: [{  
	        fieldLabel: '来源',
			name: 'enddata',
		    width: 200,
			xtype:'textfield'         
        }]        
      }  ,{     
        columnWidth:.4,            
        layout: 'form',            
        border:false,            
        items: [{  
	        fieldLabel: '业务员',
			name: 'enddata',
		    width: 200,
			xtype:'textfield'         
        }]        
      } ,{     
        columnWidth:.4,            
        layout: 'form',            
        border:false,            
        items: [{  
	        fieldLabel: '录入人',
			name: 'enddata',
		    width: 200,
			xtype:'textfield'         
        }]        
      },{     
        columnWidth:.4,            
        layout: 'form',            
        border:false,            
        items: [{  
	        fieldLabel: '录入时间',
			name: 'enddata',
		    width: 200,
			xtype:'textfield'         
        }]        
      },{     
        columnWidth:.4,            
        layout: 'form',            
        border:false,            
        items: [{  
	        fieldLabel: '当前状态',
			name: 'enddata',
		    width: 200,
			xtype:'textfield'         
        }]        
      }
	
 
      ]    
   }]
});          
           
      var colM=new Ext.grid.ColumnModel([{ 
                  header:"商品代码", 
                    mtext:"&nbsp;", 
                    mcol:5, 
                  dataIndex:"productId",
                  width: 110, 
                  sortable:true, 
                  editor:new Ext.form.TextField()},  
              { 
                  header:"名称", 
                   width: 120,  
                  dataIndex:"productName", 
                  sortable:true, 
                  editor:new Ext.form.TextField()}, 
              { 
                  header:"单位",
                   width: 100,   
                  dataIndex:"unit", 
                  sortable:true, 
                  editor:new Ext.form.TextField()}, 
             { 
                  header:"单重", 
                   width: 100,  
                  dataIndex:"weight", 
                  sortable:true, 
                  editor:new Ext.form.TextField()}, 
              { 
                  header:"单价",  
                   width: 100, 
                  dataIndex:"unitprice", 
                  sortable:true, 
                  editor:new Ext.form.TextField()},
 
              {header:"数量", 
                mtext:"本期销售任务",
                dataIndex:"tasknum",  
                mcol:3, 
                width:120}, 
                
              {header:"金额", 
                dataIndex:"taskmoney", 
                sortable:true, 
                editor:new Ext.form.TextField()},
             {header:"重量", 
                dataIndex:"taskweight", 
                sortable:true, 
                editor:new Ext.form.TextField()},   
                
              {header:"数量", 
                dataIndex:"plannum", 
                mtext:"本期进货计划", 
                mcol:3, 
                width:120}, 
              {header:"金额", 
                dataIndex:"planmoney", 
                sortable:true, 
                editor:new Ext.form.TextField()},
              {header:"重量", 
                dataIndex:"planweight", 
                sortable:true, 
                editor:new Ext.form.TextField()},
               
                
               {header:"数量", 
                mtext:"下期销售任务", 
                dataIndex:"nexttasknum", 
                mcol:3, 
                width:120}, 
                
              {header:"金额", 
                dataIndex:"nexttaskmoney", 
                sortable:true, 
                editor:new Ext.form.TextField()},
                
              {header:"重量", 
                dataIndex:"nexttaskweight", 
                sortable:true, 
                editor:new Ext.form.TextField()},
              {header:"数量", 
                mtext:"下期进货计划", 
                dataIndex:"nextplannum", 
                mcol:3, 
                width:120}, 
              {header:"金额", 
                dataIndex:"nextplanmoney", 
                sortable:true, 
                editor:new Ext.form.TextField()},
              {header:"重量", 
                dataIndex:"nextplanweight", 
                sortable:true, 
                editor:new Ext.form.TextField()}
                
                
            
                 
              ]);
              
               
  var grid = new Ext.grid.EditorGridPanel({ 
 
      title:"",
        tbar:[{
              id:'filters',
              text:'导入商品',
			  pressed:true
		      },
		      '-',
		      {
		      id:'groupcount',
		      text:'删除行',
			  pressed:true},'-'
			  , {
		      id:'groupcount',
		      text:'保存',
			  pressed:true}
			  ], 
      region:'center',
      width: 600,   
      cm:colM, 
      store:store, 
      view:new MyGridView(viewConfig)
  }); 
  
     var viewport = new Ext.Viewport({
          fitToBody:true ,
          border:false,
          layout:'border',
          items:[edit_from, grid]
      });
       
  
  
}); 

</script>
<body>
<div id="box"> </div> 
<div id="hello"> </div> 
<select name="sexList" id="sexList" style="display: none;"> 
      <option>男 </option> 
      <option>女 </option> 
</select> 
</body>

