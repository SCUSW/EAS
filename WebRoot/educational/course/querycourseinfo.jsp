<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'querystu.jsp' starting page</title>
    
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
    		<form action="educational!queryCourseInfo.action" method="post">
    			<h1>课程信息查询</h1><br/>
    			<div style="color: red">${message}</div>
    			<input type="hidden" name="course.courseId" value="">
    			
			    <div style="width:300px;">
				   	<div class="input-group input-group-sm">
			 			<span class="input-group-addon">课程名称</span>
						<input name="course.courseName" type="text" class="form-control">
					</div>
				</div>
    			
    			 <div style="width:300px;">
				   	<div class="input-group input-group-sm">
			 			<span class="input-group-addon">课程开始日期</span>
						<input name="course.courseStart" type="text" class="form-control">
					</div>
				</div>
    			
    			<input class="btn btn-default" type="submit" value="查询"/>
    		
    		</form>
    </div>
  </body>
</html>
