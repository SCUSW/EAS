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
    
    <title>My JSP 'studentAttendantList.jsp' starting page</title>
    
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
    	<center>
    			<table border="1">
    				<tr>
    					<td>课程</td><td>学号</td><td>姓名</td><td>时间</td>
    				</tr>
    				<c:forEach items="${studentAttendants}" var="s">
    				<tr> 
    					<td>${s.registerInfo.courseInfo.courseName}</td>
    					<td>${s.registerInfo.studentInfo.studentNo}</td>
    					<td>${s.registerInfo.studentInfo.studentName}</td>
    					<td>${s.attendantTime}</td>
    				</tr>
    				</c:forEach>
    			</table>
    			<a href="teacherAct!addStudentAttendant.action?registerId=${registerId}">增加</a>
    	</center>
  </body>
</html>
