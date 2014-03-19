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
  	<br/>
  	
  	
	<form name="updateGroup" id="updateGroup" action="<%=basePath %>privilegeManage!updateGroup2.action" method="post">
	<div style="width:300px;">
		<div class="input-group input-group-sm">
 	 			<span class="input-group-addon">权限组编号</span>
				<input type="text" id="gid" readonly="readonly" name="groupInfo.groupId" value="${request.groupInfo.groupId }"  class="form-control" >
			</div>
		</div>
		
	<div style="width:300px;">
		<div class="input-group input-group-sm">
 	 			<span class="input-group-addon">权限组名称</span>
				<input type="text" id="name" name="groupInfo.groupName" value="${request.groupInfo.groupName } "  class="form-control" >
			</div>
		</div>
	
	<div style="width:300px;">
		<div align="left" class="input-group input-group-sm">
 	 			<span class="input-group-addon">所拥有权限</span>
 	 			<c:forEach items="${privileged }" var="p">
				<input type="checkbox" name="privileges" value="${p.privilegeId }" checked="checked" ><abbr tilte="${p.privilegeDesc }">${p.privilegeName } (权限编号为： ${p.privilegeId })</abbr><br/>
				</c:forEach>
				<c:forEach items="${privileges }" var="p">
				<input type="checkbox" name="privileges" value="${p.privilegeId }" ><abbr tilte="${p.privilegeDesc }">${p.privilegeName } (权限编号为： ${p.privilegeId })</abbr>
				<br/>
				</c:forEach>
			</div>
		</div>
		
	<div style="width:300px;">
		<div class="input-group input-group-sm">
 	 			<span class="input-group-addon">权限组说明</span>
				<textarea name="groupInfo.groupRemark" rows="10" cols="30" >${request.groupInfo.groupRemark }</textarea>
			</div>
		</div>	
	
	<input class="btn btn-default" type="button" value="提交修改" onclick="check()" />
	
	
	</form>	
	
	<script language="javascript">
	    function check(){
	    	if(updateGroup.name.value==""){
	    		alert("请输入权限组名称!");
	    		updateGroup.name.focus();
	    		return;
	    	}else{
	    		updateGroup.submit();
	    	}
	    }
    </script>
	
	</center>
	</body>
</html>