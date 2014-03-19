<%@ page language="java" import="java.util.*,com.scusw.model.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'userlist.jsp' starting page</title>
    
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
    				<tr class="success"><td>学生姓名:${stu.studentName}</td></tr>
    				<tr class="success"><td>学生学号:${stu.studentNo}</td></tr>
    				<tr class="success"><td>学生性别:<%
    				StudentInfo stu = (StudentInfo)request.getAttribute("stu");
    				if(stu.getStudentSex()==1)
    				              out.println("男");
    				           else
    				               out.println("女");          
    				  %></td></tr>
    				<tr class="success"><td> 咨询编号:${stu.consultInfo.consultType}</td></tr>
    				<tr class="success"><td>余额:${stu.studentBalance}</td></tr>
    				<tr class="success"><td>专业:${stu.studentMajor}</td></tr>
    			      <tr class="success"><td>  学校:${stu.studentSchool}</td></tr>
    				<tr class="success"><td>手机号码:${stu.studentPhone}</td></tr>
    				<tr class="success"><td>住址:${stu.studentAddr}</td></tr>
    				<tr class="success"><td>入学时间:${stu.attendTime}</td></tr>
    				<tr class="success"><td>备注:${stu.studentRemark}</td></tr>
    		</table>
    	</center>
  </body>
</html>
