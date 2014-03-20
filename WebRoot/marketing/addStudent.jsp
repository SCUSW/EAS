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
	<link href="css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/main.js"></script>
	<script type="text/javascript" src="js/form_validate.js"></script>	
	
	<script type="text/javascript">
		 function check(){
		 	if(checkName()&&checkAge()&&checkMobile()&&checkSchool()&&checkAddress()&&checkMajor()&&checkNo()&&checkClass()&&checkBalance()&&checkTime()&&checkConsultId()){
		 		return true;
		 	}
		 	else 
		 		return false;
		 }
		 
		 function checkAge(){
		 	if(addStudent.age.value<=0 || addStudent.age.value=="" || addStudent.age.value==null){
		 		alert("请输入正确的年龄");
		 		addStudent.age.focus();
		 		return false;
		 	}
		 	return true;
		 }
		 
		 function checkNo(){
		 	if(addStudent.no.value=="" || addStudent.no.value==null){
		 		alert("请输入学号");
		 		addStudent.no.focus();
		 		return false;
		 	}
		 	return true;
		 }
		  
		 function checkName(){
		 	if(addStudent.name.value=="" || addStudent.name.value==null){
	    		alert("请输入姓名！");
	    		addStudent.name.focus();
	    		return false;
	    	}else{
	    		return true;
	    	}
		 }
		 
		 function checkPhone() {
		 	var strPhone = addStudent.phone.value;
			var phoneRegWithArea = /^[0][1-9]{2,3}-[0-9]{5,10}$/; 
			var phoneRegNoArea = /^[1-9]{1}[0-9]{5,8}$/; 
			var prompt = "您输入的电话号码不正确!";
			if( strPhone.length > 9 ) { 
				if( phoneRegWithArea.test(strPhone) ){ 
					return true; 
				}else{ 
					alert( prompt ); 
					return false; 
				} 
			}else{ 
				if( phoneRegNoArea.test( strPhone ) ){ 
					return true; 
				}else{ 
					alert( prompt ); 
					return false; 
				} 
			} 
		}
		
		function checkMobile(){
			var strPhone = addStudent.phone.value;
			var regu =/^[1][0-9]{10}$/;
			var prompt = "您输入的电话号码不正确!";
			if(regu.test(strPhone))
				return true;
			else{
				alert( prompt );
				return false;
			}
		}
		
		function checkSchool(){
		 	if(addStudent.school.value=="" || addStudent.school.value==null){
	    		alert("请输入学校！");
	    		addStudent.school.focus();
	    		return false;
	    	}else{
	    		return true;
	    	}
		 }
		 
		 function checkMajor(){
		 	if(addStudent.major.value=="" || addStudent.major.value==null){
	    		alert("请输入专业！");
	    		addStudent.major.focus();
	    		return false;
	    	}else{
	    		return true;
	    	}
		 }
		 
		 function checkAddress(){
		 	if(addStudent.address.value=="" || addStudent.address.value==null){
	    		alert("请输入住址！");
	    		addStudent.address.focus();
	    		return false;
	    	}else{
	    		return true;
	    	}
		 }
		 
		 function checkClass(){
		 	if(addStudent.cla.value=="" || addStudent.cla.value==null){
	    		alert("请输入班级！");
	    		addStudent.cla.focus();
	    		return false;
	    	}else{
	    		return true;
	    	}
		 }
		 
		 function checkBalance(){
		 	if(addStudent.balance.value=="" || addStudent.balance.value==null){
	    		alert("请输入余额！");
	    		addStudent.balance.focus();
	    		return false;
	    	}else{
	    		return true;
	    	}
		 }
		 
		 function checkTime(){
		 	if(addStudent.time.value=="" || addStudent.time.value==null){
	    		alert("请输入入学时间！");
	    		addStudent.time.focus();
	    		return false;
	    	}else{
	    		return true;
	    	}
		 }
		 
		 function checkConsultId(){
		 	if(addStudent.consultId.value=="" || addStudent.consultId.value==null){
	    		alert("请输入咨询编号！");
	    		addStudent.consultId.focus();
	    		return false;
	    	}else{
	    		return true;
	    	}
		 }
	</script>

  </head>
  
  <body>
    <center> <h1>添加学生</h1>
    	<div style="width:300px;">
    		<form  name="addStudent" action="marketing!addStudent.action" method="post">
    			<fieldset>
    				
    				<div class="input-group input-group-sm">
	 	 				<span class="input-group-addon">学生姓名</span>
						<input id="name" name="studentInfo.studentName" type="text" class="form-control">
					</div>
				
					<div class="input-group input-group-sm">
	 	 				<span class="input-group-addon">学生学号</span>
						<input id="no" name="studentInfo.studentNo" type="text" class="form-control">
					</div>
					
					<input id="password" type="hidden" name="studentInfo.studentPass" value="E10ADC3949BA59ABBE56E057F20F883E"/>
					
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
						<input id="cla" name="studentInfo.classInfo.classId" type="text" class="form-control">
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
	 	 				<select name="studentInfo.rollState.rollstateId" type="text" class="form-control">
							<option value="1">在校学生</option>
							<option value="2">退学</option>
							<option value="3">毕业</option>
						</select>
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
	 	 				<input type="text" id="time" name="studentInfo.attendTime" class="form-control" value="2012-05-15 21:05:00" data-date-format="yyyy-mm-dd hh:ii:ss">
					</div>
					
					<input type="hidden" name="studentInfo.studentState" value="1"/>
					
					<div class="input-group input-group-sm">
	 	 				<span class="input-group-addon">备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注</span>
						<input id="remark" name="studentInfo.studentRemark" type="text" class="form-control">
					</div>
					
					
					<button class="btn btn-default" onclick="return check()" >确认添加</button>
    			</fieldset>
    		</form>
    		
    		<script type="text/javascript" src="js/jquery.js" charset="UTF-8"></script>
			<script type="text/javascript" src="js/bootstrap.min.js"></script>
    		<script type="text/javascript" src="js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
			<script type="text/javascript" src="js/locales/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
    		<script type="text/javascript">
    		$('#time').datetimepicker({
    		autoclose:true,
    		todayBtn:true,
    		todayHighlight:true,
    		language:'zh-CN',
    		
    		});
    		</script>
    		
		</div>
   </center>
  </body>
</html>
