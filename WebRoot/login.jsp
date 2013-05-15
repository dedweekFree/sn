<!-- 中文控制 -->
<%@ page contentType="text/html;charset=UTF-8"%>
<!-- 中文控制 -->
<html>

<style>
/*body{TEXT-ALIGN: center;}*/
#login{
MARGIN-TOP:20%; 
MARGIN-RIGHT: auto;
MARGIN-LEFT: auto; 
vertical-align:middle;
line-height:200px;
}
</style>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>思念综合业务系统</title>
<%@ include file="/headscript.jsp"%>

<script type="text/javascript">

Ext.onReady(function(){
var comds = new Ext.data.Store({
	proxy: new Ext.data.DWRSimpleProxy (BasicService.getListData,[]),
	reader: new Ext.data.ListSimpleReader({
		id: 'corpid'
	}
	, Ext.data.Record.create(['corpid', 'corpname'])),
	remoteSort: true
    }
);

Ext.QuickTips.init();
var login_from = new Ext.FormPanel({
    title:'用户登录',
	//id:'role-form',
	width:400,
	//monitorValid:true,
	frame:true,
	//renderTo :document.body,
	renderTo:'login',
	labelWidth: 75,
	labelAlign: 'right',
	defaults:{
		width: 230
	},
	defaultType: 'textfield',
	items: [{
		fieldLabel:'用户名',
		name: 'userName',
		blankText:'用户名不能为空',
		allowBlank:false,
		listeners: {  
			'blur': function(f){   
				 comds.load({arg:['getnccorpbyusername',{userName:Ext.get("userName").dom.value}]});
				 comds.on('load',function(comds,records){
				    if(records.length>0){
                       Ext.getCmp('combo').setValue(records[0].data.corpid);
	                }
				 });
			}  
		}
	},{
		fieldLabel: '密码',
		inputType :'password',
		blankText:'密码不能为空',
		allowBlank:false,
		name: 'passWord'
	},{
	    id:'combo',
		fieldLabel:'公司'   ,
		xtype:'combo',
		displayField:'corpname',
		valueField:"corpid",
		hiddenName:"corpid", 
		mode: 'local',
		width: 245,
		triggerAction: 'all',
		store:comds,
		name:'corpid',
		selectOnFocus:true,
		typeAhead: true,
		editable:false, 
		listClass: 'x-combo-list-small',
		autoSelect:true,
		lazyRender:true,
		allowBlank:false
	},{
        name: 'actions',
		value:'dologin',  
		xtype:'hidden'

	}],
	submit: function(){
           this.getEl().dom.action = 'loginAction.action',//转向页面地址
           this.getEl().dom.method='POST',//方式
           this.getEl().dom.submit();//提交！
    },
	buttons:[
	{text:"确定",handler:login,formBind:true},
	{text:"取消",handler:reset}],
	keys:[{     
         key:Ext.EventObject.ENTER,      
         fn:login,      
         scope:this     
    }]   
	
	
});
function login(){
         login_from.getForm().submit();//提交
 }
function reset(){
      login_from.getForm().reset();//取消
}
});



</script>
</head>
<body>
<s:if test="hasActionErrors()">
<div id="errorDiv" style="padding-left: 10px; margin-bottom: 5px">
<span class="error">
<s:iterator value="actionErrors">
<span class="errorMessage"><s:property escape="false" /></span>
</s:iterator>
</span>
</div>
</s:if> 
<div id="login" align="center"></div>

</body>
</html>