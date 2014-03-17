<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'performance.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	
	
	<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/main.js"></script>

  </head>
  
  <body>
    <table class="table table-hover" border="1">
    	<tr class="warning">
    		<td>编号</td><td>姓名</td><td>性别</td><td>职位</td><td>员工效绩</td><td>提成工资</td>
    	</tr>
  		<tr class="success"> 
  			<td>${salesmanInfo.staffInfo.staffNo}</td>
  			<td>${salesmanInfo.staffInfo.staffName}</td>
  			<td>${salesmanInfo.staffInfo.staffSex}</td>
  			<td>${salesmanInfo.staffInfo.positionInfo.vocationName}</td>
  			<td>${allSalesmanPerformance[0][0]}</td>
  			<td>${salesmanInfo.salesmanSalary}</td>
  		</tr>
    </table>
  </body>
</html>
