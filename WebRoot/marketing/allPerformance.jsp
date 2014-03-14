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
    
    <title>My JSP 'allPerformance.jsp' starting page</title>
    
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
    <center> <h1>所有营销人员绩效界面</h1><br/>
    <table border="1">
    	<tr>
    		<td>编号</td><td>姓名</td><td>性别</td><td>职位</td><td>员工绩效</td><td>提成工资</td>
    	</tr>
    	<c:forEach items="${salesmanInfo}" var="salesman" varStatus="s"> 
    		<tr> 
    			<td>${salesman.staffInfo.staffNo}</td>
    			<td>${salesman.staffInfo.staffName}</td>
    			<td>${salesman.staffInfo.staffSex}</td>
    			<td>${salesman.staffInfo.positionInfo.vocationName}</td>
    			<td>${allSalesmanPerformance[0][s.count-1]}</td>
    			<td>${salesman.salesmanSalary}</td>
    		</tr>
    	</c:forEach>
    </table>

    </center>
  </body>
</html>