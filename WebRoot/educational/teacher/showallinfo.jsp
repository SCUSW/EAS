<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'showallinfo.jsp' starting page</title>
    
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
  <center>
               姓名：${teacher.staffInfo.staffName}</br>
   		性别：${teacher.staffInfo.staffSex}</br>
   		手机：${teacher.staffInfo.staffPhone}</br>
   		Q Q ：${ teacher.staffInfo.staffQq}</br>
   		省份证号：${teacher.staffInfo.staffIdcard}</br>
   		聘用时间:${teacher.staffInfo.staffEmplTime}</br>
   		其他信息${teacher.staffInfo.staffOthers}</br>
   		专       业:${teacher.teacherMajor}</br>
   		教师编号:${teacher.teacherNo}</br>
   		教师院校:${teacher.teacherGraduate}</br>
   		教师工资:${teacher.teacherSalary}</br>
   		教师等级:${teacher.teacherLevel.levelName}</br>
   		职类名称:${teacher.staffInfo.positionInfo.vocationName}</br>
   		课时费：${teacher.teacherLevel.classCost}</br>
   		基本课时:${teacher.teacherLevel.baseClassHour}</br>
   		教师类别:${teacher.teacherType}</br>
   		备   注:${teacher.teacherRemark}</br>
   		</center>
  </body>
</html>
