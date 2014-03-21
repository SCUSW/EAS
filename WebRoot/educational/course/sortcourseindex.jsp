<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'sortcourse.jsp' starting page</title>
    
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

	<script type="text/javascript">
	<%if(!com.scusw.util.CheckPrivilege.checkPrivilege(32))
		{
		%>
			$(document).ready(function(){
				$("#jw_32").removeAttr("onclick");
				$("#jw_32").attr("disabled","disabled");
			});
		<%
		}
	%>
	<%if(!com.scusw.util.CheckPrivilege.checkPrivilege(33))
		{
		%>
			$(document).ready(function(){
				$("#jw_33").removeAttr("onclick");
				$("#jw_33").attr("disabled","disabled");
			});
		<%
		}
	%>
	</script>
	
	
  </head>
  
  <body>
  <center>
   
  <button id="jw_32" class="btn btn-default" onclick="window.location.href='educational!addCourseIntoTable.action'"><span class="glyphicon glyphicon-random"></span> 智&nbsp;&nbsp;能&nbsp;&nbsp;排&nbsp;&nbsp;课&nbsp;</button>  <div style="color:red"> ${message}</div>
  <button id="jw_33" class="btn btn-default" onclick="window.location.href='educational/course/queryCourseTable.jsp'"><span class="glyphicon glyphicon-eye-open"></span> 查看教学日历</button>
  </center>z
  </body>
</html>
