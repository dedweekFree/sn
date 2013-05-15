<!-- 中文控制 -->
<%@ page contentType="text/html;charset=UTF-8"%>
<!-- 中文控制 -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<%@ include file="/headscript.jsp"%>


<style type="text/css" media="all">
.search-item {
    font:normal 11px tahoma, arial, helvetica, sans-serif;
    padding:3px 10px 3px 10px;
    border:1px solid #fff;
    border-bottom:1px solid #eeeeee;
    white-space:normal;
    color:#555;
}
.search-item h3 {
    display:block;
    font:inherit;
    font-weight:bold;
    color:#222;
}

.search-item h3 span {
    float: right;
    font-weight:normal;
    margin:0 0 5px 5px;
    width:100px;
    display:block;
    clear:none;
}



</style>


<script type="text/javascript">

var comds = new Ext.data.Store({
	proxy: new Ext.data.DWRSimpleProxy (BasicService.getListData,[{'functionId':'0','functionName':'无上级模块'}]),
	reader: new Ext.data.ListSimpleReader({
		id: 'functionId'
	}
	, Ext.data.Record.create(['functionId', 'functionName'])),
	remoteSort: true
}
);

//////////////////////////////////// FORM  ?????ˉ BEGIN ////////////////////////////////////////

var edit_from = new Ext.FormPanel({
	   labelAlign: 'left',   
	   title:'模块信息', 
	   bodyStyle:'padding:5px',    
	   autoWidth: true,   
	   autoHeight:true, 
	   //frame:true,  
	   labelWidth:75,
	  
    items: [{       
     layout:'column',       
     border:false,  
                     
     items:[{            
         columnWidth:.4,            
         layout: 'form',            
         border:false,  
              
         items: [{                
            fieldLabel: '模块名称',
            xtype: 'textfield',
		    name: 'functionName',
		    blankText:'模块名不能为空' ,            
            width: 230
            }]        
      },{     
        columnWidth:.4,            
        layout: 'form',            
        border:false,            
        items: [{  
	        id:'combo',
			fieldLabel:'上级模块'   ,
			xtype:'combo',
			displayField:'functionName',
			valueField:"functionId",
	        hiddenName:"parentFunctionId", 
			mode: 'local',
			width: 230,
			triggerAction: 'all',
			store:comds,
			name:'parentFunctionId',
			selectOnFocus:true,
			typeAhead: true,
			listClass: 'x-combo-list-small',
			lazyRender:true        
        }]        
      },{     
        columnWidth:.25,            
        layout: 'form',            
        border:false,            
        items: [{  
	       xtype: 'ux-radiogroup',
	       fieldLabel: '外部模块',
		   name: 'functionType',
		   		  horizontal:true,
		   radios:[{
			 value:1,
	
		     checked:true, //optional
			 boxLabel:'是' //optional
		   }, {
		     value:0,
			  boxLabel:'否' //optional
		   }]       
        }]        
      },{     
        columnWidth:1,            
        layout: 'form',            
        border:false,            
        items: [{  
             xtype: 'textfield',                     
             fieldLabel: '内部码',
              width: 300,
		     name: 'functionUrl'          
        }]        
      }
	,{
		fieldLabel: 'functionId',
		name: 'functionId',
		xtype:'hidden'
		
	}
    
      ]    
   }]
});








	


var query_form = new Ext.FormPanel({
	title:'查询',
	id: 'query-form',
	labelWidth: 75,
	border:false,
	autoWidth:true,
	defaults:{
		width: 230
	},
	defaultType: 'textfield',
	items: [{
		fieldLabel: '模块名?(like)',
		name: 'home'
	}
	,{
		fieldLabel:'上级模块',
		xtype:'combo',
		displayField:'text',
		mode: 'local',
		triggerAction: 'all',
		store:comds,
		valueField: 'id',
		name:'Pid',
		editable: false,
		selectOnFocus:true,
		typeAhead: true,
		lazyRender:true
	}
	]});
//////////////////////////////////// FORM  ?????ˉ END ////////////////////////////////////////	

function PidtoName(val, p,rec){
	if(val == 0){
		return '<span style="color:green;">' + '无上级模块' + '</span>';
	}
	return val;
}


Ext.onReady(function(){
    Ext.QuickTips.init();
    comds.load({arg:['getAllModel',{}]});
  
	 
	  var molulepanel = new NewWeb.Ext.MainEditPanels({
	      dataId:'functionId',
          cm : [{id:'id',header: 'id',width: 250,sortable: true,dataIndex: 'functionId',hidden:true}
		     ,{header: '模块名',width: 250,sortable: true,dataIndex: 'functionName'}
		     ,{header: '内部码',width: 250,sortable: false,dataIndex: 'functionUrl'}
		     ,{header: '上级模块',width: 250,sortable: false,dataIndex:'parentFunctionId'}
		     ,{header: '模块类型',width: 250,sortable: false,dataIndex:'functionType',hidden:true}],
	      isTabpael:true, 
	      region:'north',
	      height:160,
	      fp:edit_from,
		  qp:query_form,
		  addsql:'addModel',
		  editsql:'updateModel',
		  delsql:'delModel',
		  totalsql:'getModulePageTotalCount',
		  pagesql:'getModulePage',  
		  split:true,    
         collapseMode:'mini'});

     var viewport = new Ext.Viewport({
          fitToBody:true ,
          border:false,
          layout:'border',
          items:[molulepanel, molulepanel.grid]
      });
    
    
});






</script>
</head>
<body>
</body>
</html>
