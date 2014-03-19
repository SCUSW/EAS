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
    
    <title>My JSP 'updatecourse.jsp' starting page</title>
    
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
    	<form action="educational!updateCourse.action" method="post"> 
    	<input type="hidden" name="course.courseId" value="${course.courseId}"/><br/>
    		<div style="width:300px;">
			   	<div class="input-group input-group-sm">
		 			<span class="input-group-addon">课程名称</span>
					<input name="course.courseName" value="${course.courseName}" type="text" class="form-control">
				</div>
			</div>
    	
		    <div style="width:300px;">
			   	<div class="input-group input-group-sm">
		 			<span class="input-group-addon">开课老师</span>
					<input name="course.teacherInfo.staffInfo.staffName" value="${course.teacherInfo.staffInfo.staffName}" type="text" class="form-control"><font color="red">${strTeacher}</font>
				</div>
			</div>
			
			<div style="width:300px;">
			   	<div class="input-group input-group-sm">
		 			<span class="input-group-addon">开课专业</span>
					<input name="course.majorInfo.majorName" value="${course.majorInfo.majorName}" type="text" class="form-control"><font color="red">${strTeacher}</font>
				</div>
			</div>
			
			
			<div style="width:300px;">
			   	<div class="input-group input-group-sm">
		 			<span class="input-group-addon">课程价格</span>
					<input name="course.coursePrice" value="${course.coursePrice}" type="text" class="form-control">
				</div>
			</div>
			
			<div style="width:300px;">
			   	<div class="input-group input-group-sm">
		 			<span class="input-group-addon">每周节次</span>
					<input name="course.courseTimes" value="${course.courseTimes}" type="text" class="form-control">
				</div>
			</div>
			
			<div style="width:300px;">
			   	<div class="input-group input-group-sm">
		 			<span class="input-group-addon">课程开始日期</span>
					<input name="course.courseStart" value="${course.courseStart}" type="text" class="form-control">
				</div>
			</div>
			
			<div style="width:300px;">
			   	<div class="input-group input-group-sm">
		 			<span class="input-group-addon">课程结束日期</span>
					<input name="course.courseEnd" value="${course.courseEnd}" type="text" class="form-control">
				</div>
			</div>
			
			<div style="width:300px;">
			   	<div class="input-group input-group-sm">
		 			<span class="input-group-addon">课程介绍</span>
					<input value="${course.courseDesc}" name="course.courseDesc" type="text" class="form-control">
				</div>
			</div>
			
			<div style="width:300px;">
			   	<div class="input-group input-group-sm">
		 			<span class="input-group-addon">课程有效性</span>
					<select name="course.courseAvai" class="form-control">
						<option value="${course.courseAvai}">${course.courseAvai}</option>
						<option value="1">有效 </option>  	
		                <option value="0">无效</option>
					</select>
				</div>
			</div>
    	
   		
   		<input class="btn btn-default" type="submit" value="提交"/>
   </form>
  </body>
</html>
