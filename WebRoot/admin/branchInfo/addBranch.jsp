<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'addGroup.jsp' starting page</title>
    
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
  
  <body><center>
  
  	<div id="addbra">
  		<br/>
  		<br/>
	<form name="addBranch" action="<%=basePath %>branchManage!addBranch.action" method="post">
	
		<div style="width:300px;">
		<div class="input-group input-group-sm">
 	 			<span class="input-group-addon">分支机构名称</span>
				<input name="branchInfo.branchName" type="text" class="form-control" >
			</div>
			<br/>
		</div>
	分支机构简介：<textarea name="branchInfo.branchIntr" rows="10" cols="30"></textarea><br/>
	
	<br/>
	
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input class="btn btn-default" type="button" name="sub" value="确定添加" onclick="check()" />
	
	</form>	
	
	 <script type="text/javascript">
	    function check(){
	    	if(addBranch.name.value==""){
	    		alert("请输入分支机构名称！");
	    		addBranch.name.focus();
	    		return;
	    	}else{
	    		addBranch.submit();
	    	}
	    }
    </script>
	
	
	</div>
	</center>
	</body>
</html>