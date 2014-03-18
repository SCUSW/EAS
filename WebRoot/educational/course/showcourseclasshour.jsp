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
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		td{
			color: fuchsia;
			text-align: center;
			width: 140px;
		}
	
	</style>
  </head>
  
  <body>
    	<center>
    			<table border="1">
    				<tr>
    					<td>课程名称</td> <td>开课老师</td> <td>开课专业</td> <td>时间段</td> <td>上课教室</td>
    				</tr>
    				
    				<c:forEach items="${list}" var="list">
    				<tr> 
    					<td>${list.courseInfo.courseName}</td> <td>${list.courseInfo.teacherInfo.staffInfo.staffName}</td> <td>${list.courseInfo.majorInfo.majorName}</td>
    					<td>${list.classhourInfo.classhourStart}---${list.classhourInfo.classhourEnd}</td><td>${list.classroomInfo.classroomAddr}</td>

    				</tr>
    				</c:forEach>
    			</table>
    	</center>
  </body>
</html>
