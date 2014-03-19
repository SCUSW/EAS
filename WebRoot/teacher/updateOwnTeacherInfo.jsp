<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

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

  </head>
  
  <body>
     <center> <h1>修改个人信息</h1><br/>
   	<form action="teacherAct!updateOwnTeacherInfo2.action" method="post">
   		<input type="hidden" name="staff.staffId" value="${teacher.staffId}"/>
   		<span style="margin-left:-200px;">密码：</span><center><input style="width:200px;margin-top:-23px;margin-left:80px;height:30px;" value="" class="form-control" type="password" name="staff.staffPass"/><br/></center>
   		<span style="margin-left:-200px;">手机号码：</span><center><input style="width:200px;margin-top:-23px;margin-left:80px;height:30px;" value="${teacher.staffInfo.staffPhone}" class="form-control" type="text" name="staff.staffPhone"/><br/></center>
   		<span style="margin-left:-200px;">QQ：</span><center><input style="width:200px;margin-top:-23px;margin-left:80px;height:30px;" value="${teacher.staffInfo.staffQq}" class="form-control" type="text" name="staff.staffQq"/><br/></center>
   			<input class="btn btn-default" type="submit" value="确定修改"/>
   </form>
   <button class="btn btn-default" onclick=" window.history.back()">返回</button>
   </center>
  </body>
</html>
