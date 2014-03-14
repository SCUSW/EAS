<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'other_finance.jsp' starting page</title>
    
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
  	<div style="text-align:center">
		<form>
		收支标题：<input type="text" name=""/><br/>
   		涉及金额：<input type="text" name=""/><br/>
   		收支类型：
   		<select name="money_type">
   			<option>支出</option>
   			<option>收入</option>
   		</select><br/>
   		描述：<textarea rows="7" cols="48"></textarea><br/>
   		<input type="submit" name="" value="提交"/>
   		</form>
   	</div>
  </body>
</html>
