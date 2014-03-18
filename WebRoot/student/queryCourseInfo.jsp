<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>已选课程</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="css/body.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/main.js"></script>
</head>
<%
 String[] tableClass = {"","success","active","warning","danger"};
 int classIndex = 0;
 %>
 <body>
 
	<center>
		<h1>已选课程信息</h1>
		<br />
		<table class="table table-hover">
			<thead>
				<tr>
					<th>课程编号</th>
					<th>专业名称</th>
					<th>课程名称</th>
					<th>开课时间</th>
					<th>课程结束时间</th>
					<th>课程价格</th>
					<th>课程介绍</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${courseInfo}" var="courses">
				<tr class="<%=tableClass[(classIndex++)%5] %>">
					<td>${courses.courseId}</td>
					<td>${courses.majorInfo.majorName}</td>
					<td>${courses.courseName}</td>
					<td><fmt:formatDate value="${courses.courseStart}" type="date" dateStyle="long"/></td>
					<td><fmt:formatDate value="${courses.courseEnd}" type="date" dateStyle="long"/></td>
					<td>${courses.coursePrice}</td>
					<td>${courses.courseDesc}</td>
				</tr>
				</c:forEach>
				
			</tbody>
		</table>
		
	</center>
</body>
</html>
