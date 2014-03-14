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
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
     <center> <h1>增加课程</h1><br/>
   	<form action="teacherAct!addOwnCourse2.action" method="post">
	   	专业：<input type="text" name="major.majorId"/><br/>
   		名称：<input type="text" name="course.courseName"/><br/>
   		开课时间：<input type="text" name="course.courseStart"/><br/>
   		结课时间：<input type="text" name="course.courseEnd"/><br/>
   		课程介绍：<input type="text" name="course.courseDesc"/><br/>
   			<input type="submit" value="确定添加"/>
   </form>
   </center>
  </body>
</html>
