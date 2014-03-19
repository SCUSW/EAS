<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'addClass.jsp' starting page</title>
    
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
	 <br>
    <form action="<%=basePath%>grade!addGradeInfo.action" method="post">
    	
    	<div style="width:300px;">
		<div class="input-group input-group-sm">
 	 			<span class="input-group-addon">年级名</span>
				<input id="bid" type="text" width="30" name="gradeName" class="form-control" >
			</div>
		</div>
    	
    	<div style="width:300px;">
		<div class="input-group input-group-sm">
 	 			<span class="input-group-addon">所属分支机构</span>
				<select class="form-control" name="branchId">
		    	<c:forEach items="${request.branch }" var="i">
		    		<option value=${i.branchId } }>
		    		${i.branchName }
		    		</option>
		    	</c:forEach>
		    		<option value=0}>
		    		不属于任何分支机构
		    		</option>
    			</select>
			</div>
		</div>
		
    	<input class="btn btn-default" type="submit" value="提交修改">
    </form>
    </center>
  </body>
</html>
