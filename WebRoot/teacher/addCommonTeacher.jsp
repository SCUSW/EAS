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
    
    <title>My JSP 'updateuser.jsp' starting page</title>
    
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
     <center> <h1>增加任课教师</h1><br/>
   	<form action="teacherAct!addCommonTeacher2.action" method="post">
	   	账号：<input type="text" name="staff.staffNo"/><br/>
   		姓名：<input type="text" name="staff.staffName"/><br/>
   		性别：<input type="text" name="staff.staffSex"/><br/>
   		身份证号：<input type="text" name="staff.staffIdcard"/><br/>
   		教师证号：<input type="text" name="teacher.teacherNo"/><br/>
   		专业：<input type="text" name="teacher.teacherMajor"/><br/>
   		毕业院校：<input type="text" name="teacher.teacherGraduate"/><br/>
   		教师等级：<input type="text" name="teacherLevel.levelId"/><br/>
   		手机：<input type="text" name="staff.staffPhone"/><br/>
   		QQ：	<input type="text" name="staff.staffQq"/><br/>
   			<input type="submit" value="确定添加"/>
   </form>
   </center>
  </body>
</html>
