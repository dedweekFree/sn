<!-- 中文控制 -->
<%@ page contentType="text/html;charset=UTF-8"%>
<!-- 中文控制 -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/userservice.js'></script>
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
		name: 'userName',
		blankText:'模块名不能为空',
		allowBlank:false
	}
	,{
		fieldLabel: '姓名',
		name: 'name',
		blankText:'模块名不能为空',
		allowBlank:false
	}
	,{
		fieldLabel: 'userId',
		name: 'userId',
		xtype:'hidden'
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

     var userpanel = new NewWeb.Ext.MainEditPanels(
     {

      dataId:'userId',
      cm :[{id:'id',header: 'id',width: 250,sortable: true,dataIndex: 'userId',hidden:true}
		   ,{header: '用户名',width: 250,sortable: true,dataIndex: 'userName'}
		   ,{header: '姓名',width: 250,sortable: false,dataIndex: 'name'}],
      isTabpael:true, 
      region:'north',
      height:160,
      split:true,
      fp:edit_from,
	  qp:query_form,
	  editsql:'updateUser',
	  delsql:'delUser',
	  totalsql:'getUserPageTotalCount',
	  pagesql:'getUserPage',      
   	  save : function(){
	   	   if(this.fp.getForm().isValid()){
		      if(this.isEdit){
		        this.fp.getForm().doAction("dwrsubmit",{
			    dwrFunction:userservice.updateUserInfo,
			    callback:this.savecallback});
		      }else{
		        this.fp.getForm().doAction("dwrsubmit",{
			    dwrFunction:userservice.saveUser,
			    callback:this.savecallback});
		      }
	   	   }else{
	   	       alertWarning('警告', '表单验证出错!');
	   	   }
	   	 	
	   },
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
