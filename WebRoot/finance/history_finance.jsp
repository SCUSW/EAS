<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'history_finance.jsp' starting page</title>
    
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
    收支明细 <br>
    <table border="1">
    	<tr>
    		<td>时间</td><td>标题</td><td>金额</td><td>余额</td><td>描述</td>
    	</tr>
    	<c:forEach items="${history_finance }" var="h">
    	<tr>
    		<td>${h.financialTime }</td><td>${h.financialFrom }</td><td>${h.financialNum }</td><td>${h.totalMoney }</td><td>${h.financialRemark }</td>
    	</tr>
    	</c:forEach>
    </table>
    <button onclick="window.location.href('<%=basePath %>totalFinanceAction!totalFinance.action')">返回</button>
  </body>
</html>
