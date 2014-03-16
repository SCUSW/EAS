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
    
    <title>My JSP 'listPrivilege.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<style type="text/css">
	div#listlev {
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
    
    <div id="listlev">
<%-- 
    <form id="searchTeaLevel" name="searchTeaLevel" method="post" action="<%=basePath %>teaLevelManage!searchTeaLevel.action">
    <input type="text" name="keyword" id="keyword" value="${request.keyword}" onfocus="javascript:if(this.value=='请输入关键字进行搜索')this.value='';"> 
    &nbsp;&nbsp; <input name="sub" type="button" value="搜索" onclick="check()">
    </form>
     --%>
    <!-- check search is null? -->
 <!--    <script language="javascript">
	    function check(){
	    	
	    	if(searchTeaLevel.keyword.value==""){
	    		alert("请输入关键字进行搜索!");
	    		searchTeaLevel.keyword.focus();
	    		return;
	    	}else{
	    		searchTeaLevel.submit();
	    	}
	    }
    </script> -->
   
	<table border="1px">
	<thead>
		<tr>
			<th>级别编号</th>
			<th>级别名称</th>
			<th>基本课时</th>
			<th>课时费</th>
			<th>编辑</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${request.teaLevels}" var="l">
 			<tr> 
 				<td align="center">${l.levelId}</td><td align="center">${l.levelName}</td><td align="center">${l.baseClassHour}</td><td align="center">${l.classCost}</td>
 				<td align="center"><a href="<%=basePath %>teaLevelManage!updateTeaLevel1.action?teaLevel.levelId=${l.levelId}">编辑</a>&nbsp;&nbsp;<a href="<%=basePath %>teaLevelManage!delTeaLevel.action?teaLevel.levelId=${l.levelId}">删除</a></td>
 			</tr>
 			<tr>
 				<td colspan="5">备注信息: ${l.levelRemark}</td>
 			</tr>
 			<tr>
 				<td colspan="5" bgcolor="#FFCCFF">&nbsp;<td>
 			</tr>
    	</c:forEach>
    	
	</tbody>
	</table> 
	
	</div>
    

  </body>
</html>
