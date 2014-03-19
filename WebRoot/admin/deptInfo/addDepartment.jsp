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
    
    <title>My JSP 'addGroup.jsp' starting page</title>
    
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
  	<br/>
  	
	<form name="addDepartment" action="<%=basePath %>departmentManage!addDepartment.action" method="post">
	
	
	
	<div style="width:300px;">
		<div class="input-group input-group-sm">
 	 			<span class="input-group-addon">部门名称</span>
				<input id="name" name="departmentInfo.departmentName" type="text" class="form-control" >
			</div>
		</div>
	
	<div style="width:300px;">
		<div class="input-group input-group-sm">
 	 			<span class="input-group-addon">分支机构</span>
				<select class="form-control" name="departmentInfo.branchInfo.branchId">
					<c:forEach items="${request.branchs}" var="b">
						<option value="${b.branchId}">${b.branchId}:${b.branchName}</option>
					</c:forEach>
				</select>
			</div>
	</div>
	
	<div style="width:300px;">
		<div class="input-group input-group-sm">
 	 			<span class="input-group-addon">部门简介</span>
				<textarea class="form-control" name="departmentInfo.departmentIntr" rows="10" cols="30"></textarea>
			</div>
		</div>
	
	<input name="sub" class="btn btn-default" type="button" value="确认" onclick="check()">
	
	
	</form>	
	
	 <script type="text/javascript">
	    function check(){
	    	if(addDepartment.name.value==""){
	    		alert("请输入分支机构名称！");
	    		addDepartment.name.focus();
	    		return;
	    	}else{
	    		addDepartment.submit();
	    	}
	    }
    </script>
	
	
	</center>
	</body>
</html>