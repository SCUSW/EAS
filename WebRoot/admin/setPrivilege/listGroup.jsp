<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'listGroup.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<style type="text/css">
	div#listgro {
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
    
    <div id="listgro">


	<table border="1px">
	<thead>
		<tr>
			<th>权限组编号</th>
			<th>权限组名称</th>
			<th>管理权限组</th>
		</tr>
	</thead>
	<tbody>
    	<c:forEach items="${request.groups}" var="g">
    	</tr>
    	<td align="center">${g.groupId}</td><td align="center">${g.groupName}</td>
    	<td align="center"><a href="<%=basePath %>privilegeManage!updateGroup1.action?groupInfo.groupId=${g.groupId}">编辑</a>&nbsp;&nbsp;<a href="<%=basePath %>privilegeManage!delGroup.action?groupInfo.groupId=${g.groupId}">删除</a></td>
	   	</tr>
<!-- 	
		<tr>
	   	<td colspan="3">拥有权限: </td>
	   	</tr> 
-->
	   	<tr>
	   	<td colspan="3">权限组说明: ${g.groupRemark}</td>
	   	</tr>
	   	</c:forEach>
	</tbody>
	</table> 
	</div>
	
  </body>
</html>
