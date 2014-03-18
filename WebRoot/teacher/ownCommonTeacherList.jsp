<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'commonTeacherList.jsp' starting page</title>
    
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
    					<td>员工号</td><td>姓名</td><td>操作</td>
    				</tr>
    				<c:forEach items="${ownCommonTeachers}" var="t">
    				<tr class="success"> 
    					<td>${t.staffInfo.staffNo}</td>
    					<td>${t.staffInfo.staffName}</td>
    					<td><a href="teacherAct!getOwnCommonTeacherInfo.action?staff.staffId=${t.staffInfo.staffId}"><span class="glyphicon glyphicon-eye-open	"></span> 查看</a></td>
    				</tr>
    				</c:forEach>
    				<tr class="success"><td style="text-align:center;" colspan="3"><button class="btn btn-default" onclick="window.location.href='teacherAct!addCommonTeacher1'"><span class="glyphicon glyphicon-plus"></span> 增加任课教师 </button></td></tr>
    			</table>
    		<button class="btn btn-default" onclick=" window.history.back()">返回</button>
    	</center>
  </body>
</html>
