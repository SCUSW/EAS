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
    
    <title>My JSP 'addteacher.jsp' starting page</title>
    
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
   <center> <h1>添加老师</h1><br/>
   	<form action="educational!addTeacher.action" method="post">
   	   <div style="width:300px;">
		   	<div class="input-group input-group-sm">
	 			<span class="input-group-addon">登录帐号</span>
				<input name="teacher.staffInfo.staffNo" type="text" class="form-control"><font color="red">${hasNo}</font>
			</div>
		</div>
		<div style="width:300px;">
		   	<div class="input-group input-group-sm">
	 			<span class="input-group-addon">登录密码</span>
				<input name="teacher.staffInfo.staffPass" type="text" class="form-control">
			</div>
		</div>
   	  	<div style="width:300px;">
		   	<div class="input-group input-group-sm">
	 			<span class="input-group-addon">姓名</span>
				<input name="teacher.staffInfo.staffName" type="text" class="form-control">
			</div>
		</div>
   	    
   	    <div style="width:300px;">
		   	<div class="input-group input-group-sm">
	 			<span class="input-group-addon">性别</span>
				<select name="teacher.staffInfo.staffSex" class="form-control">
					<option value=1>男</option>
					<option value=0>女</option>
				</select>
			</div>
		</div>
		
		<div style="width:300px;">
		   	<div class="input-group input-group-sm">
	 			<span class="input-group-addon">Q Q</span>
				<input name="teacher.staffInfo.staffQq" type="text" class="form-control">
			</div>
		</div>
		
		<div style="width:300px;">
		   	<div class="input-group input-group-sm">
	 			<span class="input-group-addon">身份证号</span>
				<input name="teacher.staffInfo.staffIdcard" type="text" class="form-control"><font color="red">${hasIdcard}</font>
			</div>
		</div>
		
		<div style="width:300px;">
		   	<div class="input-group input-group-sm">
	 			<span class="input-group-addon">聘用时间</span>
				<input name="teacher.staffInfo.staffEmplTime" type="text" class="form-control">
			</div>
		</div>
		
		<div style="width:300px;">
		   	<div class="input-group input-group-sm">
	 			<span class="input-group-addon">其他信息</span>
				<input name="teacher.staffInfo.staffOthers" type="text" class="form-control">
			</div>
		</div>
		
		<div style="width:300px;">
		   	<div class="input-group input-group-sm">
	 			<span class="input-group-addon">专业</span>
				<input name="teacher.teacherMajor"
				 type="text" class="form-control"><font color="red">${emptyMajor}</font>
			</div>
		</div>
		
		<div style="width:300px;">
		   	<div class="input-group input-group-sm">
	 			<span class="input-group-addon">教师编号</span>
				<input name="teacher.teacherNo"
				 type="text" class="form-control"><font color="red">${hasTeacherNo}</font>
			</div>
		</div>
		
		<div style="width:300px;">
		   	<div class="input-group input-group-sm">
	 			<span class="input-group-addon">教师院校</span>
				<input name="teacher.teacherGraduate"
				 type="text" class="form-control">
			</div>
		</div>
		
		<div style="width:300px;">
		   	<div class="input-group input-group-sm">
	 			<span class="input-group-addon">教师基本工资</span>
				<input name="teacher.teacherSalary"
				 type="text" class="form-control">
			</div>
		</div>
		
		
		<div style="width:300px;">
		   	<div class="input-group input-group-sm">
	 			<span class="input-group-addon">教师等级</span>
				<select class="form-control" name="teacher.teacherLevel.levelId">
		   		<c:forEach items="${level}" var="l">
		   		    <option value="${l.levelId}">${l.levelName} </option>  
		   		 </c:forEach>
		   		</select>
			</div>
		</div>
		
		<div style="width:300px;">
		   	<div class="input-group input-group-sm">
	 			<span class="input-group-addon">教师类别</span>
				<select class="form-control" name="teacher.teacherType">
		   		    <option value="1">主管老师</option>
		   		    <option value="2">任课老师</option>
		   		</select>
			</div>
		</div>
		
		<div style="width:300px;">
		   	<div class="input-group input-group-sm">
	 			<span class="input-group-addon">用组</span>
				<select class="form-control" name="teacher.staffInfo.groupInfo.groupId">
		   		<c:forEach items="${group}" var="g">
		   		    <option value="${g.groupId}">${g.groupName} </option>  
		   		 </c:forEach>
		   		</select>
			</div>
		</div>
		
   		<div style="width:300px;">
		   	<div class="input-group input-group-sm">
	 			<span class="input-group-addon">用组</span>
				<select class="form-control" name="teacher.staffInfo.positionInfo.vocationId">
		   		<c:forEach items="${position}" var="p">
		   		    <option value="${p.vocationId}">${p.vocationName} </option>  
		   		 </c:forEach>
		   		</select>
			</div>
		</div>
		
		<div style="width:300px;">
		   	<div class="input-group input-group-sm">
	 			<span class="input-group-addon">备注</span>
				<input name="teacher.teacherRemark"
				 type="text" class="form-control">
			</div>
		</div>
   		
   		<input class="btn btn-default" type="submit" value="确定添加"/>
   </form>
   </center>
  </body>
</html>
