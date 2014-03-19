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
    					<td>学生姓名</td><td>学生学号</td><td colspan="2">操作</td>
    				</tr>
    				<c:forEach items="${stus}" var="stu">
    				<tr class="success"> 
    					<td>${stu.studentName}</td><td>${stu.studentNo}</td><td><button class="btn btn-default" onclick="window.location.href='educational!showAllInfo.action?stu.studentNo=${stu.studentNo}'"><span class="glyphicon glyphicon-eye-open"></span> 详细信息</button>&nbsp;
    					<button class="btn btn-default" onclick="window.location.href='educational!checkAttendant.action?stu.studentNo=${stu.studentNo}'"><span class="glyphicon glyphicon-ok-sign"></span> 考勤确认</button></td>
    				</tr>
    				</c:forEach>
    			</table>
    			<a href="educational/student/querystu.jsp">返回查询界面</a>
    	</center>
  </body>
</html>
