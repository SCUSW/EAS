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
    
    <title>My JSP 'showNotice.jsp' starting page</title>
    
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
    <center> 
    <table border="1" class="table table-hover">
    	<tr class="warning">
    		<td>公告编号</td><td colspan="2">公告标题</td><td>公告类型</td><td>发布人编号</td><td>发布时间</td>
    	</tr>
    	<c:forEach items="${noticeInfo}" var="notice">
    		<tr class="active"> 
    			<td>${notice.noticeId}</td>
    			<td colspan="2">
    				<form id="title" action="student!showNoticeContent.action" method="post">
    					<input type="hidden" name="noticeContent" value="${notice.noticeContent}"/>
    					<a href="javascript:title.submit();">${notice.noticeTitle}</a>
    				</form>
    			</td>
    			<td>${notice.noticeType}</td>
    			<td>${notice.staffInfo.staffId}</td>
    			<td>${notice.noticeTime}</td>
    		</tr>
    	</c:forEach>
    </table>
   </center>
  </body>
</html>
