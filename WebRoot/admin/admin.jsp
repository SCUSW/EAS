<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'admin.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
	
	<frameset rows="13%,7%,80%" frameborder="no">
		<frame name="header" src="admin/adminTitle.jsp" noresize="noresize">
		<frame name="menu" src="admin/mainMenu.jsp" noresize="noresize">
		<frameset cols="20%,80%">
		<frame name="left" src="admin/leftOption.jsp" noresize="noresize"">
		<frame name="content" src="admin/manageContent.jsp">
		</frameset>
	</frameset>
	
</html>
