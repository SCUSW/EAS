<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'queryPerformance.jsp' starting page</title>
    
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
   	<center> <h1>查询营销人员绩效信息界面</h1><br/>
   	    <div align="center"><a href="<%=basePath%>marketing!queryAllSalesmanPerformance.action">查询所有营销人员绩效</a></div>
   	    <div align="center"><a href="<%=basePath%>marketing/setSalesmanRoyaltyRate.jsp">设置营销人员提成比例</a></div>
   		<form action="marketing!querySalesmanPerformanceByNo.action" method="post">
   			员工编号：<input type="text" name="queryNo"/><br/>
   			<input type="submit" value="查询"/>
   		</form>
   	</center>
  </body>
</html>
