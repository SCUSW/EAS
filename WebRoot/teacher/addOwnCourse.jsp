<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'updateuser.jsp' starting page</title>
    
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
     <center> <h1>增加课程</h1><br/>
     <div style="width:300px;">
   	<form action="teacherAct!addOwnCourse2.action" method="post">
   		<fieldset>
   			<div class="input-group input-group-sm">
 	 			<span class="input-group-addon">专&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;业</span>
				<input name="major.majorId" type="text" class="form-control">
			</div>
			
			<div class="input-group input-group-sm">
 	 			<span class="input-group-addon">名&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称</span>
				<input name="course.courseName" type="text" class="form-control">
			</div>
			
			<div class="input-group input-group-sm">
 	 			<span class="input-group-addon">开课时间</span>
				<input name="course.courseStart" type="text" class="form-control">
			</div>
			
			<div class="input-group input-group-sm">
 	 			<span class="input-group-addon">结课时间</span>
				<input name="course.courseDesc" type="text" class="form-control">
			</div><br/>
		<!--	
	   	专业：<input type="text" name="major.majorId"/><br/>
   		名称：<input type="text" name="course.courseName"/><br/>
   		开课时间：<input type="text" name="course.courseStart"/><br/>
   		结课时间：<input type="text" name="course.courseEnd"/><br/>
   		课程介绍：<input type="text" name="course.courseDesc"/><br/>
   		-->
   			<input class="btn btn-default" type="submit" value="确定添加"/>
   		</fieldset>
   </form>
   </div>
   </center>
  </body>
</html>
