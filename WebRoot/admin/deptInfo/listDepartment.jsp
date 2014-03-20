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
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	
	<link rel="stylesheet" type="text/css" href="css/body.css">
	
	
	<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/main.js"></script>
	
	
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
  </head>
  
  <body ><center>
    
  
    <form id="searchDepartment" name="searchDepartment" method="post" action="<%=basePath %>departmentManage!searchDepartment.action?nextPage=1&branchId=0">
   
	   <input class="btn btn-default"  name="sub" style="position:relative;top:4px;margin-left:400px;font-size:12px;" type="button" value="搜索" onclick="check()" />  
	   <span style="position:relative;margin-top:120px;top:5px;left:-330px;"> 关键字查询: </span>
	   <input style="width:200px;margin-top:-27px;margin-left:80px;height:31px;" class="form-control" name="keyword" id="keyword" value="${keyword}" onfocus="javascript:if(this.value=='请输入关键字进行搜索')this.value='';"/>
   
    </form>
    
    
    <form id="searchDepartment2" name="searchDepartment2" method="post" action="<%=basePath %>departmentManage!searchDepartment2.action?nextPage=1&keyword="">
	<input class="btn btn-default" style="position:relative;top:4px;margin-left:400px;font-size:12px;" type="submit" value="查询" />  
	   <span style="position:relative;margin-top:120px;top:5px;left:-330px;"> 分&nbsp;&nbsp;类&nbsp;查&nbsp;询: </span>
	   <select name="branchId" style="width:200px;margin-top:-27px;margin-left:80px;height:31px;" class="form-control" >
	  	<option value="0">所有分支机构</option>
	  	<c:forEach items="${branchs}" var="b">
			<option value="${b.branchId}" ${request.branchId eq b.branchId?"selected":"" } >${b.branchId}.${b.branchName}</option>
		</c:forEach>
	   </select>
		
	
	</form>
    
    
 
   
	<table class="table table-hover" border="1px">
	<thead >
		<tr class="warning">
			<th>部门编号</th>
			<th>部门名称</th>
			<th>创建时间</th>
			<th>所属分支机构</th>
			<th>管理部门信息</th>
		</tr>
	</thead>
	<tbody>
		<s:iterator value="list">
 			<tr class="success">
 				<td align="center">${departmentId}</td><td align="center">${departmentName}</td><td align="center">${departmentFoundedTime}</td><td align="center"><abbr title="${branchInfo.branchName}">${branchInfo.branchId}</abbr></td>
 				<td align="center">
 				<button class="btn btn-default" onclick="window.location.href='<%=basePath %>departmentManage!updateDepartment1.action?departmentInfo.departmentId=${departmentId}'"><span class="glyphicon glyphicon-edit"></span> 编辑</button>
 				<button class="btn btn-default" onclick="window.location.href='<%=basePath %>departmentManage!delDepartment.action?departmentInfo.departmentId=${departmentId}'"><span class="glyphicon glyphicon-remove"></span> 删除</button></td>
 			</tr>
 			<tr class="success">
 				<td colspan="5">部门简介: ${d.departmentIntr}</td>
 			</tr>
 			<tr>
 				<td colspan="5" bgcolor="#FFCCFF">&nbsp;</td>
 			</tr>
    	</s:iterator>
    	
	</tbody>
	</table> 
	
	
	
	
	总共： ${request.total } 条记录 &nbsp;&nbsp;
	每页显示： ${request.pageSize } 条记录<br>
	<%
	if((Integer)request.getAttribute("total")>(Integer)request.getAttribute("pageSize")) { 
		if((Integer)request.getAttribute("currentPage")!=1){	
	%>

			<button class="btn btn-default" onclick="window.location.href='<%=basePath%>departmentManage!listDepartment.action?nextPage=1&pageSize=${request.pageSize }'">首页</button>
			<button class="btn btn-default" onclick="window.location.href='<%=basePath%>departmentManage!listDepartment.action?nextPage=<%=((Integer)request.getAttribute("currentPage")-1) %>&pageSize=${request.pageSize }'">上一页</button>
		<%} %>
		当前第${request.currentPage }页&nbsp;&nbsp;
		<%
		if((Integer)request.getAttribute("currentPage")<(Integer)request.getAttribute("total")/(Integer)request.getAttribute("pageSize")+1){	
		%>
			<button class="btn btn-default" onclick="window.location.href='<%=basePath%>departmentManage!listDepartment.action?nextPage=<%=((Integer)request.getAttribute("currentPage")+1) %>&pageSize=${request.pageSize }'">下一页</button>
			<button class="btn btn-default" onclick="window.location.href='<%=basePath%>departmentManage!listDepartment.action?nextPage=<%=((Integer)request.getAttribute("total")/(Integer)request.getAttribute("pageSize")+1) %>&pageSize=${request.pageSize }'">末页</button>
		<%} 
	}%>
	
	
	
	

    
	</center>
  </body>
</html>
