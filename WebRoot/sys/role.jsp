<!-- 中文控制 -->
<%@ page contentType="text/html;charset=UTF-8"%>
<!-- 中文控制 -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/headscript.jsp"%>
<style type="">
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
<style type="text/css">
  .x-grid3-header-offset {width: auto;}
</style>

<script type="text/javascript">

edit_form = function() {
 edit_form.superclass.constructor.call(this, {
    id:'role_form',
	autoWidth:true,
	labelWidth: 75,
	border:false,
	defaults:{
		width: 230
	},
	defaultType: 'textfield',
	items: [{
		fieldLabel: '角色名',
		id:'roleName',
		name: 'roleName',
		blankText:'角色名不能为空',
		allowBlank:false
	},{
		fieldLabel: 'roleId',
		id:'roleId',
		name: 'roleId',
		xtype:'datefield'
	}]
	});
};
Ext.extend(edit_form, Ext.FormPanel);  

	
roleTreePanel = function() {
    roleTreePanel.superclass.constructor.call(this, {
        id:'role-tree',
        region:'west',
        width: 200,
        minSize: 150,
        maxSize: 500,
        margins:'0 0 5 5',
        cmargins:'0 0 0 0',
        rootVisible:false,
        lines:false,
        split:true,
        collapsible: true,
        autoScroll:true,
        animCollapse:false,
        animate: false,
        loader: new Ext.tree.TreeLoader({
            dataUrl:'<%=request.getContextPath()%>/menuTree.action?actions=forRole',
			preloadChildren: true,
			clearOnLoad: false
		}),
        root: new Ext.tree.AsyncTreeNode({
              id:"0",
              text:"系统角色",
              leaf:false,
              expanded:true
         }),
        collapseFirst:false
    });
    this.getSelectionModel().on('beforeselect', function(sm, node){
            showPrcing();
	    	store.load({params:{listSql:'getModuleForRole',roleId:node.id},callback:hiddenPrcing})

    });
 }
   
Ext.extend(roleTreePanel, Ext.tree.TreePanel);  

 
  
store = new Ext.data.Store({
		proxy: new Ext.data.DWRProxy(BasicService.getListForPage, true),
		reader: new Ext.data.ListRangeReader({
	    id:this.dataId, totalProperty:'totalcount', root: 'records'}

	),
    remoteSort: true
});

this.store.on("load", function (){}); 



function formatSex(value) {
		return value=='1' ? "是" : "否";
}

 

editrolePanel =  function() {
   editrolePanel.superclass.constructor.call(this, {
       region:'center',
       store: store,
       
       cm:cm,
       autoWidth:true,
       frame:true,
       title:'权限分配',// 标题
       clicksToEdit:0,//设置点击几次才可编辑
       tbar:[{text:'全部选中',
			  pressed:true,
		      handler:function(item){allorunselect('1')}},
		      '-',
		      {text:'全部取消',
			  pressed:true,
		      handler:function(item){allorunselect('0')}}
		      ],
       selModel: new Ext.grid.RowSelectionModel({singleSelect:false})
  });
   this.on("afteredit", afterEdit);
 }

Ext.extend(editrolePanel, Ext.grid.EditorGridPanel); 






  

