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
    					<td>时间</td><td>审核状态</td><td>教学计划</td><td>教案</td><td>总结</td>
    					<td colspan="4">操作</td>
    				</tr>
    				<c:forEach items="${ownTeachingManageInfos}" var="t">
    				<tr> 
    					<td>${t.setTime}</td>
    					<td>${t.examState}</td>
    					<td>${t.teachPlan}</td>
    					<td>${t.lessonPlan}</td>
    					<td>${t.teacherSummary}</td>
    					<td><a href="${t.teachPlan}">下载教学计划</a></td>
    					<td><a href="${t.lessonPlan}">下载教案</a></td>
    					<td><a href="${t.teacherSummary}">下载总结</a></td>
    					<td>
    					<form action="teacherAct!examTeachingManage.action" method="post">  		
 							<input type="hidden" name="teachingManage.teachingManageId" value="${t.teachingManageId}"/>	
 							<input type="hidden" name="course.courseId" value="${course.courseId}"/>
   							 审核：<input type="text" name="teachingManage.examState"/><input type="submit" value="提交"/>
   						</form>
    					</td>
    				</tr>
    				</c:forEach>
    			</table> 
    	</center>
  </body>
</html>
