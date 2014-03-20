<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>找不到页面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
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
    					<td>课程名称</td><td>课程价格</td>
    					<td>开课教室</td><td>开课专业</td><td>开课时间</td>
    				</tr>
    				<c:forEach items="${courses}" var="c">
    				<tr class="success"> 
    					<td>${c.courseInfo.courseName}</td><td>${c.courseInfo.coursePrice}</td><td>${c.classroomInfo.classroomAddr}</td><td>${c.courseInfo.majorInfo.majorName}</td>
                        <td>${c.classhourInfo.classhourName}&nbsp ${c.classhourInfo.classhourStart}--${c.classhourInfo.classhourEnd}</td>   				
    				</tr>
    				</c:forEach>			
    			</table>
    			<a href="educational/teacher/queryteacher.jsp">返回查询界面</a>
</center>
  </body>
</html>
