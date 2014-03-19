<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'addConsultInfo.jsp' starting page</title>
    
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
	<script type="text/javascript" src="js/form_validate.js"></script>	
	
	<script type="text/javascript">
		 function check(){
		 	if(checkAge()&&checkName()){
				$("#password").attr("value",addStudent.no.value);	
		 	}
		 }
		 
		 function checkAge(){
		 	if(addConsultInfo.age.value<0){
		 		alert("请输入正确的年龄");
		 		addConsultInfo.age.focus();
		 		return fales;
		 	}
		 	return true;
		 }
		  
		 function checkName(){
		 	if(addConsultInfo.name.value==""){
	    		alert("请输入姓名！");
	    		addConsultInfo.name.focus();
	    		return fales;
	    	}else{
	    		return true;
	    	}
		 }	
	</script>

  </head>
  
  <body>
    <center> <h1>添加学生</h1>
    	<div style="width:300px;">
    		<form  name="addStudent" action="student!addStudent.action" method="post">
    			<fieldset>
    				
    				<div class="input-group input-group-sm">
	 	 				<span class="input-group-addon">学生姓名</span>
						<input id="name" name="studentInfo.studentName" type="text" class="form-control">
					</div>
				
					<div class="input-group input-group-sm">
	 	 				<span class="input-group-addon">学生学号</span>
						<input id="no" name="studentInfo.studentNo" type="text" class="form-control">
					</div>
					
					<input id="password" type="hidden" name="studentInfo.studentPass" value=""/>
					
					<div class="input-group input-group-sm">
	 	 				<span class="input-group-addon">学生性别</span>
						<select name="studentInfo.studentSex" type="text" class="form-control">
							<option value="1">男</option>
							<option value="0">女</option>
						</select>
					</div>
					
					<div class="input-group input-group-sm">
	 	 				<span class="input-group-addon">学生年龄</span>
						<input id="age" name="studentInfo.studentAge" type="text" class="form-control">
					</div>
					
					<div class="input-group input-group-sm">
	 	 				<span class="input-group-addon">班级编号</span>
						<input id="class" name="studentInfo.classInfo.classId" type="text" class="form-control">
					</div>
					
					<div class="input-group input-group-sm">
	 	 				<span class="input-group-addon">学生专业</span>
						<input id="major" name="studentInfo.studentMajor" type="text" class="form-control">
					</div>
					
					<div class="input-group input-group-sm">
	 	 				<span class="input-group-addon">学生学校</span>
						<input id="school"  name="studentInfo.studentSchool" type="text" class="form-control">
					</div>
					
					<div class="input-group input-group-sm">
	 	 				<span class="input-group-addon">学生住址</span>
						<input id="address" name="studentInfo.studentAddr" type="text" class="form-control">
					</div>
					
					<div class="input-group input-group-sm">
	 	 				<span class="input-group-addon">学生电话</span>
						<input id="phone" name="studentInfo.studentPhone" type="text" class="form-control">
					</div>
					
					<input type="hidden" name="studentInfo.groupInfo.groupId" value="1"/>
					
					<div class="input-group input-group-sm">
	 	 				<span class="input-group-addon">学籍状态</span>
						<input id="rollstate" name="studentInfo.rollState.rollstateId" type="text" class="form-control">
					</div>
					
					<div class="input-group input-group-sm">
	 	 				<span class="input-group-addon">咨询编号</span>
						<input id="consultId" name="studentInfo.consultInfo.consultId" type="text" class="form-control">
					</div>
					
					<div class="input-group input-group-sm">
	 	 				<span class="input-group-addon">学生余额</span>
						<input id="balance" name="studentInfo.studentBalance" type="text" class="form-control">
					</div>
					
					<div class="input-group input-group-sm">
	 	 				<span class="input-group-addon">入学时间</span>
						<input id="attendTime" name="studentInfo.attendTime" type="text" class="form-control">
					</div>
					
					<input type="hidden" name="studentInfo.studentState" value="1"/>
					
					<div class="input-group input-group-sm">
	 	 				<span class="input-group-addon">备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注</span>
						<input id="remark" name="studentInfo.studentRemark" type="text" class="form-control">
					</div>
					
					
					<button class="btn btn-default" onclick="check()" >确认添加</button>
    			</fieldset>
    		</form>
		</div>
   </center>
  </body>
</html>
