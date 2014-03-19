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
    
    <title>My JSP 'userlogin.jsp' starting page</title>
    
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
    <div align="center">
    		<center>
    			<table class="table table-hover" border="1">
    				<tr class="warning">
    					<td>专业编号</td><td>专业名称</td><td>课程编号</td><td>课程名称</td><td>价格</td><td colspan="2">操作</td>
    				</tr>
    				<c:forEach items="${courses}" var="c">
    				<tr class="success"> 
    					<td>${c.majorInfo.majorId}</td>
    					<td>${c.majorInfo.majorName}</td>
    					<td>${c.courseId}</td>
    					<td>${c.courseName}</td>
    					<td>${c.coursePrice}</td>
    					<td><button class="btn btn-default" onclick="window.location.href='teacherAct!ownCourseInfo.action?course.courseId=${c.courseId}'"><span class="glyphicon glyphicon-eye-open"></span> 查看</button></td>
    					
    					<c:choose>
    						<c:when test="${c.courseAvai==1}">
    							<td><button class="btn btn-default" onclick="window.location.href='teacherAct!searchOwnStudent.action?course.courseId=${c.courseId}'"><span class="glyphicon glyphicon-user"></span> 学生</button></td>
							</c:when>
							<c:otherwise>
									<td>未被排课</td>
							</c:otherwise>
						</c:choose>	    			
    			
    				</tr>
    				</c:forEach>
    				
    				<c:choose>
    					<c:when test="${teacher.teacherType == 0}">
    						<tr style="text-align:center;" class="success"><td colspan="7">
    							<button class="btn btn-default" onclick="window.location.href='teacherAct!addOwnCourse1'">
    						<span class="glyphicon glyphicon-plus"></span> 增设课程</button></td></tr>
    					</c:when>
    				</c:choose>
    				
    			</table>
    			
    	</center>
    </div>
  </body>
</html>
