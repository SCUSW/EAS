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
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	
	<link rel="stylesheet" type="text/css" href="css/body.css">
	
	
	<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/main.js"></script>
	
	
  </head>
  
  <body >
    
    <div id="listgro">


	<table class="table table-hover" border="1px">
	<thead>
		<tr class="warning">
			<th>权限组编号</th>
			<th>权限组名称</th>
			<th>管理权限组</th>
		</tr>
	</thead>
	<tbody>
    	<c:forEach items="${request.groups}" var="g">
    	<tr class="success">
    	<td align="center">${g.groupId}</td><td align="center">${g.groupName}</td>
    	<td align="center"><button class="btn btn-default" onclick="window.location.href='<%=basePath %>privilegeManage!updateGroup1.action?groupInfo.groupId=${g.groupId}'"><span class="glyphicon glyphicon-edit"></span> 编辑</button>
    						<button class="btn btn-default" onclick="window.location.href='<%=basePath %>privilegeManage!delGroup.action?groupInfo.groupId=${g.groupId}'"><span class="glyphicon glyphicon-remove"></span>删除</button></td>
	   	</tr>
<!-- 	
		<tr>
	   	<td colspan="3">拥有权限: </td>
	   	</tr> 
-->
	   	<tr class="active">
	   	<td colspan="3">权限组说明: ${g.groupRemark}</td>
	   	</tr>
	   	</c:forEach>
	</tbody>
	</table> 
	</div>
	
  </body>
</html>
