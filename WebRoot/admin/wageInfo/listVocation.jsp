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
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	
	<link rel="stylesheet" type="text/css" href="css/body.css">
	
	
	<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/main.js"></script>
	
	
	
	

  </head>
  
  <body>
	<div id="listvoc">
		
		<form id="searchVocation1" name="searchVocation1" method="post" action="<%=basePath %>vocationManage!searchVocation1.action?nextPage=1">
		
		
		<input class="btn btn-default"  style="position:relative;top:4px;margin-left:400px;font-size:12px;" type="button" value="搜索" onclick="check()" />  
	   <span style="position:relative;margin-top:120px;top:5px;left:-330px;"> 分类查询: </span>
	   <select style="width:200px;margin-top:-27px;margin-left:80px;height:31px;" class="form-control" name="branchInfo.branchId" id="keyword" value="${request.keyword}" onfocus="javascript:if(this.value=='请输入关键字进行搜索')this.value='';"/>
			<option value="0">所有分支机构</option>
			<c:forEach items="${request.branchs}" var="b">
				<option value="${b.branchId}" ${b.branchId eq branchInfo.branchId?"selected":"" }>${b.branchId}:${b.branchName}</option>
			</c:forEach>
		</select>
		</form>
		
		<form id="searchVocation2" name="searchVocation2" method="post" action="<%=basePath %>vocationManage!searchVocation2.action">
		
		<input class="btn btn-default"  name="sub" style="position:relative;top:4px;margin-left:400px;font-size:12px;" type="button" value="搜索" onclick="check()" />  
	   <span style="position:relative;margin-top:120px;top:5px;left:-330px;"> 关键字查询: </span>
	   <input style="width:200px;margin-top:-27px;margin-left:80px;height:31px;" class="form-control" name="keyword" id="keyword" value="${request.keyword}" onfocus="javascript:if(this.value=='请输入关键字进行搜索')this.value='';"/>
		
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
		
		<table class="table table-hover" border="1px">
		<thead>
			<tr class="warning">
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
				<tr class="success">
					<td align="center">${v.vocationId}</td><td align="center">${v.vocationName}</td><td align="center">${v.wageBase}</td><td align="center"><abbr title="${v.departmentInfo.departmentName}">${v.departmentInfo.departmentId}</abbr></td><td align="center"><abbr title="${v.departmentInfo.branchInfo.branchName}">${v.departmentInfo.branchInfo.branchId}</abbr></td>
 					<td align="center"><button class="btn btn-default" onclick="window.location.href='<%=basePath %>vocationManage!updateVocation1.action?vocation.vocationId=${v.vocationId}'"><span class="glyphicon glyphicon-edit"></span> 编辑</button>&nbsp;<button class="btn btn-default" onclick="window.location.href='<%=basePath %>vocationManage!delVocation.action?vocation.vocationId=${v.vocationId}'"><span class="glyphicon glyphicon-remove
 					"></span> 删除</button></td>
				</tr>
				<tr class="active">
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
	
				<button class="btn btn-default" onclick="window.location.href='<%=basePath%>vocationManage!listVocation.action?nextPage=1&pageSize=${request.pageSize }'"> 首页</button>&nbsp;&nbsp;
				<button class="btn btn-default" onclick="window.location.href='href="<%=basePath%>vocationManage!listVocation.action?nextPage=<%=((Integer)request.getAttribute("currentPage")-1) %>&pageSize=${request.pageSize }'">上一页</button>&nbsp;&nbsp;
			<%} %>
			当前第${request.currentPage }页&nbsp;&nbsp;
			<%
			if((Integer)request.getAttribute("currentPage")<(Integer)request.getAttribute("total")/(Integer)request.getAttribute("pageSize")+1){	
			%>
				<button class="btn btn-default" onclick="window.location.href='<%=basePath%>vocationManage!listVocation.action?nextPage=<%=((Integer)request.getAttribute("currentPage")+1) %>&pageSize=${request.pageSize }'">下一页</button>&nbsp;&nbsp;
				<button class="btn btn-default" onclick="window.location.href='<%=basePath%>vocationManage!listVocation.action?nextPage=<%=((Integer)request.getAttribute("total")/(Integer)request.getAttribute("pageSize")+1) %>&pageSize=${request.pageSize }'">末页</button>&nbsp;&nbsp;
			<%} 
		}%>
			
	
	</div>


  </body>
</html>
