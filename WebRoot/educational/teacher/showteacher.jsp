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
    	<div align="right"><a href="educational!queryGroupAndLevel.action?">添加老师</a></div>
    			<table border="1">
    				<tr>
    					<td>教师姓名</td><td>教师编号</td><td colspan="3">操作</td>
    				</tr>
    				<c:forEach items="${teachers}" var="t">
    				<tr> 
    					<td>${t.staffInfo.staffName}</td><td>${t.teacherNo}</td>
    					<td><a href="educational!showAllTeacherInfo.action?teacher.teacherNo=${t.teacherNo}">教师基本信息查看</a></td>
    					<td><a href="educational!queryCourse.action?teacher.teacherNo=${t.teacherNo}">课程查看</a></td>
    					<td><a href="educational!addSalary.action?teacher.teacherNo=${t.teacherNo}">工资清单确认</a></td>
    				</tr>
    				</c:forEach>
    			</table>
    			<a href="educational/teacher/queryteacher.jsp">返回查询界面</a>
    	</center>
  </body>
</html>
