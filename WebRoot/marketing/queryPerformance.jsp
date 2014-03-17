<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'queryPerformance.jsp' starting page</title>
    
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
   	<center> <h1></h1><br/>
   	    <div align="center"><a href="<%=basePath%>marketing!queryAllSalesmanPerformance.action">查询所有营销人员效绩</a>
   	    <a href="<%=basePath%>marketing/setSalesmanRoyaltyRate.jsp">设置营销人员提成比例</a></div>
   		<br/>
   		<form action="marketing!querySalesmanPerformanceByNo.action" method="post">
   			<span style="margin-left:-200px;">员工编号：</span><center><input style="width:200px;margin-top:-23px;margin-left:80px;height:30px;" class="form-control" type="text" name="queryNo"/><br/></center>
   		
   		<input style="margin-top:0px;margin-left:0px;font-size:10px;" type="submit" class="btn btn-default" value="搜索"/>
   		</form>
   	</center>
  </body>
</html>
