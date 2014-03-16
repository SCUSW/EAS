<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'mainmenu.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<style type="text/css">
	a{text-decoration:none;font-weight: bold;}
	ul li{ list-style:none;}
	ul{border:0px; margin:auto; overflow:auto; zoom:1; padding:0px;}
	ul li{ width:auto; height:auto; line-height:auto; float:left; margin-left:10px; display:inline; margin-top:0px; overflow:hidden;}
	</style>

  </head>
  
  <body>
  
  	<ul>
  		<li><a href="admin/setPrivilege/subMenu.jsp" target="left" >用户权限</a></li>
  		<li><a href="admin/branchInfo/subMenu.jsp" target="left" >分支机构</a></li>
  		<li><a href="admin/deptInfo/subMenu.jsp" target="left" >部门信息</a></li>
  		<li><a href="admin/teacherLevel/subMenu.jsp" target="left" >教师等级</a></li>
  		<li><a href="admin/checkAttendant/subMenu.jsp" target="left" >考勤信息</a></li>
  		<li><a href="admin/wageInfo/subMenu.jsp" target="left" >工资管理</a></li>
  		<li><a href="admin/gradeInfo/subMenu.jsp" target="left" >年级管理</a></li>
  		<li><a href="admin/classInfo/subMenu.jsp" target="left" >班级管理</a></li>
  		<li><a href="admin/scheduleInfo/subMenu.jsp" target="left" >工作日程</a></li>
  	</ul>
  

  
  
<!-- 	<ul class="nav nav-tabs">
	  <li class="active"><a href="#">Home</a></li>
	  <li><a href="#">Profile</a></li>
	  <li><a href="#">Messages</a></li>
	  <li class="dropdown">
	    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
	      Dropdown <span class="caret"></span>
	    </a>
	    <ul class="dropdown-menu">
	    </ul>
	  </li>
	</ul> -->
  </body>
</html>
