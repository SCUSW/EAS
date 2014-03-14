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
    
    <title>My JSP 'commonTeacherList.jsp' starting page</title>
    
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
    					<td>时间</td><td>审核状态</td><td>操作</td>
    				</tr>
    				<c:forEach items="${ownTeachingManageInfos}" var="t">
    				<tr> 
    					<td>${t.setTime}</td>
    					<td>${t.examState}</td>
    					<td><a href="teacherAct!getOwnCommonTeacherInfo.action">下载</a></td>
    				</tr>
    				</c:forEach>
    			</table>
    			<a href="teacherAct!addCommonTeacher1">增加任课教师</a>
    	</center>
  </body>
</html>
