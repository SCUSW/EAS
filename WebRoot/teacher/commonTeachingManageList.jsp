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
    			<table border="1" class="table table-hover">
    				<tr class="warning">
    					<td>时间</td><td>审核状态</td><td>教学计划</td><td>教案</td><td>总结</td>
    					<td colspan="4">操作</td>
    				</tr>
    				<c:forEach items="${ownTeachingManageInfos}" var="t">
    				<tr class="success"> 
    					<td>${t.setTime}</td>
    					
						<c:choose>
							<c:when test="${t.examState==0}">  
  								<td>未审核</td>
　							</c:when>
							<c:when test="${t.examState==1}">  
								<td>审核通过</td>
　　							</c:when>
							<c:otherwise>  
 								<td>审核未通过</td>
　　							</c:otherwise>
						</c:choose>

						<td><a href="${t.teachPlan}">下载教学计划</a></td>

						<c:choose>
							<c:when test="${t.lessonPlan!=null}">  
  								<td><a href="${t.lessonPlan}">下载教案</a></td>
　							</c:when>
							<c:otherwise>  
 								<td>未提交教案</td>
　　							</c:otherwise>
						</c:choose>
						
						<c:choose>
							<c:when test="${t.teacherSummary!=null}">  
  								<td><a href="${t.teacherSummary}">下载总结</a></td>
　							</c:when>
							<c:otherwise>  
 								<td>未提交总结</td>
　　							</c:otherwise>
						</c:choose>
    					
    					<td>
    					<form action="teacherAct!examTeachingManage.action" method="post">  		
 							<input type="hidden" name="teachingManage.teachingManageId" value="${t.teachingManageId}"/>	
 							<input type="hidden" name="course.courseId" value="${course.courseId}"/>
   							<select id="select" name="teachingManage.examState"  class="form-control" >
								<option value=1>通过</option>
     							<option value=2>未通过</option>
     						</select>
     						<input class="btn btn-default" type="submit" value="审核"/>
   						</form>
    					</td>
    					
    				</tr>
    				</c:forEach>
    			</table> 
    			<button class="btn btn-default" onclick=" window.history.back()">返回</button>
    	</center>
  </body>
</html>
