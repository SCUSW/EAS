<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'updateBranch.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

	<style type="text/css">
	div#updatebra {
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
  
  	<div id="updatebra">
  	
	<form name="updateBranch" action="<%=basePath %>branchManage!updateBranch2.action" method="post">
	<input type="hidden" name="branchInfo.branchAvai" value="${request.branchInfo.branchAvai}"/>
	
	分支机构编号:<input id="bid" type="text" width="30" disabled="disabled" readonly="readonly" name="branchInfo.branchId" value="${request.branchInfo.branchId }"/><br/>
	
	创&nbsp;&nbsp;建&nbsp;&nbsp;时&nbsp;&nbsp;间:<input id="btime" type="text" width="30" disabled="disabled" readonly="readonly" name="branchInfo.branchFoundedTime" value="${request.branchInfo.branchFoundedTime }"/><br/>
	
	分支机构名称:<input id="name" type="text" width="30" name="branchInfo.branchName" value="${request.branchInfo.branchName }"/><br/>
	
	分支机构简介:<textarea name="branchInfo.branchIntr" rows="10" cols="30" >${request.branchInfo.branchIntr }</textarea><br/>
	
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="button" name="sub" value="提交修改" onclick="check()" />
	
	</form>	
	
	 <script type="text/javascript">
	    function check(){
	    	if(updateBranch.name.value==""){
	    		alert("请输入分支机构名称！");
	    		addBranch.name.focus();
	    		return;
	    	}else{
	    		updateBranch.submit();
	    	}
	    }
    </script>
	
	
	</div>
	
	</body>
</html>
