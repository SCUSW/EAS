<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'student_finance.jsp' starting page</title>
    
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
	<div style="text-align: center">
	<form action="studentFinanceAction!conditionSearch.action" method="post">
   		学员名称：<input type="text" name="studentInfo.studentName"/>
   		<!--
   		入学年份：<input type="text" /> -- <input type="text" />
   		-->
   		<input type="submit" value="搜索"/>
   	</form>
   	
   	<table border="1">
   		<tr>
   			<td>姓名</td><td>状态</td><td>余额</td><td>操作</td>
   		</tr>
   		<c:forEach items="${student_list}" var="s">
   			<tr>
   			<td>${s.studentName }</td><td>${s.rollState.rollstateName }</td><td>${s.studentBalance }</td><td><input type="button" value="缴费"/><input type="button" value="转正"/><input type="button" value="详细信息"/></td>
   		</tr>
   		</c:forEach>
   	</table>
   		
	</div>
  </body>
</html>
