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
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

	<style type="text/css">
	div#updatedep {
	text-align:left;
	background-color:#ffff99;
	}
	h2 {margin-bottom:0; font-size:14px;}
	ul {margin:0;}
	li {list-style:none;margin-top: 5px;}
	a {text-decoration:none;}
	</style>

  </head>
  
  <body>
  
  	<div id="updatedep">
  	
	<form name="updateDepartment" action="<%=basePath %>departmentManage!updateDepartment2.action" method="post">
	<input type="hidden" name="departmentInfo.departmentAvai" value="${request.departmentInfo.departmentAvai}"/>
	部门编号：<input id="bid" type="text" width="30" readonly="readonly" name="departmentInfo.branchId" value="${request.departmentInfo.departmentId }"/><br/>
	创建时间：<input id="btime" type="text" width="30" readonly="readonly" name="departmentInfo.departmentFoundedTime" value="${request.departmentInfo.departmentFoundedTime }"/><br/>
	部门名称：<input id="name" type="text" width="30" name="departmentInfo.departmentName" value="${request.departmentInfo.departmentName }"/><br/>
	
	分支机构：<select name="departmentInfo.branchInfo.branchId">
				<option value="${request.departmentInfo.branchInfo.branchId}" selected="selected">${request.departmentInfo.branchInfo.branchId}:${request.departmentInfo.branchInfo.branchName}</option>
			<c:forEach items="${request.branchs}" var="b">
				<option value="${b.branchId}">${b.branchId}:${b.branchName}</option>
			</c:forEach>
			</select>
	<br/>
	
	部门简介：<textarea name="departmentInfo.departmentIntr" rows="10" cols="30" >${request.departmentInfo.departmentIntr }</textarea><br/>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="button" name="sub" value="提交修改" onclick="check()" />
	
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
	
	
	</div>
	
	</body>
</html>
