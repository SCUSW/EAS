<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'addteacher.jsp' starting page</title>
    
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
   <center> <h1>添加课程信息界面</h1><br/>
   	<form action="educational!addCourse.action" method="post">    
   		课程名称：<input type="text" name="course.courseName"/><br/>
   		开课老师：<input type="text" name="course.teacherInfo.staffInfo.staffName"/><font color="red">${strTeacher}</font><br/>
   		开课专业:<input type="text" name="course.majorInfo.majorName"><font color="red">${strMajor}</font><br/>
   		课程价格：<input type="text" name="course.coursePrice"/><br/>
   		课程开始日期：<input type="text" name="course.courseStart"/><br/>
   		课程结束日期：<input type="text" name="course.courseEnd"/><br/>
   		课程介绍:<input type="text" name="course.courseDesc"/><br/>
   		课程有效性:<select name="course.courseAvai">
   		
                    <option value="1">有效   	
                    <option value="0">无效	
   		</select><br/>
   		
   		<input type="submit" value="确定添加"/>
   </form>
   </center>
  </body>
</html>
