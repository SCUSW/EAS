<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'updataStudent.jsp' starting page</title>
    
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
    <center> <h1>修改个人信息界面</h1><br/>
   	<form action="student!updateStudent.action" method="post">
   		<input type="hidden" name="studentInfo.studentId" value="${studentInfo.studentId}"/>
		<input type="hidden" name="studentInfo.studentNo" value="${studentInfo.studentNo}"/>
		<input type="hidden" name="studentInfo.studentBalance" value="${studentInfo.studentBalance}"/><br/>
   		<input type="hidden" name="studentInfo.attendTime" value="${studentInfo.attendTime}"/><br/>
   		<input type="hidden" name="studentInfo.rollState.rollstateId" value="${studentInfo.rollState.rollstateId}"/>
   		<input type="hidden" name="studentInfo.groupInfo.groupId" value="${studentInfo.groupInfo.groupId}"/>
   		<input type="hidden" name="studentInfo.studentState" value="${studentInfo.studentState}"/>
   		<input type="hidden" name="studentInfo.consultInfo.consultId" value="${studentInfo.consultInfo.consultId}"/>
   		姓名：<input type="text" name="studentInfo.studentName" value="${studentInfo.studentName}"/><br/>
   		性别：<input type="text" name="studentInfo.studentSex" value="${studentInfo.studentSex}"/><br/>
   		年龄：<input type="text" name="studentInfo.studentAge" value="${studentInfo.studentAge}"/><br/>
   		密码：<input type="password" name="studentInfo.studentPass" value="${studentInfo.studentPass}"/><br/>
   		班级：<input type="text" name="studentInfo.classInfo.classId" value="${studentInfo.classInfo.classId}"/><br/>
   		学校：<input type="text" name="studentInfo.studentSchool" value="${studentInfo.studentSchool}"/><br/>
   		住址：<input type="text" name="studentInfo.studentAddr" value="${studentInfo.studentAddr}"/><br/>
   		电话：<input type="text" name="studentInfo.studentPhone" value="${studentInfo.studentPhone}"/><br/>
   		专业：<input type="text" name="studentInfo.studentMajor" value="${studentInfo.studentMajor}"/><br/>
   		备注：<input type="text" name="studentInfo.studentRemark" value="${studentInfo.studentRemark}"/><br/>
   		<input type="submit" value="确定修改"/>
   </form>
   </center>
  </body>
</html>