var cm = new Ext.grid.ColumnModel([
        {id:'id',header: "编号",dataIndex: 'MODULEID',width: 50,hidden:true},      
		{ id:'name',header: "模块名",dataIndex: 'MODULENAME',width: 250},
		{header: "添加",dataIndex: 'SYS_ADD',width: 95,renderer: formatSex,editor: new Ext.form.Checkbox()},
        {header: "删除",dataIndex: 'SYS_DEL',width: 95,renderer: formatSex,editor: new Ext.form.Checkbox()},
        {header: "修改",dataIndex: 'SYS_MOD',width: 95,renderer: formatSex,editor: new Ext.form.Checkbox() },
        {header: "其它",dataIndex: 'SYS_OTHER',width: 95,renderer: formatSex, editor: new Ext.form.Checkbox()}
]); 
	

   
Ext.onReady(function(){
Ext.QuickTips.init();



var doedit = function(){
     
     var selectNode = treepanel.getSelectionModel().getSelectedNode();
     if(selectNode){
            var edtform =  new edit_form;
           crareteWindows({title:'修改新角色',width:400,height:100,formPanel:edtform,doPost:function(win){
		            if(edtform.getForm().isValid()){
				     	edtform.getForm().doAction("dwrsubmit",{
					    dwrFunction:BasicService.saveForMap,
					    param:['updateRole'],
					    callback:function(){treepanel.root.reload();win.close();}});
				     }else{
		   	            alertWarning('警告', '表单验证出错!');
		             }
		        }
		   }); 
		   edtform.getForm().setValues({'roleName':selectNode.text,'roleId':selectNode.id})
	 
	} else{
	      alertWarning('警告', '请选择一个要删除角色!');
    } 
}

//
allorunselect = function(falg){
  var selectNode = treepanel.getSelectionModel().getSelectedNode();
  var record = editpanel.getSelectionModel().getSelected();
  var datas = new Array();
  showPrcing();
  if(!selectNode){
       alertWarning('警告', '请选择一个要设置角色!');
       return ;
  }
  if(record){
      var records = editpanel.getSelections();
     for (var i = 0, len = records.length; i < len; i++) {
          var data ={'roleid':selectNode.id,
			 'moduleid':records[i].get('MODULEID'),
			 'add':falg,
			 'del':falg,
			 'mod':falg,
			 'other':falg
			 }; 
        datas.push(data)
     }
     
  }else{
     for (var i = 0, len = store.getCount(); i < len; i++) {
          var r = store.getAt(i)
           var data ={'roleid':selectNode.id,
			 'moduleid':r.get('MODULEID'),
			 'add':falg,
			 'del':falg,
			 'mod':falg,
			 'other':falg
		  }; 
        datas.push(data)
     }
  }
  if(datas.length>0){
      if(falg==1){
         BasicService.batchSaveORUpdate('selctForTotal','updateModueForRole','saveModuleForRole',datas,function(){store.load({params:{listSql:'getModuleForRole',roleId:selectNode.id}});hiddenPrcing();});
      }else{
         BasicService.batchDelExecute('delModuleForRole',datas,function(){store.load({params:{listSql:'getModuleForRole',roleId:selectNode.id}});hiddenPrcing();});
      }
  }
 
}


//保存设置
afterEdit = function(e){

 var record = e.record;// 被编辑的记录
 var selectNode = treepanel.getSelectionModel().getSelectedNode();

 var data ={'roleid':selectNode.id,
			 'moduleid':record.get('MODULEID'),
			 'add':record.get('SYS_ADD')==true?'1':'0',
			 'del':record.get('SYS_DEL')==true?'1':'0',
			 'mod':record.get('SYS_MOD')==true?'1':'0',
			 'other':record.get('SYS_OTHER')==true?'1':'0'
			 };  
 BasicService.batchSaveORUpdate('selctForTotal','updateModueForRole','saveModuleForRole',[data],function(){store.load({params:{listSql:'getModuleForRole',roleId:selectNode.id}})});
 
}
var dodel = function(){
  var selectNode = treepanel.getSelectionModel().getSelectedNode();
  if(selectNode){
	   Ext.MessageBox.confirm('消息', '确认要删除所选角色?', function(btn){
	   if(btn=='yes'){
          BasicService.batchDelExecute('delRole',[{'delid':selectNode.id}] ,function(){treepanel.root.reload();} );
	     }
	   })
	} else{
	      alertWarning('警告', '请选择一个要删除角色!');
    }
}

var doPost = function(win,edtform){
	  if(edtform.getForm().isValid()){
		     	edtform.getForm().doAction("dwrsubmit",{
			    dwrFunction:BasicService.saveForMap,
			    param:['addRole'],
			    callback:function(){treepanel.root.reload();win.close();}
		    });
	   	   }else{
	   	       alertWarning('警告', '表单验证出错!');
	 }

}



toptoolPanel = new Ext.Panel({
        region:'north',
        border:false,
        bodyBorder:false,
        autoWidth:true,
        height:25,		
	    items: [
        new Ext.Toolbar({
            items:[
			{
				  text:'添加角色',
				  pressed:true,
				  handler:function(item){
                       crareteWindows({title:'添加新角色',width:400,height:100,doPost:doPost,formPanel:new edit_form});
				  }
			},'-',
			{
				text: '删除解色',
				pressed:true,
                handler: dodel
            }, '-', {
                text: '修改解色',
                pressed:true,
                handler: doedit
            }]
        })]
});


var  editpanel = new editrolePanel();
var treepanel = new roleTreePanel();
  
  var viewport = new Ext.Viewport({
      fitToBody:true ,
      border:false,
      layout:'border',
      items:[toptoolPanel,treepanel, editpanel]
  });
      
         
});


</script>
</head>
<body>
</body>
</html>
