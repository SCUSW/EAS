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
    	<span style="color: red">${message}</span>
    	<div align="right"><a href="educational!queryGroupAndLevel.action?">添加老师</a></div>
    			<table class="table table-hover" border="1">
    			
    				<tr class="warning">
    					<td>教师姓名</td><td>教师编号</td><td colspan="3">操作</td>
    				</tr>
    				<c:forEach items="${teachers}" var="t">
    				<tr class="success"> 
    					<td>${t.staffInfo.staffName}</td><td>${t.teacherNo}</td>
    					<td><button class="btn btn-default" onclick="window.location.href='educational!showAllTeacherInfo.action?teacher.teacherNo=${t.teacherNo}'"><span class="glyphicon glyphicon-eye-open"></span> 教师基本信息</button></td>
    					<td><button class="btn btn-default" onclick="window.location.href='educational!queryCourse.action?teacher.teacherNo=${t.teacherNo}'"><span class="glyphicon glyphicon-eye-open"></span> 课程查看</button></td>
    					<td><button class="btn btn-default" onclick="window.location.href='educational!addSalary.action?teacher.teacherNo=${t.teacherNo}'"><span class="glyphicon glyphicon-ok-sign"></span> 工资清单确认</button></td>
    				</tr>
    				</c:forEach>
    			</table>
    			<a href="educational/teacher/queryteacher.jsp">返回查询界面</a>
    	</center>
  </body>
</html>
