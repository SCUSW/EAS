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
    
    <title>My JSP 'updateuser.jsp' starting page</title>
    
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
			var courseName=$("courseName").value;
			var courseStart=$("courseStart").value;
			var courseEnd=$("courseEnd").value;
			var courseTimes=$("courseTimes").value;
			var courseDesc=$("courseDesc").value;
			
			if(isNull(courseName)){
				alert('课程名称不能为空');
				return false;
			}
			if(isNull(courseStart)){
				alert('开课时间不能为空');
				return false;
			}
			if(isNull(courseStart)){
				alert('开课时间不能为空');
				return false;
			}
			if(!isDate(courseStart,"yyyy-MM-dd")){
				alert('开课时间格式不对,请用yyyy-MM-dd格式');
				return false;
			}
			if(isNull(courseEnd)){
				alert('结课时间不能为空');
				return false;
			}
			if(!isDate(courseEnd,"yyyy-MM-dd")){
				alert('结课时间格式不对,请用yyyy-MM-dd格式');
				return false;
			}
			if(isNull(courseTimes)){
				alert('一周课数不能为空');
				return false;
			}
			if(!isNumber(courseTimes)){
				alert('一周课数只能为正整数');
				return false;
			}
			if(isNull(courseDesc)){
				alert('课程介绍不能为空');
				return false;
			}
			else{
				return true;
			}
		}
	</script>
  
  <body>
     <center> <h1>增加课程</h1><br/>
     <div style="width:300px;">
   	<form action="teacherAct!addOwnCourse2.action" method="post">
   		<fieldset>
   		<!-- 
   			<div class="input-group input-group-sm">
 	 			<span class="input-group-addon">专&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;业</span>
				<input name="major.majorId" type="text" class="form-control">
			</div>
		 -->	
			<div class="input-group input-group-sm">
 	 			<span  class="input-group-addon">专&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;业</span>
				<select id="select" name="major.majorId"  class="form-control" >
					<c:forEach items="${majors}" var="m">
						<option value=${m.majorId }>${m.majorName}</option>
					</c:forEach>
     			 </select>
			</div>
			
			<div class="input-group input-group-sm">
 	 			<span class="input-group-addon">名&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称</span>
				<input name="course.courseName" id="courseName" type="text" class="form-control">
			</div>
			
			<div class="input-group input-group-sm">
 	 			<span class="input-group-addon">开课时间</span>
				<input name="course.courseStart" id="courseStart" type="text" class="form-control">
			</div>
			
			<div class="input-group input-group-sm">
 	 			<span class="input-group-addon">结课时间</span>
				<input name="course.courseEnd" id="courseEnd" type="text" class="form-control">
			</div>
			
			<div class="input-group input-group-sm">
 	 			<span class="input-group-addon">一周课数</span>
				<input name="course.courseTimes" id="courseTimes" type="text" class="form-control">
			</div>
			
			<div class="input-group input-group-sm">
				<span class="input-group-addon">课程介绍</span>
				<textarea id="courseDesc" name="course.courseDesc" rows="7" cols="37"></textarea>
			</div><br/>
		<!--	
	   	专业：<input type="text" name="major.majorId"/><br/>
   		名称：<input type="text" name="course.courseName"/><br/>
   		开课时间：<input type="text" name="course.courseStart"/><br/>
   		结课时间：<input type="text" name="course.courseEnd"/><br/>
   		课程介绍：<input type="text" name="course.courseDesc"/><br/>
   		-->
   			<input class="btn btn-default" type="submit" value="确定添加" onclick="return check1()"/>
   		</fieldset>
   </form>
   </div>
   <button class="btn btn-default" onclick=" window.history.back()">返回</button>
   </center>
  </body>
</html>
