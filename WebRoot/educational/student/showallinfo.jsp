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
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		td{
			color: fuchsia;
			text-align: center;
			width: 140px;
		}
	
	</style>
  </head>
  
  <body>
    	<center>
    			
    				学生姓名:${stu.studentName}</br>
    				学生学号:${stu.studentNo}</br>
    				学生性别:<%
    				StudentInfo stu = (StudentInfo)request.getAttribute("stu");
    				if(stu.getStudentSex()==1)
    				              out.println("<td>男</td>");
    				           else
    				               out.println("<td>女</td>");          
    				  %></br>
    				 咨询编号:${stu.consultInfo.consultType}</br>
    				余额:${stu.studentBalance}</br>
    				专业:${stu.studentMajor}</br>
    			        学校:${stu.studentSchool}</br>
    				手机号码:${stu.studentPhone}</br>
    				住址:${stu.studentAddr}</br>
    				入学时间:${stu.attendTime}</br>
    				备注:${stu.studentRemark}</br>
    	</center>
  </body>
</html>
