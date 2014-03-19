<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>权限不足</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
<link rel="stylesheet" type="text/css" href="css/body.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/main.js"></script>
  </head>
  <style>
  .site-error,.site-maintain{
  padding-top:80px;
  height:350px;
  background:transparent url(image/error.png) no-repeat right center;
  color:#666;
  font-size:20px}
  </style>
  <body>
  <br><br>
  <center>
  <div class="container col-xs-12 col-md-offset-1 col-md-10 site-error">
  
  		<p style="font-size:64px;padding-right: 200px">别玩了</p><br>
  		<p style="font-size:64px;padding-right: 200px">你没有权限</p><br>
  		<p style="padding-right: 200px">请使用正确权限登录！</p>
</div>
   </center>
  </body>
</html>
