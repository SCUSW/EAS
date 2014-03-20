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
    
    <title>My JSP 'ownTeacherInfo.jsp' starting page</title>
    
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
			var coursePrice=$("coursePrice").value;
			if(!isDecimal(coursePrice)){
				alert('价格必须是数字  >_<');
				return false;
			}
			if(coursePrice<0){
				alert('价格不能为负数  >_<');
				return false;
			}
			else{
				return true;
			}
		}
		
		<%if(!com.scusw.util.CheckPrivilege.checkPrivilege(22))
		{
		%>
			$(document).ready(function(){
				$("#js_22").removeAttr("onclick");
				$("#js_22").attr("disabled","disabled");
			});
		<%
		}
	%>
		<%if(!com.scusw.util.CheckPrivilege.checkPrivilege(21))
		{
		%>
			$(document).ready(function(){
				$("#js_21").removeAttr("onclick");
				$("#js_21").attr("disabled","disabled");
			});
		<%
		}
	%>
	</script>
  
  <body> 
  	<table style="text-align:center" class="table table-hover">
 		<tr class="success"><td>专业：${course.majorInfo.majorName}</td></tr>
	 	<tr class="success"><td>名称：${course.courseName}</td></tr>
	 	<tr class="success"><td>开课时间：${course.courseStart}</td></tr>
	 	<tr class="success"><td>结课时间：${course.courseEnd}</td></tr>
	 	<tr class="success"><td>一周课数：${course.courseTimes}</td></tr>
	 	<tr class="success"><td>价格：${course.coursePrice}</td></tr>
	 	<tr class="success"><td>介绍：${course.courseDesc}</td></tr>
	 	
	 	<tr class="success"><td>排课情况：${course.courseAvai == 1 ? "已排" : "未排"}</td></tr>
	 	
	 	<c:choose>
 			<c:when test="${course.courseAvai==1}">
 				<c:forEach items="${courseClasshours}" var="c">
 				<tr class="success"><td>教室：${c.classroomInfo.classroomAddr}<br>
 				课时开始时间：${c.classhourInfo.classhourStart}<br>
 				课时结束时间：${c.classhourInfo.classhourEnd}</td></tr>
 				</c:forEach>
 			</c:when>
 		</c:choose>
	 	
	 	<c:choose>
 			<c:when test="${course.courseAvai==1}">
	 			<tr class="success" style="text-align:center;"><td><button id="js_22" class="btn btn-default" onclick="window.location.href='teacherAct!getCommonTeachingManageList.action?course.courseId=${course.courseId }'"><span class="glyphicon glyphicon-edit"></span> 教学管理</button></td></tr>
	 		</c:when>
 		</c:choose>
	 	
 	 </table>
 	 <center>

	<c:choose>
		<c:when test="${(course.courseAvai==1)&&(course.coursePrice==0)}">
			<form action="teacherAct!updateCommonTeacherCoursePrice.action"
				method="post">
				<input type="hidden" name="course.courseId"
					value="${course.courseId}" />
				<div style="width: 300px;" class="input-group input-group-sm">
					<span class="input-group-addon">设置价格：</span>
					<input id="coursePrice" name="course.coursePrice" type="text" class="form-control">
				</div>
				<input id="js_21" class="btn btn-default" type="submit" value="提交" onclick="return check1()" />
			</form>
		</c:when>
	</c:choose>

    <button class="btn btn-default" onclick=" window.history.back()">返回</button>
  	</center>
  </body>
 	 
</html>
