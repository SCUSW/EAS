<%@page import="javax.swing.text.Document"%>
<%@ page language="java" import="java.util.*,com.scusw.model.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%@taglib uri="/struts-tags" prefix="s" %>
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
	div#updatevoc {
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
  		<s:debug>
  		</s:debug>
	  	<div id="updatevoc">
	  	
		<form id="updateVocation" name="updateVocation" action="<%=basePath %>vocationManage!updateVocation3.action" method="post">
		
	
		请选择所属部门信息: 
		<SELECT name="vocation.departmentInfo.departmentId" id="department" >
			<c:forEach items="${request.departments }" var="d">
				<option value="${d.departmentId }" ${d.departmentId eq vocation.departmentInfo.departmentId?"selected":"" } >${d.departmentId }.${d.departmentName }</option>
			</c:forEach>
		</SELECT> 
		
		<br/>
		职位编号：<input id="vid" type="text" width="30" readonly="readonly" name="vocation.vocationId" value="${vocation.vocationId }" /><br/>
		职位名称：<input id="name" type="text" width="30" name="vocation.vocationName" value="${vocation.vocationName }" /><br/>
		工资基数：<input id="wagebase" type="text" width="30" name="vocation.wageBase" value="${vocation.wageBase }" onafterpaste="this.value=this.value.replace(/\D/g,'')" onkeyup="this.value=this.value.replace(/\D/g,'')" onkeypress="if(window.event.keyCode<48 || window.event.keyCode>57) window.event.keyCode = 0;" value="" /><br/>
	
		备注信息：<textarea name="vocation.vocationRemark" rows="10" cols="30">${vocation.vocationRemark}</textarea><br/>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="button" name="add" value="提交修改" onclick="check()" />
		
		</form>	
		
		 <script type="text/javascript">
		    function check(){
		    	if(updateVocation.name.value==""){
		    		alert("请输入职位名称！");
		    		updateVocation.name.focus();
		    		return;
		    	}if(updateVocation.wagebase.value==""){
					alert("请输入工资基数!");
					updateVocation.wagebase.focus();
		    		return;
				}else{
		    		updateVocation.submit();
		    	}
		    }
	    </script>
		
		
		</div>
	
	</body>
</html>