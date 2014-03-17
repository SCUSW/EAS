<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'teacher_finance.jsp' starting page</title>
    
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
  <div style="text-align: center">
    <form action="teacherFinanceAction!searchTeacher.action" method="post">
   		
   			<span style="margin-left:-200px;">教师名称：</span><center><input style="width:200px;margin-top:-23px;margin-left:80px;height:30px;" class="form-control" type="text" name="teacherInfo.staffInfo.staffName"/><br/></center>
   		
   		<input style="margin-top:0px;margin-left:0px;font-size:10px;" type="submit" class="btn btn-default" value="搜索"/>
   		</form>
   	
   	<table class="table table-hover" border="1">
   		<tr class="warning">
   			<td>姓名</td><td>职位</td><td>应付工资</td><td>已付工资</td><td>操作</td>
   		</tr>
   		<c:forEach items="${teacher_list}" var="t">
   		<tr class="success">
   			<td>${t.staffInfo.staffName }</td><td>${t.teacherLevel.levelName }</td><td>${t.teacherSalary }</td><td>2650</td><td><input type="button" value="支付工资"/>
   		</tr>
   		</c:forEach>
   	</table>
   	</div>
  </body>
</html>
