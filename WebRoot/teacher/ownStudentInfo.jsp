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
  	课程：${course.courseName}<br>
  	分数：${register.studentCourseScore}<br>
 	分支机构：${student.classInfo.gradeInfo.branchInfo.branchName}<br>
 	年级：${student.classInfo.gradeInfo.gradeName}<br>
 	班级：${student.classInfo.className}<br>
 	学号：${student.studentNo}<br>
 	姓名：${student.studentName}<br>
 	性别：${student.studentSex}<br>
 	学籍状态：${student.rollState.rollstateName}<br>
 	年龄：${student.studentAge}<br>
 	地址：${student.studentAddr}<br>
 	电话号码：${student.studentPhone }<br>
 	院校：${student.studentSchool}<br>
 	专业：${student.studentMajor}<br>
 	入校时间：${student.attendTime}<br>
 	<br>
 	 <form action="teacherAct!updateStudentCourseScore.action" method="post">  		
 	 <input type="hidden" name="register.registerId" value="${register.registerId}"/>
 	 <input type="hidden" name="student.studentNo" value="${student.studentNo}"/>
 	 <input type="hidden" name="course.courseId" value="${course.courseId}"/>	
   	 评分：<input type="text" name="register.studentCourseScore"/><br/>
    <input type="submit" value="提交"/>
    		</form>
    <a href="teacherAct!getStudentAttendant.action?register.registerId=${register.registerId}">考勤情况</a> 
  </body>
</html>
