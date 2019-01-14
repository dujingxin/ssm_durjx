<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>User Login</title>
<!-- 引入JQuery -->
<script type="text/javascript"	src="${pageContext.request.contextPath}/jquery-easyui-1.5.4.5/jquery.min.js"></script>
<!-- 引入EasyUI -->
<script type="text/javascript"	src="${pageContext.request.contextPath}/jquery-easyui-1.5.4.5/jquery.easyui.min.js"></script>
<!-- 引入EasyUI的中文国际化js，让EasyUI支持中文 -->
<script type="text/javascript"	src="${pageContext.request.contextPath}/jquery-easyui-1.5.4.5/locale/easyui-lang-zh_CN.js"></script>
<!-- 引入EasyUI的样式文件-->
<link rel="stylesheet"	href="${pageContext.request.contextPath}/jquery-easyui-1.5.4.5/themes/default/easyui.css"	type="text/css" />
<!-- 引入EasyUI的图标样式文件-->
<link rel="stylesheet"	href="${pageContext.request.contextPath}/jquery-easyui-1.5.4.5/themes/icon.css"	type="text/css" />
<script type="text/javascript" src="https://www.jeasyui.com/easyui/jquery.edatagrid.js"></script>
</head>
<body class="easyui-layout">
	<div data-options="region:'north',title:'搜索栏',split:true"
		style="height: 150px;">
		<div align="center" style="margin-bottom: auto;margin: 30px;" >
	   <input name="search" class="easyui-searchbox" style="width:300px"  />
	   </div>
  </div>
	<!--  <div data-options="region:'south',title:'South Title',split:true" style="height:100px;"></div> -->
	<!-- <div data-options="region:'east',title:'East',split:true" style="width:100px;"></div> -->
	<div data-options="region:'west',title:'最新动态',split:true"
		style="width: 220px;">
		<div style="width: 200px; height: auto; background: #7190E0; padding: 5px;">
			<div class="easyui-panel" title="人员管理" collapsible="true"
				style="width: 200px; height: auto; padding: 10px;">
				<a id="btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'">人员管理</a>
			</div>
			<br />
			<div class="easyui-panel" title="File and Folder Tasks"
				collapsible="true"
				style="width: 200px; height: auto; padding: 10px;">
				Make a new folder<br /> Publish this folder to the Web<br /> Share
				this folder
			</div>
			<br />
			<div class="easyui-panel" title="Other Places" collapsible="true"
				collapsed="true" style="width: 200px; height: auto; padding: 10px;">
				New York<br /> My Pictures<br /> My Computer<br /> My Network
				Places
			</div>
			<br />
			<div class="easyui-panel" title="Details" collapsible="true"
				style="width: 200px; height: auto; padding: 10px;">
				My documents<br /> File folder<br /> <br /> Date modified:
				Oct.3rd 2010
			</div>
		</div>

	</div>
	<div data-options="region:'center',title:'图片展示'"
		style="padding: 5px; background: #eee;"></div>
   <script type="text/javascript">
       $(function(){
          $('#btn').bind('click', function(){
          //document.location = "userMangement";
          window.location.href = "userMangement";
          });
       });	
       </script>
</body>
</html>