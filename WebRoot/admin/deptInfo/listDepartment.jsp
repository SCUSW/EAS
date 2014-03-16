<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="s" uri="/struts-tags" %>

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
	div#listdep {
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
    
    <div id="listdep">

	<s:debug></s:debug>

    <form id="searchDepartment" name="searchDepartment" method="post" action="<%=basePath %>departmentManage!searchDepartment.action">
    关键字查询: 
    <input type="text" name="keyword" id="keyword" value="${request.keyword}" onfocus="javascript:if(this.value=='请输入关键字进行搜索')this.value='';"> 
    &nbsp;&nbsp; <input type="button" value="搜索" onclick="check()">
    </form>
    
    
    <form id="searchDepartment2" name="searchDepartment2" method="post" action="<%=basePath %>departmentManage!searchDepartment2.action">
	分类查询:
	<select name="branchId">
		<option value="0">所有分支机构</option>
		<c:forEach items="${request.branchs}" var="b">
			<option value="${b.branchId}">${b.branchId}:${b.branchName}</option>
		</c:forEach>
	</select>
	&nbsp;&nbsp; <input type="submit" value="查询" >
	</form>
    
    
    <!-- check search is null? -->
    <script language="javascript">
	    function check(){
	    	
	    	if(searchDepartment.keyword.value=="" || searchDepartment.keyword.value=="请输入关键字进行搜索" ){
	    		alert("请输入关键字进行搜索!");
	    		searchDepartment.keyword.focus();
	    		return;
	    	}else{
	    		searchDepartment.submit();
	    	}
	    }
    </script>
   
	<table border="1px">
	<thead>
		<tr>
			<th>部门编号</th>
			<th>部门名称</th>
			<th>创建时间</th>
			<th>所属分支机构</th>
			<th>管理部门信息</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${request.departments}" var="d">
 			<tr>
 				<td align="center">${d.departmentId}</td><td align="center">${d.departmentName}</td><td align="center">${d.departmentFoundedTime}</td><td align="center"><abbr title="${d.branchInfo.branchName}">${d.branchInfo.branchId}</abbr></td>
 				<td align="center"><a href="<%=basePath %>departmentManage!updateDepartment1.action?departmentInfo.departmentId=${d.departmentId}">编辑</a>&nbsp;&nbsp;<a href="<%=basePath %>departmentManage!delDepartment.action?departmentInfo.departmentId=${d.departmentId}">删除</a></td>
 			</tr>
 			<tr>
 				<td colspan="5">部门简介: ${d.departmentIntr}</td>
 			</tr>
 			<tr>
 				<td colspan="5" bgcolor="#FFCCFF">&nbsp;<td>
 			</tr>
    	</c:forEach>
    	
	</tbody>
	</table> 
	
	
	
	
	总共： ${request.total } 条记录 &nbsp;&nbsp;
	每页显示： ${request.pageSize } 条记录<br>
	<%
	if((Integer)request.getAttribute("total")>(Integer)request.getAttribute("pageSize")) { 
		if((Integer)request.getAttribute("currentPage")!=1){	
	%>

			<a href="<%=basePath%>departmentManage!listDepartment.action?nextPage=1&pageSize=${request.pageSize }">首页</a>&nbsp;&nbsp;
			<a href="<%=basePath%>departmentManage!listDepartment.action?nextPage=<%=((Integer)request.getAttribute("currentPage")-1) %>&pageSize=${request.pageSize }">上一页</a>&nbsp;&nbsp;
		<%} %>
		当前第${request.currentPage }页&nbsp;&nbsp;
		<%
		if((Integer)request.getAttribute("currentPage")<(Integer)request.getAttribute("total")/(Integer)request.getAttribute("pageSize")+1){	
		%>
			<a href="<%=basePath%>departmentManage!listDepartment.action?nextPage=<%=((Integer)request.getAttribute("currentPage")+1) %>&pageSize=${request.pageSize }">下一页</a>&nbsp;&nbsp;
			<a href="<%=basePath%>departmentManage!listDepartment.action?nextPage=<%=((Integer)request.getAttribute("total")/(Integer)request.getAttribute("pageSize")+1) %>&pageSize=${request.pageSize }">末页</a>&nbsp;&nbsp;
		<%} 
	}%>
	
	
	
	
	
	</div>
    

  </body>
</html>
