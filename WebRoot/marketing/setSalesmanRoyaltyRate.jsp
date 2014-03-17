<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'setSalesmanRoyaltyRate.jsp' starting page</title>
    <link rel="stylesheet" type="text/css" href="css/body.css">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	
	
	<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/main.js"></script>

  </head>
  
  <body>
  	<center> <h1></h1><br/>
       	<form action="marketing!setSalesmanRoyaltyRate.action" method="post">
       		<span style="margin-left:-200px;">提成比例：</span><center><input style="width:200px;margin-top:-23px;margin-left:80px;height:30px;" class="form-control" type="text" name="royaltyRate"/><br/></center>
   		
   		<input style="margin-top:0px;margin-left:0px;font-size:10px;" type="submit" class="btn btn-default" value="确定"/>
   		</form>
   	</center>
  </body>
</html>
