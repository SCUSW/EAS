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
    
    <title>My JSP 'listPrivilege.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<style type="text/css">
	div#listpri {
	text-align:left;
	background-color:#ffff99;
	}
	h2 {margin-bottom:0; font-size:14px;}
	ul {margin:0;}
	li {list-style:none;margin-top: 5px;}
	a {text-decoration:none;}
	</style>

  </head>
  
  <body bgcolor="#ffff99">
    
    <div id="listpri">
    
    <!-- list as defined list  -->
    
    <dl>
    	<c:forEach items="${request.privileges}" var="p">
	   	<dt>权限编号: ${p.privilegeId} &nbsp;&nbsp;&nbsp; 权限名称: ${p.privilegeName}</dt>
	   	<dd>权限描述: ${p.privilegeDesc}</dd>
		<br/>
	   	</c:forEach>
	</dl>
    
    
   
	<%-- list as table
	<table border="1px">
	<thead>
		<tr>
			<th>权限编号</th>
			<th>权限名称</th>
			<th>权限描述</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${privileges}" var="p">
 			<tr> 
 				<td>${p.privilegeId}</td><td>${p.privilegeName}</td><td>${p.privilegeDesc}</td>
 			</tr>
    	</c:forEach>
	</tbody>
	</table> 
	--%>
	
	</div>
    

  </body>
</html>
