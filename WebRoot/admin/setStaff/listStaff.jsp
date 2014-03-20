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
		<br/>	
		<!--  list staff by branch -->
		
		<form id="searchStaff1" name="searchStaff1" method="post" action="<%=basePath %>setStaff!searchStaff1.action?nextPage=1">
		<input class="btn btn-default" style="position:relative;top:4px;margin-left:400px;font-size:12px;" type="submit" value="查询" />  
		   <span style="position:relative;margin-top:120px;top:5px;left:-330px;"> 分&nbsp;&nbsp;类&nbsp;查&nbsp;询: </span>
			   <select name="branchInfo.branchId" style="width:200px;margin-top:-27px;margin-left:80px;height:31px;" class="form-control" >
				  	<option value="0">所有分支机构</option>
				  	<c:forEach items="${branchs}" var="b">
						<option value="${b.branchId}">${b.branchId}:${b.branchName}</option>
					</c:forEach>
			   </select>
		</form>
		
		<form id="searchStaff2" name="searchStaff2" method="post" action="<%=basePath %>setStaff!searchStaff2.action?nextPage=1&branchInfo.branchId=0">
		 <input class="btn btn-default"  name="sub" style="position:relative;top:4px;margin-left:400px;font-size:12px;" type="button" value="搜索" onclick="check()" />  
	   <span style="position:relative;margin-top:120px;top:5px;left:-330px;"> 关键字查询: </span>
	   <input style="width:200px;margin-top:-27px;margin-left:80px;height:31px;" class="form-control" name="keyword" id="keyword" value="${keyword}" onfocus="javascript:if(this.value=='请输入关键字进行搜索')this.value='';"/>
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
		
		<table class="table table-hover" border="1px">
		<thead>
			<tr class="warning">
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
				<tr class="success">
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
 					<button class="btn btn-default" onclick="window.location.href='<%=basePath %>setStaff!updateStaff1.action?staff.staffId=${s.staffId}'"><SPAN class="glyphicon glyphicon-edit"></SPAN> 编辑 </button>
 					<button class="btn btn-default" onclick="window.location.href='<%=basePath %>setStaff!deleteStaff.action?staff.staffId=${s.staffId}'"><SPAN class="glyphicon glyphicon-remove"></SPAN> 删除 </button>
 					</td>	
				</tr>
				<tr class="success">
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
</center>
  </body>
</html>
