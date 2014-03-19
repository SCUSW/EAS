<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<% 
  if(!com.scusw.util.CheckLogin.checkLogin()){ 
%>
<jsp:forward page="../"/>
<%
}
   %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'showMajorInfo.jsp' starting page</title>
   <meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	
	<link rel="stylesheet" type="text/css" href="css/body.css">
	
	
	<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/main.js"></script>

  </head>
  
  <body>
    <center> 
    	<table class="table table-hover" style="text-align:left;width:600px;">
    		<tr><td>专业编号：</td><td>${majorInfo.majorId}</td></tr>
    		<tr><td>专业名称：</td><td>${majorInfo.majorName}</td></tr>
    		<tr><td>专业介绍：</td><td>${majorInfo.majorIntr}</td></tr>
    	</table>
   </center>
  </body>
</html>
