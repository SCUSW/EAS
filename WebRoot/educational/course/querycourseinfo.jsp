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
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  </head>
  
  <body>
    <div align="center">
    		<form action="educational!queryCourseInfo.action" method="post">
    			<h1>课程信息查询界面面</h1><br/>
    			<input type="hidden" name="course.courseId" value="">;
    			课程名称：<input type="text" name="course.courseName"/><br/>
    			课程开始日期：<input type="text" name="course.courseStart"/><br/>
    			<!--<input type="hidden" name="course.teacherInfo.staffInfo.staffName">-->
    			<input type="submit" value="查询"/>&nbsp;&nbsp;<input type="reset" value="重置"/>
    		
    		</form>
    </div>
  </body>
</html>
