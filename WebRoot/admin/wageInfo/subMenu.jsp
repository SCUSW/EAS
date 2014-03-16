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
	li {list-style:none;}
	</style>

  </head>
  
  <body bgcolor="#ffff99">

	<div id="menu">
    <h2>工资与职类管理</h2>
    <br/>
	<ul>
		<li><a href="<%=basePath %>vocationManage!listVocation.action" target="content" >查看职类信息</a></li>
		<li><a href="<%=basePath %>vocationManage!addVocation1.action" target="content" >增加职类信息</a></li>
	</ul>
    </div>

  </body>
</html>
