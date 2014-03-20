<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'changePass.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<link rel="stylesheet" type="text/css" href="css/body.css">
	
	<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">	
	<link href="css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/main.js"></script>
	<script type="text/javascript" src="js/form_validate.js"></script>	

  </head>
  
  <body>
    <center> <h1> 修改密码 </h1>
    <form action="<%=basePath%>/account!changePass.action" method="post">
    	<div style="width:500px;">
    	<div class="input-group input-group-sm">
	 	 				<span class="input-group-addon">帐&nbsp;&nbsp;&nbsp;&nbsp;号</span>
						<input disabled="disabled" value="${session.loginNo }" name="loginNo" class="form-control">
		</div>
    	
    	<div class="input-group input-group-sm">
	 	 				<span class="input-group-addon">旧密码</span>
						<input name="oldPassword" class="form-control">
		</div>
    	
    	<div class="input-group input-group-sm">
	 	 				<span class="input-group-addon">新密码</span>
						<input name="newPassword" class="form-control">
		</div>
    	</div>
    	<br/>
    	<input class="btn btn-default btn-lg" type="submit" value="修改">
    </form>
    ${request.state }
    
    </center>
  </body>
</html>
