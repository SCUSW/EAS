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
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <center> <h1>营销人员绩效界面</h1><br/>
    <table border="1">
    	<tr>
    		<td>编号</td><td>姓名</td><td>性别</td><td>职位</td><td>基本工资</td><td>员工效绩</td><td>提成工资</td>
    	</tr>
    		<tr> 
    			<td>${salesmanInfo.staffInfo.staffNo}</td>
    			<td>${salesmanInfo.staffInfo.staffName}</td>
    			<td>${salesmanInfo.staffInfo.staffSex}</td>
    			<td>${salesmanInfo.staffInfo.positionInfo.vocationName}</td>
    			<td>${salesmanInfo.staffInfo.positionInfo.wageBase}</td>
    			<td>${salesmanPerformance}</td>
    			<td>${salesmanInfo.salesmanSalary}</td>
    		</tr>
    </table>
    </center>
  </body>
</html>
