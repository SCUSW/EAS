<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	
	

  </head>
  
  <body >
  
	<center>
  	
	<form name="addGroup" id="addGroup" action="<%=basePath %>privilegeManage!addGroup.action" method="post">
	<div style="width:300px;">
		<div class="input-group input-group-sm">
 	 			<span class="input-group-addon">权限组名称</span>
				<input type="text" id="name" name="groupInfo.groupName" class="form-control" >
			</div>
		</div>
	
	
	
	<div style="width:300px;">
		<div style="text-align:left;" class="input-group input-group-sm">
 	 			<span class="input-group-addon">所拥有权限</span>
				<c:forEach items="${privileges }" var="p">	
				<input type="checkbox" name="privileges" value="${p.privilegeId }" >
				<abbr tilte="${privilegeDesc }">${p.privilegeName } (权限编号为： ${p.privilegeId })</abbr>
				<br/>
				</c:forEach>
			</div>
		</div>
	
	<div style="width:300px;">
		<div class="input-group input-group-sm">
 	 			<span class="input-group-addon">权限组说明</span>
				<textarea class="form-control" name="groupInfo.groupRemark" rows="10" cols="30"></textarea>
			</div>
		</div>
	
	
	<input class="btn btn-default" type="button" value="确定添加" onclick="check()" />
	</form>	
	
	<script language="javascript">
	    function check(){
	    	if(addGroup.name.value==""){
	    		alert("请输入权限组名称!");
	    		addGroup.name.focus();
	    		return;
	    	}else{
	    		addGroup.submit();
	    	}
	    }
    </script>
	
	
	</center>
	</body>
</html>