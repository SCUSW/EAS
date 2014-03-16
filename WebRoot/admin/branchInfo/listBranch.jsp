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
    
    <title>My JSP 'listPrivilege.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<style type="text/css">
	div#listbra {
	text-align:left;
	background-color:#ffff99;
	}
	h2 {margin-bottom:0; font-size:14px;}
	ul {margin:0;}
	li {list-style:none;margin-top: 5px;}
	a {text-decoration:none;}
	</style>

  </head>
  
  <body bgcolor="#ffff99">
    
    <div id="listbra">

    <form id="searchBranch" name="searchBranch" method="post" action="<%=basePath %>branchManage!searchBranch.action">
    关键字查询: 
    <input type="text" name="keyword" id="keyword" value="${request.keyword}" onfocus="javascript:if(this.value=='请输入关键字进行搜索')this.value='';"> 
    &nbsp;&nbsp; <input name="sub" type="button" value="搜索" onclick="check()">
    </form>
    
    <!-- check search is null? -->
    <script language="javascript">
	    function check(){
	    	
	    	if(searchBranch.keyword.value==""){
	    		alert("请输入关键字进行搜索!");
	    		searchBranch.keyword.focus();
	    		return;
	    	}else{
	    		searchBranch.submit();
	    	}
	    }
    </script>
   
	<table border="1px">
	<thead>
		<tr>
			<th>分支机构编号</th>
			<th>分支机构名称</th>
			<th>创建时间</th>
			<th>管理分支机构</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${request.branchs}" var="b">
 			<tr> 
 				<td align="center">${b.branchId}</td><td align="center">${b.branchName}</td><td align="center">${b.branchFoundedTime}</td>
 				<td align="center"><a href="<%=basePath %>branchManage!updateBranch1.action?branchInfo.branchId=${b.branchId}">编辑</a>&nbsp;&nbsp;<a href="<%=basePath %>branchManage!delBranch.action?branchInfo.branchId=${b.branchId}">删除</a></td>
 			</tr>
 			<tr>
 				<td colspan="4">机构简介: ${b.branchIntr}</td>
 			</tr>
 			<tr>
 				<td colspan="4" bgcolor="#FFCCFF">&nbsp;<td>
 			</tr>
    	</c:forEach>
    	
	</tbody>
	</table> 
	
	</div>
    

  </body>
</html>
