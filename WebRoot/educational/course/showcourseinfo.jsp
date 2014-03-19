<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>...</title>
    
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
    			<table class="table table-hover" border="1">
    				<tr class="warning">
    					<td>课程名称</td><td>开课老师</td><td>开课专业</td><td>开课日期</td><td>结课日期</td><td>每周节数</td><td >操作</td>
    					
    				</tr>
    				<c:forEach items="${courses}" var="c">
    				<tr class="success"> 
    					<td>${c.courseName}</td><td>${c.teacherInfo.staffInfo.staffName}</td>
    					<td>${c.majorInfo.majorName}</td><td>${c.courseStart}</td><td>${c.courseEnd}</td><td>${c.courseTimes}</td>
    					<td><button class="btn btn-default" onclick="window.location.href='educational!queryCourseByNT.action?course.courseId=${c.courseId}'"><span class="glyphicon glyphicon-edit"></span> 编辑</button>&nbsp;
    					<button class="btn btn-default" onclick="window.location.href='educational!deleteCourse.action?course.courseId=${c.courseId}'"><span class="glyphicon glyphicon-remove"></span> 删除</button></td>
    				</tr>
    				</c:forEach>
    				<tr class="active "><td colspan="7"><button class="btn btn-default" onclick="window.location.href='educational/course/addcourse.jsp'"><span class="glyphicon glyphicon-plus"></span> 添加</button></td></tr>
    			</table>
    			
    	</center>
  </body>
</html>
