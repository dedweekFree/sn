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
	   title:'查询条件', 
	   bodyStyle:'padding:5px',    
	   autoWidth: true,   
	   height:150, 
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
      } ,{     
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
	              header:"期间类型", 
                  dataIndex:"productId",
                  width: 110, 
                  sortable:true},{ 
	              header:"期间号", 
                  dataIndex:"productId",
                  width: 110, 
                  sortable:true}
                  ,{ 
	              header:"来源", 
                  dataIndex:"productId",
                  width: 110, 
                  sortable:true}
                  ,{ 
	              header:"计划编号", 
                  dataIndex:"productId",
                  width: 110, 
                  sortable:true}
                  ,{ 
	              header:"机构/客户", 
                  dataIndex:"productId",
                  width: 110, 
                  sortable:true}
                  ,{ 
	              header:"业务员", 
                  dataIndex:"productId",
                  width: 110, 
                  sortable:true}
                  ,{ 
	              header:"填报日期", 
                  dataIndex:"productId",
                  width: 110, 
                  sortable:true}
                  ,{ 
	              header:"单据状态", 
                  dataIndex:"productId",
                  width: 110, 
                  sortable:true}
                  ,{ 
	              header:"创建时间", 
                  dataIndex:"productId",
                  width: 110, 
                  sortable:true} ,{ 
	              header:"创建时间", 
                  dataIndex:"productId",
                  width: 110, 
                  sortable:true}
                   ,{ 
	              header:"创建人", 
                  dataIndex:"productId",
                  width: 110, 
                  sortable:true}
   ]);
   
 Ext.onReady(function(){
  Ext.QuickTips.init(); 
   
     var grid = new Ext.grid.GridPanel({ 
      //title:"计划填报列表",
      tbar:[{
              id:'filters',
              text:'查询',
              handler:function(){
		         document.location='auditing.jsp';
		      },
			  pressed:true
		      },
		      '-',
		      {
		      id:'groupcount',
		      text:'审核',
			  pressed:true}
			  ], 
      region:'center',
      width: 600,   
      cm:colM, 
      store:store
      }); 
      
      
      var viewport = new Ext.Viewport({
          fitToBody:true ,
          border:false,
          layout:'border',
          items:[edit_from, grid]
      });
   
 });   
                          
</script>