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
    
    <title>My JSP 'adduser.jsp' starting page</title>
    
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
   <center> <h1>确认考勤</h1><br/>
  
       			<table class="table table-hover" border="1">
    				<tr class="warning">
    					<td>缺课时间</td><td colspan="2">情况处理</td>
    				</tr>
    				<c:forEach items="${attendants}" var="attendant">
    			<form action="educational!updateAttendant.action" method="post">
    				  <tr class="success"> 
    					<td>
    					<input type="hidden" name="attendant.attendantId" value="${attendant.attendantId}">
		   	            <input type="hidden" name="attendant.registerInfo.registerId" value="${attendant.registerInfo.registerId}">     
    					         <div style="width:300px;">
		   	                      <div class="input-group input-group-sm">
	 			                   <span class="input-group-addon">缺课时间</span>
				                        <input readonly="readonly" type="text" name="attendant.attendantTime" value="${attendant.attendantTime}" class="form-control">
			                           </div>
		                          </div>
		               </td>
    					<td>
    				          <div style="width:300px;">
		   	                   <div class="input-group input-group-sm">
	 			                  <span class="input-group-addon">情况确认</span>
				                       <select class="form-control" name="attendant.attendantRemark">
		                                  <option value="情况属实确认录入">情况属实确认录入</option>
		                                        <option value="情况有误撤销考勤表">情况有误撤销考勤表</option>
		                                 </select>
			                   </div>
		                      </div>
    					</td>
    					<td>
    					    <input class="btn btn-default" type="submit" value="提交考勤信息"/>
    					</td>
    				</tr>
    			</form>
    			</c:forEach> 
    					 
    		</table>
    		<a href="educational/student/querystu.jsp">返回查询界面</a>
   </center>
  </body>
</html>
