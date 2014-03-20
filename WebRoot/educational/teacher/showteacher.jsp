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
    
    <title>...</title>
    
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
  
  	<script type="text/javascript">
	<%if(!com.scusw.util.CheckPrivilege.checkPrivilege(25))
		{
		%>
			$(document).ready(function(){
				$("#jw_25").removeAttr("onclick");
				$("#jw_25").attr("disabled","disabled");
			});
		<%
		}
	%>
	<%if(!com.scusw.util.CheckPrivilege.checkPrivilege(26))
		{
		%>
			$(document).ready(function(){
				$("#jw_26").removeAttr("onclick");
				$("#jw_26").attr("disabled","disabled");
			});
		<%
		}
	%>
	
	<%if(!com.scusw.util.CheckPrivilege.checkPrivilege(27))
		{
		%>
			$(document).ready(function(){
				$("#jw_27").removeAttr("onclick");
				$("#jw_27").attr("disabled","disabled");
			});
		<%
		}
	%>
	</script>
  
  </head>
  
  <body>
    	<center>
    	<span style="color: red">${message}</span>
    			<table class="table table-hover" border="1">
    			
    				<tr class="warning">
    					<td>教师姓名</td><td>教师编号</td><td colspan="3">操作</td>
    				</tr>
    				<c:forEach items="${teachers}" var="t">
    				<tr class="success"> 
    					<td>${t.staffInfo.staffName}</td><td>${t.teacherNo}</td>
    					<td><button id="jw_25" class="btn btn-default" onclick="window.location.href='educational!showAllTeacherInfo.action?teacher.teacherNo=${t.teacherNo}'"><span class="glyphicon glyphicon-eye-open"></span> 教师基本信息</button></td>
    					<td><button id="jw_26" class="btn btn-default" onclick="window.location.href='educational!queryCourse.action?teacher.teacherNo=${t.teacherNo}'"><span class="glyphicon glyphicon-eye-open"></span> 课程查看</button></td>
    					<td><button id="jw_27" class="btn btn-default" onclick="window.location.href='educational!addSalary.action?teacher.teacherNo=${t.teacherNo}'"><span class="glyphicon glyphicon-ok-sign"></span> 工资清单确认</button></td>
    				</tr>
    				</c:forEach>
    				<tr class="active "><td colspan="7"><button class="btn btn-default" onclick="window.location.href='educational!queryGroupAndLevel.action?'"><span class="glyphicon glyphicon-plus"></span> 添加</button></td></tr>
    			</table>
    			<button class="btn btn-default" onclick="window.location.href='educational/teacher/queryteacher.jsp'"><span class="glyphicon glyphicon-repeat"></span>返回查询界面</button>
    	</center>
  </body>
</html>
