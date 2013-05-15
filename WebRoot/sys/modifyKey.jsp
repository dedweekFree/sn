<!-- 中文控制 -->
<%@ page contentType="text/html;charset=UTF-8"%>
<!-- 中文控制 -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ include file="/headscript.jsp"%>
<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/userservice.js'></script>

<script type="text/javascript">
Ext.onReady(function(){
Ext.QuickTips.init();
Ext.apply(Ext.form.VTypes,{
    password:function(val,field){//val指这里的文本框值，field指这个文本框组件，大家要明白这个意思
       if(field.confirmTo){//confirmTo是我们自定义的配置参数，一般用来保存另外的组件的id值
           var pwd=Ext.get(field.confirmTo);//取得confirmTo的那个id的值
           return (val==pwd.getValue());
       }
       return true;
    }
});


var edit_from = new Ext.FormPanel({
    title:'修改用户密码',
	id:'role-form',
	autoWidth:true,
	monitorValid:true,
	frame:true,
	renderTo :document.body,
	labelWidth: 75,
	defaults:{
		width: 230
	},
	defaultType: 'textfield',
	items: [{
		fieldLabel:'旧密码',
		inputType :'password',
		name: 'oldpassword',
		blankText:'用户名不能为空',
		allowBlank:false
	},{
		fieldLabel: '新密码',
		inputType :'password',
		blankText:'密码不能为空',
		allowBlank:false,
		name: 'newpassword'
	},{
		fieldLabel: '确认新密码',
		inputType :'password',
		blankText:'密码不能为空',
		allowBlank:false,
	    vtype:'password',//自定义的验证类型
        vtypeText:"两次密码不一致",
        confirmTo:'newpassWord',//要比较的另外一个的组件的id
		name: 'confirmpassWord'
		
	},{
        name: 'userId',
		value:'<s:property value="#session.com_newapp_web_user_Info.userId"/>',  
		xtype:'hidden'
	}],

	buttons:[
	{text:"确定",handler:editpassword,formBind:true},
	{text:"取消",handler:reset}],
	keys:[{     
         key:Ext.EventObject.ENTER,      
         fn:editpassword,      
         scope:this     
    }]   
	
});

function editpassword(){
   ///login_from.getForm().submit();//提交
   var formdata = edit_from.getForm().getValues();
   userservice.updatePassword( formdata,function(falg){
       if(falg==0){
          alert("旧密码不正确");
       }else if(falg==1){
         alert("修改成功！");
         window.close();
       }
   })

}

function reset(){
   login_from.getForm().reset();//取消
}

});

</script>
</head>
<body>
</body>
</html>
