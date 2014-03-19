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
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	
	<link rel="stylesheet" type="text/css" href="css/body.css">
	
	
	<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/main.js"></script>
	
	<style type="text/css">
	
	h2 {margin-bottom:0; font-size:14px;}
	ul {margin:0;}
	li {list-style:none;margin-top: 5px;}
	a {text-decoration:none;}
	</style>

  </head>
  
  <body >
    
    <div id="listbra">
	<br/>
	<br/>
    <form id="searchBranch" name="searchBranch" method="post" action="<%=basePath %>branchManage!searchBranch.action">
  <center>
  <input class="btn btn-default"  name="sub" style="position:relative;top:4px;margin-left:400px;font-size:12px;" type="button" value="搜索" onclick="check()" />  
  <span style="position:relative;margin-top:120px;top:5px;left:-330px;"> 关键字查询: </span><input style="width:200px;margin-top:-27px;margin-left:80px;height:31px;" class="form-control" value="${request.keyword}" onfocus="javascript:if(this.value=='请输入关键字进行搜索')this.value='';" type="text" name="keyword"/>
 </center>
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
   
	<table class="table table-hover" border="1px">
	<thead>
		<tr style="text-align:center;" class="warning">
			<th>分支机构编号</th>
			<th>分支机构名称</th>
			<th>创建时间</th>
			<th>管理分支机构</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${request.branchs}" var="b">
 			<tr class="success"> 
 				<td align="center">${b.branchId}</td><td align="center">${b.branchName}</td><td align="center">${b.branchFoundedTime}</td>
 				<td align="center"><button class="btn btn-default" onclick="window.location.href='<%=basePath %>branchManage!updateBranch1.action?branchInfo.branchId=${b.branchId}'">
 				<span class="glyphicon glyphicon-edit"></span> 编辑</button>
 				<button class="btn btn-default" onclick="window.location.href='branchManage!delBranch.action?branchInfo.branchId=${b.branchId}'">
											
 				<span class="glyphicon glyphicon-remove"></span>删除</button></td>
 			</tr>
 			<tr class="success">
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
