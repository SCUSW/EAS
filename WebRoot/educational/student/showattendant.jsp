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
    
    <title>My JSP 'adduser.jsp' starting page</title>
    
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
   <center> <h1>确认考勤</h1><br/>
   <form action="educational!updateAttendant.action" method="post">
        <input type="hidden" name="attendant.attendantId" value="${attendant.attendantId}"/>
   		<input type="hidden" name="attendant.registerInfo.registerId" value="${attendant.registerInfo.registerId}">
   		缺课时间：<input readonly="readonly" type="text" name="attendant.attendantTime" value="${attendant.attendantTime}"/>（不能修改）<br/>
   		<select name="attendant.attendantRemark">
             <option value="情况属实确认录入">情况属实确认录入
             <option value="情况有误撤销考勤表">情况有误撤销考勤表
                </select><p>
   			<input type="submit" value="提交"/>
   		</form>
   </center>
  </body>
</html>
