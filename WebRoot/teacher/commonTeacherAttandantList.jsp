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
    					<td>账号</td><td>姓名</td><td>时间</td>
    				</tr>
    				<c:forEach items="${commonTeacherAttandants}" var="t">
    				<tr class="success"> 
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
