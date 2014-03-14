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
    
    <title>My JSP 'studentAttendantList.jsp' starting page</title>
    
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
    					<td>账号</td><td>姓名</td><td>时间</td>
    				</tr>
    				<c:forEach items="${commonTeacherAttandants}" var="t">
    				<tr> 
    					<td>${t.staffInfo.staffNo}</td>
    					<td>${t.staffInfo.staffName}</td>
    					<td>${t.attendantTime}</td>
    				</tr>
    				</c:forEach>
    			</table>
    			<a href="teacherAct!addCommonTeacherAttandant.action?staff.staffId=${staff.staffId}">增加</a>
    	</center>
  </body>
</html>
