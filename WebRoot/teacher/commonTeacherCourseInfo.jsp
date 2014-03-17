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
  	<table style="text-align:center" class="table table-hover">
 		<tr class="success"><td>专业：${course.majorInfo.majorName}</td></tr>
	 	<tr class="success"><td>名称：${course.courseName}</td></tr>
	 	<tr class="success"><td>开课时间：${course.courseStart}</td></tr>
	 	<tr class="success"><td>结课时间：${course.courseEnd}</td></tr>
	 	<tr class="success"><td>价格：${course.coursePrice}</td></tr>
	 	<tr class="success"><td>介绍：${course.courseDesc}</td></tr>
 	 </table>
 	 <center>	
 	<form action="teacherAct!updateCommonTeacherCoursePrice.action" method="post">  		
 	<input type="hidden" name="course.courseId" value="${course.courseId}"/>
 	
 	<div style="width:300px;" class="input-group input-group-sm">
 	 			<span class="input-group-addon">设置价格：</span>
				<input  name="course.coursePrice" type="text" class="form-control">
			</div>	
    <input class="btn btn-default" type="submit" value="提交"/>
    </form>
    <a href="teacherAct!getCommonTeachingManageList.action?course.courseId=${course.courseId }">教学管理</a>
  	</center>
  </body>
 	 
</html>
