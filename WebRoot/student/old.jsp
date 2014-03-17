<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
    
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
    <h1>登录成功</h1> <br>
    <p>登录信息：</p><br>
    <div align="center"><a href="<%=basePath%>student!queryStudentByNo.action?studentInfo.studentNo=${studentInfo.studentNo}">个人信息查询</a></div>
    <div align="center"><a href="<%=basePath%>student!queryStudentBeforeUpdate.action?studentInfo.studentNo=${studentInfo.studentNo}">修改个人信息</a></div>
    <div align="center"><a href="<%=basePath%>student!noticeInfoQuery.action">公告查询</a></div>
    <div align="center"><a href="<%=basePath%>student!majorInfoQuery.action?studentInfo.studentNo=${studentInfo.studentNo}">专业查询</a></div>
  </body>
</html>
