<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'showallinfo.jsp' starting page</title>
    
	 
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
  	<table class="table table-hover">
  		<tr class="success"><td> 姓名：${teacher.staffInfo.staffName}</td></tr>
   		<tr class="success"><td>性别：${teacher.staffInfo.staffSex==1 ? "男" : "女"}</td></tr>
   		<tr class="success"><td>手机：${teacher.staffInfo.staffPhone}</td></tr>
   		<tr class="success"><td>Q Q ：${ teacher.staffInfo.staffQq}</td></tr>
   		<tr class="success"><td>省份证号：${teacher.staffInfo.staffIdcard}</td></tr>
   		<tr class="success"><td>聘用时间:${teacher.staffInfo.staffEmplTime}</td></tr>
   		<tr class="success"><td>其他信息${teacher.staffInfo.staffOthers}</td></tr>
   		<tr class="success"><td>专       业:${teacher.teacherMajor}</td></tr>
   		<tr class="success"><td>教师编号:${teacher.teacherNo}</td></tr>
   		<tr class="success"><td>教师院校:${teacher.teacherGraduate}</td></tr>
   		<tr class="success"><td>教师工资:${teacher.teacherSalary}</td></tr>
   		<tr class="success"><td>教师等级:${teacher.teacherLevel.levelName}</td></tr>
   		<tr class="success"><td>职类名称:${teacher.staffInfo.positionInfo.vocationName}</td></tr>
   		<tr class="success"><td>课时费：${teacher.teacherLevel.classCost}</td></tr>
   		<tr class="success"><td>基本课时:${teacher.teacherLevel.baseClassHour}</td></tr>
   		<tr class="success"><td>教师类别:${teacher.teacherType}</td></tr>
   		<tr class="success"><td>备   注:${teacher.teacherRemark}</td></tr>
   	</table>
   	<a href="educational/teacher/queryteacher.jsp">返回查询界面</a>
   </center>
  </body>
</html>
