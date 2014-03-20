<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
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
	<link href="css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/main.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/check.js"></script>
  </head>
<script type="text/javascript" >
$=function(t){
			if(!t)throw "args t can not be null";
			if(typeof t!="string"){
				t=t.toString();
			}
			if(t.charAt(0)=="@"){
					return document.getElementsByName(t);
				}
				return document.getElementById(t);
			
		}
  function check1(){
			var name=$("name").value;
			var teacher=$("teacher").value;
			var major=$("major").value;
			var price=$("price").value;
			var times=$("times").value;
			if(isNull(name)){
				alert("课程名不能为空");
				return false;
			}
			if(isNull(teacher)){
				alert("教师不能为空");
				return false;
			}
			if(isNull(major)){
				alert("专业不能为空");
				return false;
			}
			
			if(!isInteger(price)){
				alert("价格输入有误");
				return false;
			}
			if(!isInteger(times)){
				alert("每周节次必须为整数");
				return false;
			}
			else{
				return true;
			}
		}
	</script>
  <body>
  <center>
    	<form action="educational!updateCourse.action" method="post"> 
    	<input type="hidden" name="course.courseId" value="${course.courseId}"/><br/>
    		<div style="width:300px;">
			   	<div class="input-group input-group-sm">
		 			<span class="input-group-addon">课程名称</span>
					<input name="course.courseName" id="name" value="${course.courseName}" type="text" class="form-control">
				</div>
			</div>
    	
		    <div style="width:300px;">
			   	<div class="input-group input-group-sm">
		 			<span class="input-group-addon">开课老师</span>
					<input name="course.teacherInfo.staffInfo.staffName" id="teacher" value="${course.teacherInfo.staffInfo.staffName}" type="text" class="form-control"><font color="red">${strTeacher}</font>
				</div>
			</div>
			
			<div style="width:300px;">
			   	<div class="input-group input-group-sm">
		 			<span class="input-group-addon">开课专业</span>
					<input name="course.majorInfo.majorName" id="major" value="${course.majorInfo.majorName}" type="text" class="form-control"><font color="red">${strMajor}</font>
				</div>
			</div>
			
			
			<div style="width:300px;">
			   	<div class="input-group input-group-sm">
		 			<span class="input-group-addon">课程价格</span>
					<input name="course.coursePrice" id="price" value="${course.coursePrice}" type="text" class="form-control">
				</div>
			</div>
			
			<div style="width:300px;">
			   	<div class="input-group input-group-sm">
		 			<span class="input-group-addon">每周节次</span>
					<input name="course.courseTimes" id="times" value="${course.courseTimes}" type="text" class="form-control">
				</div>
			</div>
			
			<div style="width:300px;">
			   	<div class="input-group input-group-sm">
		 			<span class="input-group-addon">课程开始日期</span>
					<input type="text" id="startDate" name="course.courseStart" value="<fmt:formatDate value="${course.courseStart}" pattern="yyyy-MM-dd"/> " class="form-control"  data-date-format="yyyy-mm-dd">
				</div>
			</div>
			
			<div style="width:300px;">
			   	<div class="input-group input-group-sm">
		 			<span class="input-group-addon">课程结束日期</span>
					<input type="text" id="endDate" name="course.courseEnd" value="<fmt:formatDate value="${course.courseEnd}" pattern="yyyy-MM-dd"/>" class="form-control"  data-date-format="yyyy-mm-dd">
				</div>
			</div>
			
			<div style="width:300px;">
			   	<div class="input-group input-group-sm">
		 			<span class="input-group-addon">课程介绍</span>
					<input value="${course.courseDesc}" name="course.courseDesc" type="text" class="form-control">
				</div>
			</div>
			
			<input name="course.courseAvai"
				 type="hidden" class="form-control"
				 value="0">
    	
   		
   		<input class="btn btn-default" type="submit" value="提交"/>
   </form>
   <script type="text/javascript" src="js/jquery.js" charset="UTF-8"></script>
			<script type="text/javascript" src="js/bootstrap.min.js"></script>
    		<script type="text/javascript" src="js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
			<script type="text/javascript" src="js/locales/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
    		<script type="text/javascript">
    		$('#startDate').datetimepicker({
    		autoclose:true,
    		todayBtn:true,
    		todayHighlight:true,
    		language:'zh-CN',
    		
    		});
    		$('#endDate').datetimepicker({
    		autoclose:true,
    		todayBtn:true,
    		todayHighlight:true,
    		language:'zh-CN',
    		
    		});
    		</script>
   </center>
  </body>
</html>
