<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'demo.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/bootstrap-theme.min.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/bootstrap.min.css">
	<script type="text/javascript" src="<%=basePath%>js/jquery.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/main.js"></script>
	
	<style type="text/css">
		body{
			background-image: url(image/background.jpg);
			background-repeat: repeat;
		}
	</style>
  </head>
  
  <body>
   <div id="banner_m" class="container-fluid">
	<div class="row-fluid">
		<div class="span12">
				
				<%@ include file="../include/banner.jsp" %>
		</div>
	</div>
	<div id="topGuide_m" class="row-fluid">
		<div class="span12">
			
			<%@ include file="../include/topGuide.jsp" %>
		</div>
	</div>
	<div class="row-fluid">
		<div class="span4">
			<%@ include file="../include/leftGuide.jsp" %>
		</div>	
		<div class="span8">
			
		</div>
	</div>
</div>
  </body>
</html>
