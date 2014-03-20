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
    
    <title>My JSP 'updateBranch.jsp' starting page</title>
    
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
  	<br/><br/>
  	
  	
	<form name="updateDepartment" action="<%=basePath %>departmentManage!updateDepartment2.action" method="post">
	<input type="hidden" name="departmentInfo.departmentAvai" value="${request.departmentInfo.departmentAvai}"/>
	
	<div style="width:300px;">
		<div class="input-group input-group-sm">
 	 			<span class="input-group-addon">部门编号</span>
				<input id="bid" type="text" width="30" disabled="disabled" readonly="readonly" name="departmentInfo.branchId" value="${request.departmentInfo.departmentId }" class="form-control" >
			</div>
	
		</div>
		
	<div style="width:300px;">
		<div class="input-group input-group-sm">
 	 			<span class="input-group-addon">创建时间</span>
				<input id="btime" type="text" width="30" disabled="disabled" readonly="readonly" name="departmentInfo.departmentFoundedTime" value="${request.departmentInfo.departmentFoundedTime }" class="form-control" >
			</div>
	
		</div>	
	
	<div style="width:300px;">
		<div class="input-group input-group-sm">
 	 			<span class="input-group-addon">部门名称</span>
				<input id="name" type="text" width="30" name="departmentInfo.departmentName" value="${request.departmentInfo.departmentName }" class="form-control" >
			</div>
		
		</div>
		
	<div style="width:300px;">
		<div class="input-group input-group-sm">
 	 			<span class="input-group-addon">分支机构</span>
				<select class="form-control" name="departmentInfo.branchInfo.branchId">
				<c:forEach items="${request.branchs}" var="b">
					<option value="${b.branchId}" ${departmentInfo.branchInfo.branchId eq b.branchId?"selected":"" } >${b.branchId}:${b.branchName}</option>
				</c:forEach>
			</select>
			</div>
		</div>		
	
	<div style="width:300px;">
		<div class="input-group input-group-sm">
 	 			<span class="input-group-addon">部门简介</span>
				<textarea class="form-control" name="departmentInfo.departmentIntr" rows="10" cols="30" >${request.departmentInfo.departmentIntr }</textarea>
			</div>
		</div>		
	
	
	<input class="btn btn-default" type="button" name="sub" value="提交修改" onclick="check()" />
	</form>	
	
	 <script type="text/javascript">
	    function check(){
	    	if(updateDepartment.name.value==""){
	    		alert("请输入分支机构名称！");
	    		addDepartment.name.focus();
	    		return;
	    	}else{
	    		updateDepartment.submit();
	    	}
	    }
    </script>
	
	

	</center>
	</body>
</html>
