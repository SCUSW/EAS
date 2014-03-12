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
    
    <title>My JSP 'userlogin.jsp' starting page</title>
    
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
    <div align="center">
    		<form action="teacherAct!searchStudent.action" method="post">
    			<h1>查找学生</h1><br/>
    			学号：<input type="text" name="studentNo"/><br/>
    			姓名：<input type="text" name="studentName"/><br/>
    			<input type="submit" value="登录"/>&nbsp;&nbsp;<input type="reset" value="重置"/>
    		</form>
    		<center>
    			<table border="1">
    				<tr>
    					<td>专业编号</td><td>专业名称</td><td>课程编号</td><td>课程名称</td><td>操作</td>
    				</tr>
    				<c:forEach items="${courses}" var="c">
    				<tr> 
    					<td>${c.majorInfo.majorId}</td>
    					<td>${c.majorInfo.majorName}</td>
    					<td>${c.courseId}</td>
    					<td>${c.courseName}</td>
    					<td><a href="teacherAct!searchOwnStudent?courseId=${c.courseId}">查看学生</a></td>
    				</tr>
    				</c:forEach>
    			</table>
    	</center>
    </div>
  </body>
</html>
