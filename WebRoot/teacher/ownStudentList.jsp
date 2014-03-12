<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'studentList.jsp' starting page</title>
    
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
    			<table border="1">
    				<tr>
    					<td>分支机构</td><td>年级</td><td>班级</td><td>学号</td><td>姓名</td><tdcolspan="2">操作</td>
    				</tr>
    				<c:forEach items="${students}" var="s">
    				<tr> 
    					<td>${s.classInfo.gradeInfo.branchInfo.branchName}</td>
    					<td>${s.classInfo.gradeInfo.gradeName}</td>
    					<td>${s.classInfo.className}</td>
    					<td>${s.studentNo}</td>
    					<td>${s.studentName}</td>
    					<td><a href="teacherAct!getOwnStudentInfo.action?studentNo=${s.studentNo}&courseId=${courseId}">查看</a></td>
    				</tr>
    				</c:forEach>
    			</table>
    	</center>
  </body>
</html>
