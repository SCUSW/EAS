<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'finance_guide.jsp' starting page</title>
    
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
    <div style="text-align: center">
    	<a target="info_area" href="<%=basePath %>totalFinanceAction!totalFinance.action">总费用管理</a>
    	<a target="info_area" href="<%=basePath %>studentFinanceAction!searchAll.action">学员费用管理</a>
    	<a target="info_area" href="<%=basePath %>teacherFinanceAction!searchAll.action">教师费用管理</a>
    	<!--<a target="info_area" href="<%=basePath %>finance/other_finance.jsp">其他费用管理</a>
    --></div>
  </body>
</html>
