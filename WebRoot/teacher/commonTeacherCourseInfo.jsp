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
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body> 
 	专业：${course.majorInfo.majorName}<br>
 	名称：${course.courseName}<br>
 	开课时间：${course.courseStart}<br>
 	结课时间：${course.courseEnd}<br>
 	价格：${course.coursePrice}<br>
 	介绍：${course.courseDesc}<br>
 	<br>
 	 	
 	<form action="teacherAct!updateCommonTeacherCoursePrice.action" method="post">  		
 	<input type="hidden" name="course.courseId" value="${course.courseId}"/>	
   	 设置价格：<input type="text" name="course.coursePrice"/><br/>
    <input type="submit" value="提交"/>
    </form>
  </body>
</html>
