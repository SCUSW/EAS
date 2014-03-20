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
    
    <title>...</title>
    
		<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	
	<link rel="stylesheet" type="text/css" href="css/body.css">
	
	
	<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/main.js"></script>
  </head>
  
  <body>
    	<center>
    			<table class="table table-hover" border="1">
    				<tr class="warning">
    					<td>课程名称</td> <td>开课老师</td> <td>开课专业</td> <td>时间段</td> <td>上课教室</td>
    				</tr>
    				
    				<c:forEach items="${list}" var="list">
    				<tr class="success"> 
    					<td>${list.courseInfo.courseName}</td> <td>${list.courseInfo.teacherInfo.staffInfo.staffName}</td> <td>${list.courseInfo.majorInfo.majorName}</td>
    					<td>${list.classhourInfo.classhourStart}---${list.classhourInfo.classhourEnd}</td><td>${list.classroomInfo.classroomAddr}</td>

    				</tr>
    				</c:forEach>
    			</table>
    			<button class="btn btn-default" onclick="window.location.href='educational/course/queryCourseTable.jsp'"><span class="glyphicon glyphicon-repeat"></span> 返回查询界面</button>
    	</center>
  </body>
</html>
