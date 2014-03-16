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
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<style type="text/css">
	div#updategro {
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
  
  	<div id="updategro">
  	
	<form name="updateGroup" id="updateGroup" action="<%=basePath %>privilegeManage!updateGroup2.action" method="post">
	权限组编号：<input type="text" width="30" id="gid" readonly="readonly" name="groupInfo.groupId" value="${request.groupInfo.groupId }" /><br/>
	权限组名称：<input type="text" width="30" id="name" name="groupInfo.groupName" value="${request.groupInfo.groupName } "/><br/>
	
	所拥有权限：<br/>
	<c:forEach items="${privileged }" var="p">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="checkbox" name="privileges" value="${p.privilegeId }" checked="checked" ><abbr tilte="${p.privilegeDesc }">${p.privilegeName } (权限编号为： ${p.privilegeId })</abbr>
		<br/>
	</c:forEach>
	
	<c:forEach items="${privileges }" var="p">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="checkbox" name="privileges" value="${p.privilegeId }" ><abbr tilte="${p.privilegeDesc }">${p.privilegeName } (权限编号为： ${p.privilegeId })</abbr>
		<br/>
	</c:forEach>
	
	权限组说明：<textarea name="groupInfo.groupRemark" rows="10" cols="30" >${request.groupInfo.groupRemark }</textarea><br/>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="button" value="提交修改" onclick="check()" />
	
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
	
	</div>
	
	</body>
</html>