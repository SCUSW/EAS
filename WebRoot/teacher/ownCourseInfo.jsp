<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'ownTeacherInfo.jsp' starting page</title>
    
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
  <table class="table table-hover">
 	<tr class="success"><td>专业：${course.majorInfo.majorName}</td></tr>
 	<tr class="success"><td>名称：${course.courseName}</td></tr>
 	<tr class="success"><td>开课时间：${course.courseStart}</td></tr>
 	<tr class="success"><td>结课时间：${course.courseEnd}</td></tr>
 	<tr class="success"><td>价格：${course.coursePrice}</td></tr>
 	<tr class="success"><td>介绍：${course.courseDesc}</td></tr>
   	<tr class="success" style="text-align:center;"><td><button class="btn btn-default" onclick="window.location.href='teacherAct!getOwnTeachingManageList.action?course.courseId=${course.courseId }'"><span class="glyphicon glyphicon-edit"></span> 教学管理</button></td></tr>
  </table> 	 
  <center><button class="btn btn-default" onclick=" window.history.back()">返回</button></center>
  </body>
</html>
