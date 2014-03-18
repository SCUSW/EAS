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
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		td{
			color: fuchsia;
			text-align: center;
			width: 140px;
		}
	
	</style>
  </head>
  
  <body>
    	<center>
   <div align="right"><a href="educational/course/addcourse.jsp">添加课程信息</a></div>
    			<table border="1">
    				<tr>
    					<td>课程名称</td><td>开课老师</td><td>开课专业</td><td>开课日期<td>结课日期</td>
    					<td colspan="3">操作</td>
    				</tr>
    				<c:forEach items="${courses}" var="c">
    				<tr> 
    					<td>${c.courseName}</td><td>${c.teacherInfo.staffInfo.staffName}</td>
    					<td>${c.majorInfo.majorName}</td><td>${c.courseStart}</td><td>${c.courseEnd}</td>
    					<td><a href="educational!queryCourseByNT.action?course.courseId=${c.courseId}">修改课程信息</a></td>
    					<td><a href="educational!deleteCourse.action?course.courseId=${c.courseId}">删除课程</a></td>
    				</tr>
    				</c:forEach>
    			</table>
    	</center>
  </body>
</html>
