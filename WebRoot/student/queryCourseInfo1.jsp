<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'queryCourseInfo.jsp' starting page</title>
    
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
    <center> <h1>所选课程信息界面</h1><br/>
    		<table border="1">
    		<tr>
    			<td>课程编号</td>
    			<td>专业名称</td>
    			<td>课程名称</td>
    			<td>开课时间</td>
    			<td>结课时间</td>
    			<td>上课时间</td>
				<td>上课地点</td>
    			<td>课程价格</td>
    			<td>课程介绍</td>
    		</tr>
    		<c:forEach items="${courseInfo}" var="courses"  varStatus="s">
    		<tr>
    			<c:forEach items="${classhourEveryWeek[s.index]}" var="times" varStatus="t">
    			<c:choose>
    				<c:when test="${(s.first==true && t.index ==0) || courses.courseTimes == 1 || (s.first==false && t.index ==0)}">
    					<tr>
    						<td rowspan="${courses.courseTimes}">${courses.courseId}</td>
    						<td rowspan="${courses.courseTimes}">${courses.majorInfo.majorName}</td>
    						<td rowspan="${courses.courseTimes}">${courses.courseName}</td>
    						<td rowspan="${courses.courseTimes}">${courses.courseStart}</td>
    						<td rowspan="${courses.courseTimes}">${courses.courseEnd}</td>
							<td>${classhourEveryWeek[s.index][t.index]}</td>
							<td>${classroom[s.index][t.index]}</td>
    						<td rowspan="${courses.courseTimes}">${courses.coursePrice}</td>
    						<td rowspan="${courses.courseTimes}">${courses.courseDesc}</td>
    					</tr>
    				</c:when>
    				<c:otherwise>
    					<tr>
    						<td>${classhourEveryWeek[s.index][t.index]}</td>
							<td>${classroom[s.index][t.index]}</td>
						</tr>
    				</c:otherwise>  
   				</c:choose>
    			</c:forEach>
    		</tr>
    		</c:forEach>
    		</table>
   </center>
  </body>
</html>