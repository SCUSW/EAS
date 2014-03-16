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
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<style type="text/css">
	div#adddep {
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
  
  	<div id="adddep">
  	
	<form name="addDepartment" action="<%=basePath %>departmentManage!addDepartment.action" method="post">
	
	部门名称：<input id="name" type="text" width="30" name="departmentInfo.departmentName"/><br/>
	分支机构：<select name="departmentInfo.branchInfo.branchId">
			<c:forEach items="${request.branchs}" var="b">
				<option value="${b.branchId}">${b.branchId}:${b.branchName}</option>
			</c:forEach>
			</select>
	<br/>
	部门简介：<textarea name="departmentInfo.departmentIntr" rows="10" cols="30"></textarea><br/>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="button" name="sub" value="确定添加" onclick="check()" />
	
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
	
	
	</div>
	
	</body>
</html>