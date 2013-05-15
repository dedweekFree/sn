<!-- 中文控制 -->
<%@ page contentType="text/html;charset=UTF-8"%>
<!-- 中文控制 -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel='stylesheet' type='text/css' href='<%=request.getContextPath()%>/multisel/Multiselect.css'> 
<%@ include file="/headscript.jsp"%>
<script type="text/javascript" src="<%=request.getContextPath()%>/multisel/Multiselect.js"></script> 
<script type="text/javascript" src="<%=request.getContextPath()%>/multisel/DDView.js"></script> 
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

var fromcomds = new Ext.data.Store({
	proxy: new Ext.data.DWRSimpleProxy (BasicService.getListData),
	reader: new Ext.data.ListSimpleReader({
		id: 'roleId'
	}
	, Ext.data.Record.create(['roleId', 'roleName'])),
	remoteSort: true
}
);

var tocomds = new Ext.data.Store({
	proxy: new Ext.data.DWRSimpleProxy (BasicService.getListData),
	reader: new Ext.data.ListSimpleReader({
		id: 'roleId'
	}
	, Ext.data.Record.create(['roleId', 'roleName'])),
	remoteSort: true
}
);



var edit_from = new Ext.FormPanel({
	title:'用户信息',
	id: 'User-form',
	autoWidth:true,
	labelWidth: 75,
	border:false,
	defaults:{
		width: 230
	}
	,
	defaultType: 'textfield',
	items: [{
		fieldLabel: '用户名',
		name: 'NAME',
		blankText:'模块名不能为空',
		readOnly:true,
		allowBlank:false
	}
	,{
		fieldLabel: 'userId',
		name: 'USERID',
		xtype:'hidden'
	}
	,{
		xtype:"itemselector",
		name:"roleId",
		fieldLabel:"分配角色",
		fromStore:fromcomds,
		toStore:tocomds,
		msWidth:250,
		autoScroll:true,
		msHeight:200,
		valueField:"roleId",
		displayField:"roleName",
		toLegend:"已选栏",
		fromLegend:"可选栏",
		toTBar:[{
			text:"取消选择",
			handler:function(){
				//var i=edit_from.getForm().findField("roleId");
				//i.reset.call(i);
				var i=edit_from.getForm().findField("roleId");
				i.removeSelected();
			}
		}]
	}
	
	]});

var query_form = new Ext.FormPanel({
	title:'查询',
	id: 'query-form',
	labelWidth: 75,
	autoWidth:true,
	border:false,
	defaults:{
		width: 230
	}
	,
	defaultType: 'textfield',
	items: [{
		fieldLabel: '姓名(like)',
		name: 'name'
	}
	]});

Ext.onReady(function(){
    Ext.QuickTips.init();
  
      fromcomds.load({arg:['getAllRole',{}]});
     var userpanel = new NewWeb.Ext.MainEditPanels(
     {

      dataId:'USERID',
      cm :[{id:'id',header: 'id',width: 250,sortable: true,dataIndex: 'USERID',hidden:true}
		   ,{header: '姓名7',width: 100,sortable: true,dataIndex: 'NAME'}
		   ,{header: '角色名',sortable: false,dataIndex: 'ROLENAME'}],
      isTabpael:true, 
      region:'north',
      height:300,
      split:true,
      fp:edit_from,
	  qp:query_form,
	  save : function(){
	   	   if(this.fp.getForm().isValid()){
		       var formdata = this.fp.getForm().getValues();
		  
		       var arrobj = formdata['roleId'].split(",");
		            
		       var datas = [];
		       for(var i=0;i<arrobj.length;i++ ){
		            var data = {'userId':formdata['USERID'],'roleId':arrobj[i]};
		            datas.push(data)
		       }
		       BasicService.batchSaveORUpdate('getRoleTotalForSaveOrUpdate','updateRoleForUser','saveRoleForUser',datas
		       ,this.savecallback);
	   	   }else{
	   	       alertWarning('警告', '表单验证出错!');
	   	   }
	   	 	
	   },
	  rowselectCallBack : function(r){
            fromcomds.reload();   

            tocomds.load({arg:['getRoleByUserId',{userid:r.id}]});
        
      },
	   
	  addsql:'addUser',
	  editsql:'updateUser',
	  delsql:'delUser',
	  totalsql:'getUserForRoleTotal',
	  pagesql:'getUserForRole',      
	  //topbutton:['-',{text: '添加333', id:'addd', pressed: true}],
      collapseMode:'mini'});
      
  
      

     var viewport = new Ext.Viewport({
          fitToBody:true ,
          border:false,
          layout:'border',
          items:[userpanel, userpanel.grid]
      });
      
  
});




</script>
</head>
<body>
</body>
</html>
