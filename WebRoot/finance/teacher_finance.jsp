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
    
    <title>My JSP 'teacher_finance.jsp' starting page</title>
    
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
    <form action="teacherFinanceAction!searchTeacher.action" method="post">
   		教师名称：<input type="text" name="teacherInfo.staffInfo.staffName"/>
   		<!--
   		入职年份：<input type="text" /> -- <input type="text" />
   		-->
   		<input type="submit"  value="搜索"/>
   		<!--<input type="button" value="设置教师工资"/>-->
   		</form>
   	
   	<table border="1">
   		<tr>
   			<td>姓名</td><td>职位</td><td>应付工资</td><td>已付工资</td><td>操作</td>
   		</tr>
   		<c:forEach items="${teacher_list}" var="t">
   		<tr>
   			<td>${t.staffInfo.staffName }</td><td>${t.teacherLevel.levelName }</td><td>${t.teacherSalary }</td><td>2650</td><td><input type="button" value="支付工资"/>
   		</tr>
   		</c:forEach>
   	</table>
   	</div>
  </body>
</html>
