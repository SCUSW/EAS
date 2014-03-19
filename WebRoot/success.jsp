<%@page import="com.scusw.util.CheckPrivilege"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'success.jsp' starting page</title>
    
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
    This is my JSP page. <br>
    ${session.role }<br>
    ${session.type }<br>
    ${session.staffName }<br>
    ${session.group }<br>
    <s:debug></s:debug>
    以下代码进行权限检测：<br>
    <%
    if(com.scusw.util.CheckPrivilege.checkPrivilege(1)){
    	%>拥有权限1<%
    } 
    %>
    <%
    if(com.scusw.util.CheckPrivilege.checkPrivilege(2)){
    	%>拥有权限2<%
    } 
    %>
    <%
    if(com.scusw.util.CheckPrivilege.checkPrivilege(3)){
    	%>拥有权限3<%
    } 
    %>
  </body>
</html>
