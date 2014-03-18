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
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		td{
			color: fuchsia;
			text-align: center;
			width: 140px;
		}
	
	</style>
  </head>
  
  <body>
    	<center>
    			<table border="1">
    				<tr>
    				<td>操作</td><td>星期一</td><td>星期二</td><td>星期三</td><td>星期四</td><td>星期五</td>
    				</tr>
    				<tr>
    				<td>第一节</td> <td ><input type="button" onclick="window.location.href='educational!querryCourseClasshour.action?index=${1}'" value=""/></td> 
    				                <td><input type="button" onclick="window.location.href='educational!querryCourseClasshour.action?index=${5}'" value=""/></td> 
    				                <td><input type="button" onclick="window.location.href='educational!querryCourseClasshour.action?index=${9}'" value=""/></td> 
    				                <td><input type="button" onclick="window.location.href='educational!querryCourseClasshour.action?index=${13}'" value=""/></td>    
    				                <td><input type="button" onclick="window.location.href='educational!querryCourseClasshour.action?index=${17}'" value=""/></td> 
    				<tr> 
    					<td>第二节</td> <td><input type="button" onclick="window.location.href='educational!querryCourseClasshour.action?index=${2}'" value=""/></td> 
    				                <td><input type="button" onclick="window.location.href='educational!querryCourseClasshour.action?index=${6}'" value=""/></td> 
    				                <td><input type="button" onclick="window.location.href='educational!querryCourseClasshour.action?index=${10}'" value=""/></td> 
    				                <td><input type="button" onclick="window.location.href='educational!querryCourseClasshour.action?index=${14}'" value=""/></td>    
    				                <td><input type="button" onclick="window.location.href='educational!querryCourseClasshour.action?index=${18}'" value=""/></td> 
    				</tr>
    				
    				<tr>
    				<td>第三节</td> <td><input type="button" onclick="window.location.href='educational!querryCourseClasshour.action?index=${3}'" value=""/></td> 
    				                <td><input type="button" onclick="window.location.href='educational!querryCourseClasshour.action?index=${7}'" value=""/></td> 
    				                <td><input type="button" onclick="window.location.href='educational!querryCourseClasshour.action?index=${11}'" value=""/></td> 
    				                <td><input type="button" onclick="window.location.href='educational!querryCourseClasshour.action?index=${15}'" value=""/></td>    
    				                <td><input type="button" onclick="window.location.href='educational!querryCourseClasshour.action?index=${19}'" value=""/></td> 
    				</tr>
    				
    				<tr>
    				<td>第四节</td> <td><input type="button" onclick="window.location.href='educational!querryCourseClasshour.action?index=${4}'" value=""/></td> 
    				                <td><input type="button" onclick="window.location.href='educational!querryCourseClasshour.action?index=${8}'" value=""/></td> 
    				                <td><input type="button" onclick="window.location.href='educational!querryCourseClasshour.action?index=${12}'" value=""/></td> 
    				                <td><input type="button" onclick="window.location.href='educational!querryCourseClasshour.action?index=${16}'" value=""/></td>    
    				                <td><input type="button" onclick="window.location.href='educational!querryCourseClasshour.action?index=${20}'" value=""/></td>
    				</tr>
    				
    			</table>
    	</center>
  </body>
</html>
