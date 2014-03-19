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
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	
	<link rel="stylesheet" type="text/css" href="css/body.css">
	
	
	<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/main.js"></script>
	
	

  </head>
  
  <body >
    
    
    
    <!-- list as defined list  -->
    
    <table class="table table-hover">
    	<c:forEach items="${request.privileges}" var="p">
	   	<tr class="warning"><td>权限编号: ${p.privilegeId} &nbsp;&nbsp;&nbsp; 权限名称: ${p.privilegeName}&nbsp;&nbsp;&nbsp;权限描述: ${p.privilegeDesc}</td></tr>
	
	   	</c:forEach>
	</table>
    
    
   
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
