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
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <center> <h1>个人信息界面</h1><br/>
    	学号：${studentInfo.studentNo}<br/>
    	姓名：${studentInfo.studentName}<br/>
    	性别：${studentInfo.studentSex}<br/>
   		年龄：${studentInfo.studentAge}<br/>
   		班级：${studentInfo.classInfo.classId}<br/>
   		学校：${studentInfo.studentSchool}<br/>
   		住址：${studentInfo.studentAddr}<br/>
   		电话：${studentInfo.studentPhone}<br/>
   		专业：${studentInfo.studentMajor}<br/>
   		余额：${studentInfo.studentBalance}<br/>
   		入学时间：${studentInfo.attendTime}<br/>
   		备注：${studentInfo.studentRemark}<br/>
   </center>
  </body>
</html>
