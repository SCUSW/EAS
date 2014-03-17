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
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	
	<link rel="stylesheet" type="text/css" href="css/body.css">
	
	
	<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/main.js"></script>

  </head>
  
  <body>
    <center>公司收支明细 <br></center>
    <table border="1" class="table table-hover">
    	<tr class="warning">
    		<td >时间</td><td>标题</td><td>金额</td><td>余额</td><td>描述</td>
    	</tr>
    	<c:forEach items="${history_finance }" var="h">
    	<tr class="success">
    		<td>${h.financialTime }&nbsp;</td><td>${h.financialFrom }&nbsp;</td><td>${h.financialNum }&nbsp;</td><td>${h.totalMoney }&nbsp;</td><td>${h.financialRemark }&nbsp;</td>
    	</tr>
    	</c:forEach>
    </table>
    <button class="btn btn-default" onclick="window.location.href('<%=basePath %>totalFinanceAction!totalFinance.action')">返回</button>
  </body>
</html>
