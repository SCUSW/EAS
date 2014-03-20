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
    
    <title>My JSP 'listStaff.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>

		
		
		<!-- this link is not supposed to be here -->
		<a href="<%=basePath%>setStaff!addStaff1.action?nextPage=1" >添加员工</a>
		<br/>
		
		
		
		
		<!--  list staff by branch -->
		
		<form id="searchStaff1" name="searchStaff1" method="post" action="<%=basePath %>setStaff!searchStaff1.action?nextPage=1">
		分类查询:
		<select name="branchInfo.branchId">
			<option value="0">所有分支机构</option>
			<c:forEach items="${request.branchs}" var="b">
				<option value="${b.branchId}" ${b.branchId eq branchInfo.branchId?"selected":"" }>${b.branchId}:${b.branchName}</option>
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
		
		<form id="searchStaff2" name="searchStaff2" method="post" action="<%=basePath %>setStaff!searchStaff2.action?nextPage=1&branchInfo.branchId=0">
		关键字查询:
		<input type="text" name="keyword" id="keyword" value="${request.keyword}" onfocus="javascript:if(this.value=='请输入关键字进行搜索')this.value='';"> 
    	&nbsp;&nbsp; <input name="sub" type="button" value="搜索" onclick="check()">
		</form>
		
		<!-- check search is null? -->
    	<script language="javascript">
	    function check(){
	    	if(searchStaff2.keyword.value=="" || searchStaff2.keyword.value=="请输入关键字进行搜索" ){
	    		alert("请输入关键字进行搜索!");
	    		searchStaff2.keyword.focus();
	    		return;
	    	}else{
	    		searchStaff2.submit();
	    	}
	    }
    	</script>
		
		
		
		
		
		<table border="1px">
		
		<thead>
			<tr>
				<th>员工编号</th>
				<th>员工账号</th>
				<th>姓名</th>
				<th>性别</th>
				<th>手机号码</th>
				<th>QQ</th>
				<th>身份证号</th>
				<th>所属职类</th>
				<th>所在权限组</th>
				<th>入职时间</th>
				<th>管理</th>
			</tr>
		</thead>
		
		<tbody>
			<c:forEach items="${request.staffs }" var="s">
				<tr>
					<td align="center">${s.staffId}</td>
					
					<td align="center">${s.staffNo}</td>
					
					<td align="center">${s.staffName}</td>
					
					<td align="center">${s.staffSex}</td>
					
					<td align="center">${s.staffPhone}</td>
					
					<td align="center">${s.staffQq}</td>
					
					<td align="center">${s.staffIdcard}</td>
					
					<td align="center"><abbr title="职类编号为： ${s.positionInfo.vocationId}">${s.positionInfo.vocationName}</abbr></td>
					
					<td align="center"><abbr title="${s.groupInfo.groupRemark}">${s.groupInfo.groupName}</abbr></td>
					
					<td align="center">${s.staffEmplTime}</td>
					
 					
 					<td align="center">
 					<a href="<%=basePath %>setStaff!updateStaff1.action?staff.staffId=${s.staffId}"> 编辑 </a>
 					<a href="<%=basePath %>setStaff!deleteStaff.action?staff.staffId=${s.staffId}"> 删除 </a>
 					</td>
 					
 					
				</tr>
				
				<tr>
 					<td colspan="11">备注信息: ${s.staffOthers}</td>
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
	
				<a href="<%=basePath%>setStaff!listStaff.action?nextPage=1&pageSize=${request.pageSize }"> 首页</a>&nbsp;&nbsp;
				<a href="<%=basePath%>setStaff!listStaff.action?nextPage=<%=((Integer)request.getAttribute("currentPage")-1) %>&pageSize=${request.pageSize }">上一页</a>&nbsp;&nbsp;
			<%} %>
			当前第${request.currentPage }页&nbsp;&nbsp;
			<%
			if((Integer)request.getAttribute("currentPage")<(Integer)request.getAttribute("total")/(Integer)request.getAttribute("pageSize")+1){	
			%>
				<a href="<%=basePath%>setStaff!listStaff.action?nextPage=<%=((Integer)request.getAttribute("currentPage")+1) %>&pageSize=${request.pageSize }">下一页</a>&nbsp;&nbsp;
				<a href="<%=basePath%>setStaff!listStaff.action?nextPage=<%=((Integer)request.getAttribute("total")/(Integer)request.getAttribute("pageSize")+1) %>&pageSize=${request.pageSize }">末页</a>&nbsp;&nbsp;
			<%} 
		}%>

  </body>
</html>
