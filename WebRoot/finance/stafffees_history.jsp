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
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    员工收支明细 <br>
    <table border="1">
    	<tr>
    		<td>时间</td><td>员工编号</td><td>员工姓名</td><td>金额</td><td>描述</td>
    	</tr>
    	<c:forEach items="${stafffees_history }" var="h">
    	<tr>
    		<td>${h.sfeesTime }&nbsp;</td><td>${h.staffInfo.staffNo }&nbsp;</td><td>${h.staffInfo.staffName }&nbsp;</td><td>${h.sfeesNum }&nbsp;</td><td>${h.sfeesFrom }&nbsp;</td>
    	</tr>
    	</c:forEach>
    </table>
    <button onclick="window.location.href('<%=basePath %>staffFinanceAction!searchAll.action')">返回</button>
  </body>
</html>
