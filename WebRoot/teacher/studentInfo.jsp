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
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	
	<link rel="stylesheet" type="text/css" href="css/body.css">
	
	
	<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/main.js"></script>

  </head>
  
  <body> 
  <table class="table table-hover">
 	<tr class="success"><td>分支机构：${student.classInfo.gradeInfo.branchInfo.branchName}</td></tr>
 	<tr class="success"><td>年级：${student.classInfo.gradeInfo.gradeName}</td></tr>
 	<tr class="success"><td>班级：${student.classInfo.className}</td></tr>
 	<tr class="success"><td>学号：${student.studentNo}</td></tr>
 	<tr class="success"><td>姓名：${student.studentName}</td></tr>
 	<tr class="success"><td>性别：${student.studentSex}</td></tr>
 	<tr class="success"><td>学籍状态：${student.rollState.rollstateName}</td></tr>
 	<tr class="success"><td>年龄：${student.studentAge}</td></tr>
 	<tr class="success"><td>地址：${student.studentAddr}</td></tr>
 	<tr class="success"><td>电话号码：${student.studentPhone }</td></tr>
 	<tr class="success"><td>院校：${student.studentSchool}</td></tr>
 	<tr class="success"><td>专业：${student.studentMajor}</td></tr>
 	<tr class="success"><td>入校时间：${student.attendTime}</td></tr>
 </table>
 <button class="btn btn-default" onclick=" window.history.back()">返回</button>
  </body>
</html>
