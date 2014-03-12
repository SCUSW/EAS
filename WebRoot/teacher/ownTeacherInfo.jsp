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
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body> 
 	分支机构：${teacher.staffInfo.positionInfo.departmentInfo.branchInfo.branchName}<br>
 	部门：${teacher.staffInfo.positionInfo.departmentInfo.departmentName}<br>
 	职位：${teacher.staffInfo.positionInfo.vocationName}<br>
 	教师类型：${teacher.teacherType}<br>
 	账号：${teacher.staffInfo.staffNo}<br>
 	姓名：${teacher.staffInfo.staffName}<br>
 	性别：${teacher.staffInfo.staffSex}<br>
 	电话号码：${teacher.staffInfo.staffPhone }<br>
 	qq：${teacher.staffInfo.staffQq }<br>
 	身份证：${teacher.staffInfo.staffIdcard }<br>
 	雇佣时间：${teacher.staffInfo.staffEmplTime }<br>
 	教师证号：${teacher.teacherNo }<br>
 	专业：${teacher.teacherMajor }<br>
 	毕业院校：${teacher.teacherGraduate }<br>
 	教师等级：${teacher.teacherLevel.levelName}<br>
 	<br>
 	<a href="teacherAct!updateOwnTeacherInfo1.action">修改</a> 
  </body>
</html>
