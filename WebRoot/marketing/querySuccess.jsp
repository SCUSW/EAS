<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'querySuccess.jsp' starting page</title>
    
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
    <center> 
    <table class="table table-hover" border="1">
    	<tr class="warning">
    		<td>编号</td><td>姓名</td><td>性别</td><td>职位</td><td>手机</td><td>QQ</td><td>身份证号</td><td>入职时间</td><td>基本工资</td><td>提成工资</td><td>备注</td>
    	</tr>
    	<c:forEach items="${salesmanInfo}" var="salesman">
    		<tr class="success"> 
    			<td>${salesman.staffInfo.staffNo}</td>
    			<td>${salesman.staffInfo.staffName}</td>
    			<td>${salesman.staffInfo.staffSex}</td>
    			<td>${salesman.staffInfo.positionInfo.vocationName}</td>
    			<td>${salesman.staffInfo.staffPhone}</td>
    			<td>${salesman.staffInfo.staffQq}</td>
    			<td>${salesman.staffInfo.staffIdcard}</td>
    			<td>${salesman.staffInfo.staffEmplTime}</td>
    			<td>${salesman.staffInfo.positionInfo.wageBase}</td>
    			<td>${salesman.salesmanSalary}</td>
    			<td>${salesman.staffsmanRemark}</td>
    		</tr>
    	</c:forEach>
    </table>
    </center>
  </body>
</html>
