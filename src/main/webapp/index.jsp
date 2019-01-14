<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title></title>
    <link rel="stylesheet" type="text/css" href="js/jquery-easyui-1.4.3/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="js/jquery-easyui-1.4.3/themes/icon.css">

    <script type="text/javascript" src="js/jquery-easyui-1.4.3/jquery.min.js"></script>
    <script type="text/javascript" src="js/jquery-easyui-1.4.3/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>/js/jquery-easyui-1.4.3/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript">
        function login() {
            $("#loginForm").submit();
        }
    </script>
</head>
<div style="position:fixed;left:40%;top:30%;margin-left:width/2;margin-top:height/2;">
    <div class="easyui-panel" title="用户登录" style="width:400px;padding:30px 70px 20px 70px;">
        <form id="loginForm" action="login" class="ui-form" method="post">
            <div style="margin-bottom:10px">
                <input class="easyui-textbox" id="userName" name="userName" style="width:100%;height:40px;padding:12px" data-options="required:true,iconCls:'icon-man',iconWidth:38">
            </div>
            <div style="margin-bottom:20px">
                <input class="easyui-textbox" id="password" name="password" type="password" style="width:100%;height:40px;padding:12px" data-options="required:true,iconCls:'icon-lock',iconWidth:38">
            </div>
        <div style="margin-bottom:20px">
                <input type="checkbox" checked="checked" id="checked" name="checked">
                <span>记住用户</span>
            </div> 
        </form>
        <div>
            <a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" style="padding:5px 0px;width:100%;" onclick="login()">
                <span style="font-size:14px;">登录•</span>
            </a>
        </div>
    </div>  
</div>
</html>