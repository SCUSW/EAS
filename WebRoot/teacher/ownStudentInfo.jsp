<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

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
			var studentCourseScore=$("studentCourseScore").value;
			if(!isDecimal(studentCourseScore)){
				alert('分数必须是数字  >_<');
				return false;
			}
			if(studentCourseScore<0){
				alert('分数不能为负数  >_<');
				return false;
			}
			else{
				return true;
			}
		}
		
		<%if(!com.scusw.util.CheckPrivilege.checkPrivilege(12))
		{
		%>
			$(document).ready(function(){
				$("#js_12").removeAttr("onclick");
				$("#js_12").attr("disabled","disabled");
			});
		<%
		}
	%>
	
	<%if(!com.scusw.util.CheckPrivilege.checkPrivilege(13))
		{
		%>
			$(document).ready(function(){
				$("#js_13").removeAttr("onclick");
				$("#js_13").attr("disabled","disabled");
			});
		<%
		}
	%>
	</script>
  
  <body> 
  <table style="text-align:center" class="table table-hover">
  	<tr class="success"><td>课程：${course.courseName}</td></tr>
  	<tr class="success"><td>分数：${register.studentCourseScore}</td></tr>
 	<tr class="success"><td>分支机构：${student.classInfo.gradeInfo.branchInfo.branchName}</td></tr>
 	<tr class="success"><td>年级：${student.classInfo.gradeInfo.gradeName}</td></tr>
 	<tr class="success"><td>班级：${student.classInfo.className}</td></tr>
 	<tr class="success"><td>学号：${student.studentNo}</td></tr>
 	<tr class="success"><td>姓名：${student.studentName}</td></tr>
 	<tr class="success"><td>性别：${student.studentSex == 1 ? "男" : "女"}</td></tr>
 	<tr class="success"><td>学籍状态：${student.rollState.rollstateName}</td></tr>
 	<tr class="success"><td>年龄：${student.studentAge}</td></tr>
 	<tr class="success"><td>地址：${student.studentAddr}</td></tr>
 	<tr class="success"><td>电话号码：${student.studentPhone }</td></tr>
 	<tr class="success"><td>院校：${student.studentSchool}</td></tr>
 	<tr class="success"><td>专业：${student.studentMajor}</td></tr>
 	<tr class="success"><td>入校时间：${student.attendTime}</td></tr>
 	<tr class="success"><td>
 	 <form action="teacherAct!updateStudentCourseScore.action" method="post">  		
 	 <input type="hidden" name="register.registerId" value="${register.registerId}"/>
 	 <input type="hidden" name="student.studentNo" value="${student.studentNo}"/>
 	 <input type="hidden" name="course.courseId" value="${course.courseId}"/>	
   	 评分：<input type="text" id="studentCourseScore" name="register.studentCourseScore"/>
    <input id="js_12" class="btn btn-default" type="submit" value="提交" onclick="return check1()"/>
    		</form>
    	</td></tr>	
    <tr class="success"><td><button id="js_13" class="btn btn-default" onclick="window.location.href='teacherAct!getStudentAttendant.action?register.registerId=${register.registerId}'"><span class="glyphicon glyphicon-list-alt"></span> 考勤情况</button></td></tr> 
  </table>
  <center><button class="btn btn-default" onclick=" window.history.back()">返回</button></center>
  </body>
</html>
