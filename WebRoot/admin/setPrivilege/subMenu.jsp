<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'subMenu.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<style type="text/css">
	div#menu {background-color:#ffff99;}
	h2 {margin-bottom:0; font-size:14px;}
	ul {margin:0;}
	li {list-style:none;margin-top: 5px;}
	a {text-decoration:none;}
	</style>

  </head>
  
  <body bgcolor="#ffff99">

	<div id="menu">
    <h2>设置权限(组)</h2>
    <br/>
	<ul>
		<li><a href="<%=basePath %>privilegeManage!listPrivilege.action" target="content" >权限列表</a></li>
		<li><a href="admin/setPrivilege/addPrivilege.jsp" target="content" ></a>增加权限</li>
		<li><a href="admin/setPrivilege/delPrivilege.jsp" target="content" ></a>删除权限</li>
		<li><a href="admin/setPrivilege/altPrivilege.jsp" target="content" ></a>修改权限</li>
		<li><a href="<%=basePath %>privilegeManage!listGroup.action" target="content" >查看用户组</a></li>
		<li><a href="<%=basePath %>privilegeManage!addGroup1.action" target="content" >增加用户组</a></li>
		<li><a href="admin/setPrivilege/xxx.jsp" target="content" ></a></li>
	</ul>
    </div>

  </body>
</html>
