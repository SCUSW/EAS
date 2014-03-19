<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'queryteacher.jsp' starting page</title>
    
	 
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
    <div align="center">
    		<form action="educational!queryTeacher.action" method="post">
    			<h1>教师息查询</h1>
    			
    			<div style="color: red">${message}</div>
    			
    			<div style="width:300px;">
				   	<div class="input-group input-group-sm">
			 			<span class="input-group-addon">姓名</span>
						<input name="teacher.staffInfo.staffName" type="text" class="form-control">
					</div>
				</div> 

				<div style="width:300px;">
				   	<div class="input-group input-group-sm">
			 			<span class="input-group-addon">教师证号</span>
						<input name="teacher.teacherNo" type="text" class="form-control">
					</div>
				</div>
				
				<div style="width:300px;">
				   	<div class="input-group input-group-sm">
			 			<span class="input-group-addon">专业</span>
						<input name="teacher.teacherMajor" type="text" class="form-control">
					</div>
				</div>
				
				<input class="btn btn-default" type="submit" value="查询"/>
    		</form>
    </div>
  </body>
</html>
