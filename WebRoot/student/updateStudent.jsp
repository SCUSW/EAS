<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'demo.jsp' starting page</title>
    
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
	
	<style>
		
	</style>
	
	<script>
		$(document).ready(function(){
			if(${studentInfo.studentSex}){
				document.getElementById("select")[2].selected=true;
			}
			else{
				document.getElementById("select")[1].selected=true;
			}
		})
	</script>
	</head>
	<body><center>
	
	
	
	
	<div style="width:300px;">		
  <form action="student!updateStudent.action" method="post" class="form-horizontal">
    <fieldset >
    	<input type="hidden" name="studentInfo.studentId" value="${studentInfo.studentId}"/>
		<input type="hidden" name="studentInfo.studentNo" value="${studentInfo.studentNo}"/>
		<input type="hidden" name="studentInfo.studentBalance" value="${studentInfo.studentBalance}"/><br/>
   		<input type="hidden" name="studentInfo.attendTime" value="${studentInfo.attendTime}"/><br/>
   		<input type="hidden" name="studentInfo.rollState.rollstateId" value="${studentInfo.rollState.rollstateId}"/>
   		<input type="hidden" name="studentInfo.groupInfo.groupId" value="${studentInfo.groupInfo.groupId}"/>
   		<input type="hidden" name="studentInfo.studentState" value="${studentInfo.studentState}"/>
   		<input type="hidden" name="studentInfo.consultInfo.consultId" value="${studentInfo.consultInfo.consultId}"/>
    	<input type="hidden" name="studentInfo.studentPass" value="${studentInfo.studentPass}">
    
    <div>
    	  <div id="legend" class=""><legend>修改个人信息</legend></div>
     </div>
      
     		<div class="input-group input-group-sm">
 	 			<span class="input-group-addon">姓名</span>
				<input name="studentInfo.studentName" value="${studentInfo.studentName}" type="text" class="form-control" placeholder="Username">
			</div>
			<br/>
			
			<div class="input-group input-group-sm">
 	 			<span  class="input-group-addon">性别</span>
				<select id="select" name="studentInfo.studentSex"  class="form-control" >
				<option value=1>男</option>
     			 <option value=0>女</option>
     			 </select>
			</div>
			<br/>
			
			<div class="input-group input-group-sm">
 	 			<span class="input-group-addon">年龄</span>
				<input  name="studentInfo.studentAge" value="${studentInfo.studentAge}" type="text" class="form-control" placeholder="Username">
			</div>
			<br/>
			
			
			
				
		
			
			<div class="input-group input-group-sm">
 	 			<span class="input-group-addon">班级</span>
				<input  name="studentInfo.classInfo.classId" value="${studentInfo.classInfo.classId}" type="text" class="form-control" placeholder="Username">
			</div>
			<br/>
			
			
			
			<div class="input-group input-group-sm">
 	 			<span class="input-group-addon">学校</span>
				<input name="studentInfo.studentSchool" value="${studentInfo.studentSchool}" type="text" class="form-control" placeholder="Username">
			</div>
			<br/>
			
			
			<div class="input-group input-group-sm">
 	 			<span class="input-group-addon">住址</span>
				<input  name="studentInfo.studentAddr" value="${studentInfo.studentAddr}" type="text" class="form-control" placeholder="Username">
			</div>
			<br/>
			
			
			<div class="input-group input-group-sm">
 	 			<span class="input-group-addon">电话</span>
				<input name="studentInfo.studentPhone" value="${studentInfo.studentPhone}" type="text" class="form-control" placeholder="Username">
			</div>
			<br/>
			
			<div class="input-group input-group-sm">
 	 			<span class="input-group-addon">专业</span>
				<input name="studentInfo.studentMajor" value="${studentInfo.studentMajor}" type="text" class="form-control" placeholder="Username">
			</div>
			<br/>
			
			
			<div class="input-group input-group-sm">
 	 			<span class="input-group-addon">备注</span>
				<input name="studentInfo.studentRemark" value="${studentInfo.studentRemark}" type="text" class="form-control" placeholder="Username">
			</div>
			<br/>
			<input class="btn btn-default" type="submit" value="确定修改"/>
    </fieldset>
  </form>
  
  
</div>		
 </center></body>
</html>
