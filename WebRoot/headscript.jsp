
<!-- 中文控制 -->
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="mytag" uri="/WEB-INF/mytag.tld" %>
<!-- 中文控制 -->
<script type="text/javascript" src="<%=request.getContextPath()%>/extjs/adapter/ext/ext-base.js"></script>

<script type="text/javascript" src="<%=request.getContextPath()%>/extjs/ext-all.js"></script>

<script type="text/javascript" src="<%=request.getContextPath()%>/extjs/source/locale/ext-lang-zh_CN.js" charset='UTF-8'></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/extjs/resources/css/ext-all.css" />

<script type="text/javascript" src="<%=request.getContextPath()%>/extjs/DWRProxy.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/extjs/code.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/extjs/treeNode.js"></script>
<!--  DWR JavaScript 类库 -->	
<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/BasicService.js'></script>
<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/engine.js'></script>
<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/util.js'> </script>
<mytag:skinTag/>
