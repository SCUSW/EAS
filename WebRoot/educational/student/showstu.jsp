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
    
    <title>My JSP 'userlist.jsp' starting page</title>
    
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
    			<table border="1">
    				<tr>
    					<td>学生姓名</td><td>学生学号</td><td colspan="2">操作</td>
    				</tr>
    				<c:forEach items="${stus}" var="stu">
    				<tr> 
    					<td>${stu.studentName}</td><td>${stu.studentNo}</td><td><a href="educational!showAllInfo.action?stu.studentNo=${stu.studentNo}">学员详细信息查看</a></td><td><a href="educational!checkAttendant.action?stu.studentNo=${stu.studentNo}">考勤确认</a></td>
    				</tr>
    				</c:forEach>
    			</table>
    	</center>
  </body>
</html>
