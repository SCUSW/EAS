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
    
    <title>My JSP 'userlogin.jsp' starting page</title>
    
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
    <div align="center">
    		<center>
    			<table border="1">
    				<tr>
    					<td>专业编号</td><td>专业名称</td><td>课程编号</td><td>课程名称</td><td>价格</td><td>操作</td>
    				</tr>
    				<c:forEach items="${courses}" var="c">
    				<tr> 
    					<td>${c.majorInfo.majorId}</td>
    					<td>${c.majorInfo.majorName}</td>
    					<td>${c.courseId}</td>
    					<td>${c.courseName}</td>
    					<td>${c.coursePrice}</td>
    					<td><a href="teacherAct!commonTeacherCourseInfo?course.courseId=${c.courseId }">查看</a></td>
    				</tr>
    				</c:forEach>
    			</table>
    	</center>
    </div>
  </body>
</html>