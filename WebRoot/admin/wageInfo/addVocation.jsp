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
    
    <title>My JSP 'addVocation.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<style type="text/css">
	div#addvoc {
	text-align:left;
	background-color:#ffff99;
	}
	h2 {margin-bottom:0; font-size:14px;}
	ul {margin:0;}
	li {list-style:none;margin-top: 5px;}
	a {text-decoration:none;}
	</style>
	
	
	<SCRIPT language="JavaScript" >
		<!--下拉框级联开始-->
		function changeBranch(){
			var selected = (Integer)document.addVocation.branch.value;
			document.addVocation.department.options.length=0;
			<% 
			Map<Integer,List> map = (Map<Integer,List>) request.getAttribute("departments");
	 		%>  
			for(var i in map.get(selected)){
					document.addVocation.department.options.add(new Option(i.departmentId, i.departmentName));
			}
			document.addVocation.department.options.selctIndex=0;
		}
		
		
<%-- 	function loadBranch(){
			<% List l = (List)request.getAttribute("branchs"); %>
			for(var i in l){
				document.addVocation.branch.options.add(new Option(i.branchId + "." + i.branchName, i.branchId));
			}
			document.addVocation.branch.selectedIndex = 0;
		} 
--%>
		
		<!--下拉框级联结束-->
		</SCRIPT>
	

  </head>
  
<!-- 	<body bgcolor="#ffff99" onLoad="loadBranch()"> -->
  		<body bgcolor="#ffff99">
  		
	  	<div id="addvoc">
	  	
		<form id="addVocation" name="addVocation" action="<%=basePath %>vocationManage!addVocation.action" method="post">
		
		<B>选择职类所属机构与部门:</B> &nbsp;
		<SELECT name="branch" id="branch" onChange="changeBranch()">
			<OPTION value="0">--请选择分支机构--</OPTION>
			<c:forEach items="${request.branchs }" var="b">
				<option value="${b.branchId }">${b.branchId }:${b.branchName }</option>
			</c:forEach>
			
		</SELECT>
		
		<SELECT name="department" id="department" >
		<OPTION value="0">--请选择部门--</OPTION>
		</SELECT>
		
		<br/>
		职位名称：<input id="name" type="text" width="30" name="vocation.vocationName" /><br/>
		工资基数：<input id="wagebase" type="text" width="30" name="vocation.wageBase" onafterpaste="this.value=this.value.replace(/\D/g,'')" onkeyup="this.value=this.value.replace(/\D/g,'')" onkeypress="if(window.event.keyCode<48 || window.event.keyCode>57) window.event.keyCode = 0;" value="" /><br/>
	
		备注信息：<textarea name="vocation.remark" rows="10" cols="30"></textarea><br/>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="button" name="add" value="确定添加" onclick="check()" />
		
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