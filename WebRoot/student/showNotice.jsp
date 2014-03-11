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
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <center> <h1>公告信息界面</h1><br/>
    <table border="1">
    	<tr>
    		<td>公告编号</td><td colspan="2">公告标题</td><td>公告类型</td><td>发布人编号</td><td>发布时间</td>
    	</tr>
    	<c:forEach items="${noticeInfo}" var="notice">
    		<tr> 
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
