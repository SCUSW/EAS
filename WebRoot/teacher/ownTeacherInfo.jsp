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

  </head>
  
  <body> 
  	<table class="table table-hover">
	 	<tr class="success"><td>分支机构：${teacher.staffInfo.positionInfo.departmentInfo.branchInfo.branchName}</td></tr>
	 	<tr class="success"><td>部门：${teacher.staffInfo.positionInfo.departmentInfo.departmentName}</td></tr>
	 	<tr class="success"><td>职位：${teacher.staffInfo.positionInfo.vocationName}</td></tr>
	 	<tr class="success"><td>账号：${teacher.staffInfo.staffNo}</td></tr>
	 	<tr class="success"><td>姓名：${teacher.staffInfo.staffName}</td></tr>
	 	<tr class="success"><td>性别：${teacher.staffInfo.staffSex == 1 ? "男" : "女"}</td></tr>
	 	<tr class="success"><td>专业：${teacher.teacherMajor}</td></tr>
	 	<tr class="success"><td>毕业院校：${teacher.teacherGraduate}</td></tr>
	 	<tr class="success"><td>教师证号：${teacher.teacherNo}</td></tr>
	 	<tr class="success"><td>教师等级：${teacher.teacherLevel.levelName}</td></tr>
	 	<tr class="success"><td>手机：${teacher.staffInfo.staffPhone}</td></tr>
	 	<tr class="success"><td>QQ：${teacher.staffInfo.staffQq}</td></tr>
	 	<tr class="success"><td>聘用时间：${teacher.staffInfo.staffEmplTime}</td></tr>
	 
	 	<tr class="success"><td><button class="btn btn-default" onclick="window.location.href='teacherAct!updateOwnTeacherInfo1.action'"><span class="glyphicon glyphicon-edit"></span> 修改</button></td></tr>
  	</table>
  	<button class="btn btn-default" onclick=" window.history.back()">返回</button>
  </body>
</html>
