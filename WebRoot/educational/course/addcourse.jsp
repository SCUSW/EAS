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
    
    <title>My JSP 'addteacher.jsp' starting page</title>
    
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
    <script type="text/javascript" src="<%=basePath%>../check.js"></script>
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
			var teacher=$("times").value;
			var startDate=$("startDate").value;
			var endDate=$("endDate").value;
			if(isNull(name)){
				alert('课程名不能为空');
				return false;
			}
			if(isNull(teacher))
				alert('开课老师不能为空');
				return false;
			}
			if(!isNull(major)){
				alert('专业不能为空');
				return false;
			}
			if(!isInteger(times)){
				alert('每周节次必为整数');
				return false;
			}
			else{
				return true;
			}
		
	</script>
  
  <body>
   <center> <h1>添加课程信息</h1><br/>
   	<form action="educational!addCourse.action" method="post">    
   	<div style="width:300px;">
	   	<div class="input-group input-group-sm">
 			<span class="input-group-addon">课程名称</span>
			<input name="course.courseName" type="text" id="name" class="form-control" value="${course.courseName}">
		</div>
	</div>
	
	<div style="width:300px;">
	   	<div class="input-group input-group-sm">
 			<span class="input-group-addon">开课老师</span>
			<input name="course.teacherInfo.staffInfo.staffName" id="teacher" type="text" class="form-control" value="${course.teacherInfo.staffInfo.staffName}"><font color="red">${strTeacher}</font>
		</div>
	</div>
	
	<div style="width:300px;">
	   	<div class="input-group input-group-sm">
 			<span class="input-group-addon">开课专业</span>
			<input name="course.majorInfo.majorName" id="major" type="text" class="form-control" value="${course.majorInfo.majorName}"><font color="red">${strMajor}</font>
		</div>
	</div>
	
	
	<div style="width:300px;">
	   	<div class="input-group input-group-sm">
 			<span class="input-group-addon">课程价格</span>
			<input name="course.coursePrice" id="price" type="text" class="form-control" value="${course.coursePrice}">
		</div>
	</div>
	
	<div style="width:300px;">
	   	<div class="input-group input-group-sm">
 			<span class="input-group-addon">每周节次</span>
			<input name="course.courseTimes" id="times" type="text" class="form-control" value="${course.courseTimes}">
		</div>
	</div>
	
	<div style="width:300px;">
	   	<div class="input-group input-group-sm">
 			<span class="input-group-addon">课程开始日期</span>
			<input type="text" id="startDate" name="course.courseStart" class="form-control" value="2014-03-20" data-date-format="yyyy-mm-dd">
		</div>
	</div>
	
	<div style="width:300px;">
	   	<div class="input-group input-group-sm">
 			<span class="input-group-addon">课程结束日期</span>
			<input type="text" id="endDate" name="course.courseEnd" class="form-control" value="2014-03-20" data-date-format="yyyy-mm-dd">
		</div>
	</div>
	
	<div style="width:300px;">
	   	<div class="input-group input-group-sm">
 			<span class="input-group-addon">课程介绍</span>
			<input name="course.courseDesc" type="text" class="form-control" value="${course.courseDesc}">
		</div>
	</div>
	
		
	<input name="course.courseAvai"
				 type="hidden" class="form-control"
				 value="0">
				 
	<input class="btn btn-default" type="submit" value="确定添加" onclick="return check1()"/>
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
   <!-- <button class="btn btn-default" onclick="windon.location.href='educational/course/querycourseinfo.jsp'"><span class="glyphicon glyphicon-repeat"></span> 返回查询界面</button> -->
   </center>
  </body>
</html>
