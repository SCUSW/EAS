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
    
    <title>My JSP 'stafffees_history.jsp' starting page</title>
    
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
    员工收支明细 <br>
    <table border="1" class="table table-hover">
    	<tr class="warning">
    		<td>时间</td><td>员工编号</td><td>员工姓名</td><td>金额</td><td>描述</td>
    	</tr>
    	<c:forEach items="${stafffees_history }" var="h">
    	<tr class="success">
    		<td>${h.sfeesTime }&nbsp;</td><td>${h.staffInfo.staffNo }&nbsp;</td><td>${h.staffInfo.staffName }&nbsp;</td><td>${h.sfeesNum }&nbsp;</td><td>${h.sfeesFrom }&nbsp;</td>
    	</tr>
    	</c:forEach>
    </table>
    <button class="btn btn-default" onclick="window.location.href='<%=basePath %>staffFinanceAction!searchAll.action'">返回</button>
  </body>
</html>
