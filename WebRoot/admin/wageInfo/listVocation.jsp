<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'listVocation.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<style type="text/css">
	div#listvoc {
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

	<div id="listvoc">
		
		<!--  list vocation by branch and department -->
		
		<form id="searchVocation1" name="searchVocation1" method="post" action="<%=basePath %>vocationManage!searchVocation1.action?nextPage=1">
		分类查询:
		<select name="branchInfo.branchId">
			<option value="0">所有分支机构</option>
			<c:forEach items="${request.branchs}" var="b">
				<option value="${b.branchId}" ${b.branchId==branchInfo.branchId?"selected":"" }>${b.branchId}:${b.branchName}</option>
			</c:forEach>
		</select>
<%-- 	
		&nbsp;&nbsp;选择部门
		<select>
			<option value="">所有部门</option>
			<c:forEach items="${request.departments}" var="d">
				<option value="${d.departmentId}">${d.departmentId}:${d.departmentName}</option>
			</c:forEach>
		</select>
--%>
		&nbsp;&nbsp; <input type="submit" value="查询">
		</form>
		
		<form id="searchVocation2" name="searchVocation2" method="post" action="<%=basePath %>vocationManage!searchVocation2.action?nextPage=1&branchInfo.branchId=0">
		关键字查询:
		<input type="text" name="keyword" id="keyword" value="${request.keyword}" onfocus="javascript:if(this.value=='请输入关键字进行搜索')this.value='';"> 
    	&nbsp;&nbsp; <input name="sub" type="button" value="搜索" onclick="check()">
		</form>
		
		<!-- check search is null? -->
    	<script language="javascript">
	    function check(){
	    	if(searchVocation2.keyword.value=="" || searchVocation2.keyword.value=="请输入关键字进行搜索" ){
	    		alert("请输入关键字进行搜索!");
	    		searchVocation2.keyword.focus();
	    		return;
	    	}else{
	    		searchVocation2.submit();
	    	}
	    }
    	</script>
		
		
		<br/>
		
		<table border="1px">
		<thead>
			<tr>
				<th>职类编号</th>
				<th>职类名称</th>
				<th>工资基数</th>
				<th>所属部门</th>
				<th>所属分支机构</th>
				<th>管理职类信息</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${request.vocations }" var="v">
				<tr>
					<td align="center">${v.vocationId}</td><td align="center">${v.vocationName}</td><td align="center">${v.wageBase}</td><td align="center"><abbr title="${v.departmentInfo.departmentName}">${v.departmentInfo.departmentId}</abbr></td><td align="center"><abbr title="${v.departmentInfo.branchInfo.branchName}">${v.departmentInfo.branchInfo.branchId}</abbr></td>
 					<td align="center"><a href="<%=basePath %>vocationManage!updateVocation1.action?nextPage=1&vocation.vocationId=${v.vocationId}">编辑</a>&nbsp;&nbsp;<a href="<%=basePath %>vocationManage!delVocation.action?vocation.vocationId=${v.vocationId}">删除</a></td>
				</tr>
				<tr>
 					<td colspan="6">备注信息: ${v.vocationRemark}</td>
	 			</tr>
	 			<tr>
	 				<td colspan="6" bgcolor="#FFCCFF">&nbsp;<td>
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
	
				<a href="<%=basePath%>vocationManage!listVocation.action?nextPage=1&pageSize=${request.pageSize }">首页</a>&nbsp;&nbsp;
				<a href="<%=basePath%>vocationManage!listVocation.action?nextPage=<%=((Integer)request.getAttribute("currentPage")-1) %>&pageSize=${request.pageSize }">上一页</a>&nbsp;&nbsp;
			<%} %>
			当前第${request.currentPage }页&nbsp;&nbsp;
			<%
			if((Integer)request.getAttribute("currentPage")<(Integer)request.getAttribute("total")/(Integer)request.getAttribute("pageSize")+1){	
			%>
				<a href="<%=basePath%>vocationManage!listVocation.action?nextPage=<%=((Integer)request.getAttribute("currentPage")+1) %>&pageSize=${request.pageSize }">下一页</a>&nbsp;&nbsp;
				<a href="<%=basePath%>vocationManage!listVocation.action?nextPage=<%=((Integer)request.getAttribute("total")/(Integer)request.getAttribute("pageSize")+1) %>&pageSize=${request.pageSize }">末页</a>&nbsp;&nbsp;
			<%} 
		}%>
			
	
	</div>


  </body>
</html>
