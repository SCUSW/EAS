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
    
    <title>My JSP 'show.jsp' starting page</title>
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
    <center> <h1></h1><br/>
    <table class="table table-hover" style="text-align:center">
    	<tr class="success"><td>学号：${studentInfo.studentNo}</td></tr>
    	<tr class="success"><td>姓名：${studentInfo.studentName}</td></tr>
    	<tr class="success"><td>性别：${studentInfo.studentSex == 1 ? "男" : "女"}</td></tr>
   		<tr class="success"><td>年龄：${studentInfo.studentAge}</td></tr>
   		<tr class="success"><td>班级：${studentInfo.classInfo.classId}</td></tr>
   		<tr class="success"><td>学校：${studentInfo.studentSchool}</td></tr>
   		<tr class="success"><td>住址：${studentInfo.studentAddr}</td></tr>
   		<tr class="success"><td>电话：${studentInfo.studentPhone}</td></tr>
   		<tr class="success"><td>专业：${studentInfo.studentMajor}</td></tr>
   		<tr class="success"><td>余额：${studentInfo.studentBalance}</td></tr>
   		<tr class="success"><td>入学时间：${studentInfo.attendTime}</td></tr>
   		<tr class="success"><td>备注：${studentInfo.studentRemark}</td></tr>
   	</table>	
   		<button class="btn btn-default" onclick="window.location.href('<%=basePath %>studentFinanceAction!searchAll.action')">返回</button><br/>
   </center>
  </body>
</html>
