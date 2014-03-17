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
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	
	<link rel="stylesheet" type="text/css" href="css/body.css">
	
	
	<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/main.js"></script>

  </head>
  
  <body>
  	<div style="text-align:center">
		<form>
		<br/><br/><br/><br/>
		<span style="margin-left:-200px;">收支标题：</span><center><input style="width:200px;margin-top:-23px;margin-left:80px;height:25px;" class="form-control" type="text" name=""/><br/></center>
   		<span style="margin-left:-200px;">涉及金额：</span><center><input style="width:200px;margin-top:-23px;margin-left:80px;height:25px;" class="form-control" type="text" name=""/><br/></center>
   		收支类型：
   		<select name="money_type">
   			<option>支出</option>
   			<option>收入</option>
   		</select>
   		<br/><br/>
   		描述：<textarea rows="7" cols="48"></textarea><br/><br/>
   		<input type="submit" name="" class="btn btn-default" value="提交"/>
   		</form>
   	</div>
  </body>
</html>
