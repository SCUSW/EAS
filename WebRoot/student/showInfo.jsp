<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

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
    <center> <h1>个人信息</h1><br/>
    	<table border="1" style="width:600px;text-align:left;" class="table table-hover">
    		<tr class="active">
    			<td>学号：</td><td>${studentInfo.studentNo}</td>
    			<td>姓名：</td><td>${studentInfo.studentName}</td>
    		</tr>
    		<tr class="success">
    			<td>性别：</td><td>${studentInfo.studentSex == 1 ? "男" : "女"}</td>
    			<td>年龄：</td><td>${studentInfo.studentAge}</td>
    		</tr>
    		<tr class="warning">
    			<td>班级：</td><td>${studentInfo.classInfo.classId}</td>
    			<td>学校：</td><td>${studentInfo.studentSchool}</td>
    		</tr>
    		<tr class="danger">
    			<td>住址：</td><td>${studentInfo.studentAddr}</td>
    			<td>电话：</td><td>${studentInfo.studentPhone}</td>
    		</tr>
    		<tr class="active">
    			<td>专业：</td><td>${studentInfo.studentMajor}</td>
    			<td>余额：</td><td>${studentInfo.studentBalance}</td>
    		</tr>
    		<tr class="success">
    			<td>入学时间：</td><td>${studentInfo.attendTime}</td>
    			<td>备注：</td><td>${studentInfo.studentRemark}</td>
    		</tr>
    	</table>
    	
   </center>
  </body>
</html>
