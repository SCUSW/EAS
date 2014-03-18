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
    
    <title>My JSP 'studentList.jsp' starting page</title>
    
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
    					<td>分支机构</td><td>年级</td><td>班级</td><td>学号</td><td>姓名</td><td>操作</td>
    				</tr>
    				<c:forEach items="${students}" var="s">
    				<tr class="success"> 
    					<td>${s.classInfo.gradeInfo.branchInfo.branchName}</td>
    					<td>${s.classInfo.gradeInfo.gradeName}</td>
    					<td>${s.classInfo.className}</td>
    					<td>${s.studentNo}</td>
    					<td>${s.studentName}</td>
    					<td><button class="btn btn-default" onclick="window.location.href='teacherAct!getStudentInfo.action?student.studentNo=${s.studentNo}'" ><span class="glyphicon glyphicon-eye-open"></span> 查看</button></td>
    				</tr>
    				</c:forEach>
    			</table>
    			<button class="btn btn-default" onclick=" window.history.back()">返回</button>
    	</center>
  </body>
</html>
