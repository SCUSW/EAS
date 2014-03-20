<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>...</title>
    
    
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
    			<table class="table table-hover" border="1">
    				<tr >
    				<td class="danger ">操作</td><td class="warning">星期一</td><td class="warning">星期二</td><td class="warning">星期三</td><td class="warning">星期四</td><td class="warning">星期五</td>
    				</tr>
    				<tr class="success">
    				<td class="warning">第一节</td> <td ><input type="button" onclick="window.location.href='educational!querryCourseClasshour.action?index=${1}'" value=""/></td> 
    				                <td><input type="button" onclick="window.location.href='educational!querryCourseClasshour.action?index=${5}'" value=""/></td> 
    				                <td><input type="button" onclick="window.location.href='educational!querryCourseClasshour.action?index=${9}'" value=""/></td> 
    				                <td><input type="button" onclick="window.location.href='educational!querryCourseClasshour.action?index=${13}'" value=""/></td>    
    				                <td><input type="button" onclick="window.location.href='educational!querryCourseClasshour.action?index=${17}'" value=""/></td> 
    				</tr>
    				<tr class="success"> 
    					<td class="warning">第二节</td> <td><input type="button" onclick="window.location.href='educational!querryCourseClasshour.action?index=${2}'" value=""/></td> 
    				                <td><input type="button" onclick="window.location.href='educational!querryCourseClasshour.action?index=${6}'" value=""/></td> 
    				                <td><input type="button" onclick="window.location.href='educational!querryCourseClasshour.action?index=${10}'" value=""/></td> 
    				                <td><input type="button" onclick="window.location.href='educational!querryCourseClasshour.action?index=${14}'" value=""/></td>    
    				                <td><input type="button" onclick="window.location.href='educational!querryCourseClasshour.action?index=${18}'" value=""/></td> 
    				</tr>
    				
    				<tr class="success">
    				<td class="warning">第三节</td> <td><input type="button" onclick="window.location.href='educational!querryCourseClasshour.action?index=${3}'" value=""/></td> 
    				                <td><input type="button" onclick="window.location.href='educational!querryCourseClasshour.action?index=${7}'" value=""/></td> 
    				                <td><input type="button" onclick="window.location.href='educational!querryCourseClasshour.action?index=${11}'" value=""/></td> 
    				                <td><input type="button" onclick="window.location.href='educational!querryCourseClasshour.action?index=${15}'" value=""/></td>    
    				                <td><input type="button" onclick="window.location.href='educational!querryCourseClasshour.action?index=${19}'" value=""/></td> 
    				</tr>
    				
    				<tr class="success">
    				<td class="warning">第四节</td> <td><input type="button" onclick="window.location.href='educational!querryCourseClasshour.action?index=${4}'" value=""/></td> 
    				                <td><input type="button" onclick="window.location.href='educational!querryCourseClasshour.action?index=${8}'" value=""/></td> 
    				                <td><input type="button" onclick="window.location.href='educational!querryCourseClasshour.action?index=${12}'" value=""/></td> 
    				                <td><input type="button" onclick="window.location.href='educational!querryCourseClasshour.action?index=${16}'" value=""/></td>    
    				                <td><input type="button" onclick="window.location.href='educational!querryCourseClasshour.action?index=${20}'" value=""/></td>
    				</tr>
    				
    			</table>
    			<button class="btn btn-default" onclick="window.location.href='educational/course/sortcourseindex.jsp'"><span class="glyphicon glyphicon-repeat"></span> 返排课主界面</button>
    	</center>
  </body>
</html>
