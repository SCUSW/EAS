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
		 	if(checkName()&&checkAge()&&checkMobile()&&checkSchool()&&checkAddress()&&checkMajor()&&checkTime())
		 		return true;
		 	else 
		 		return false;
		 }
		 
		 function checkAge(){
		 	if(addConsultInfo.age.value<=0 || addConsultInfo.age.value=="" || addConsultInfo.age.value==null){
		 		alert("请输入正确的年龄");
		 		addConsultInfo.age.focus();
		 		return false;
		 	}
		 	return true;
		 }
		  
		 function checkName(){
		 	if(addConsultInfo.name.value=="" || addConsultInfo.name.value==null){
	    		alert("请输入姓名！");
	    		addConsultInfo.name.focus();
	    		return false;
	    	}else{
	    		return true;
	    	}
		 }
		 
		 function checkPhone() {
		 	var strPhone = addConsultInfo.phone.value;
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
			var strPhone = addConsultInfo.phone.value;
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
		 	if(addConsultInfo.school.value=="" || addConsultInfo.school.value==null){
	    		alert("请输入学校！");
	    		addConsultInfo.school.focus();
	    		return false;
	    	}else{
	    		return true;
	    	}
		 }
		 
		 function checkMajor(){
		 	if(addConsultInfo.major.value=="" || addConsultInfo.major.value==null){
	    		alert("请输入专业！");
	    		addConsultInfo.major.focus();
	    		return false;
	    	}else{
	    		return true;
	    	}
		 }
		 
		 function checkAddress(){
		 	if(addConsultInfo.address.value=="" || addConsultInfo.address.value==null){
	    		alert("请输入住址！");
	    		addConsultInfo.address.focus();
	    		return false;
	    	}else{
	    		return true;
	    	}
		 }
		 
		 function checkTime(){
		 	if(addConsultInfo.time.value=="" || addConsultInfo.time.value==null){
	    		alert("请输入咨询时间！");
	    		addConsultInfo.time.focus();
	    		return false;
	    	}else{
	    		return true;
	    	}
		 }
	</script>

  </head>
  
  <body>
    <center> <h1>添加咨询信息</h1>
    	<div style="color: red">${message}</div>
    	<div style="width:300px;">
    		<form id="add" name="addConsultInfo" action="marketing!addConsultInfo.action" method="post">
    			<fieldset>
    				<input type="hidden" name="consultInfo.salesmanInfo.staffId" value="${session.staffId}"/>
	   				<input type="hidden" name="consultInfo.salesmanInfo.staffInfo.staffNo" value="${session.staffNo}"/><br/>
    				
    				<div class="input-group input-group-sm">
	 	 				<span class="input-group-addon">学生姓名</span>
						<input id="name" name="consultInfo.studentName" type="text" class="form-control">
					</div>
				
				
					<div class="input-group input-group-sm">
	 	 				<span class="input-group-addon">学生性别</span>
						<select name="consultInfo.studentSex" type="text" class="form-control">
							<option value="1">男</option>
							<option value="0">女</option>
						</select>
					</div>
					
					
					<div class="input-group input-group-sm">
	 	 				<span class="input-group-addon">学生年龄</span>
						<input id="age" name="consultInfo.studentAge" type="text" class="form-control">
					</div>
					
					
					<div class="input-group input-group-sm">
	 	 				<span class="input-group-addon">学生学校</span>
						<input id="school" name="consultInfo.studentSchool" type="text" class="form-control">
					</div>
					
					
					<div class="input-group input-group-sm">
	 	 				<span class="input-group-addon">学生住址</span>
						<input id="address" name="consultInfo.studentAddr" type="text" class="form-control">
					</div>
					
					
					<div class="input-group input-group-sm">
	 	 				<span class="input-group-addon">学生电话</span>
						<input id="phone" name="consultInfo.studentPhone" type="text" class="form-control">
					</div>
					
					
					<div class="input-group input-group-sm">
	 	 				<span class="input-group-addon">学生专业</span>
						<input id="major" name="consultInfo.studentMajor" type="text" class="form-control">
					</div>
					
					
					<div class="input-group input-group-sm">
	 	 				<span class="input-group-addon">咨询时间</span>
						<input type="text" id="time" name="consultInfo.consultTime" class="form-control" value="2012-05-15 21:05:00" data-date-format="yyyy-mm-dd hh:ii:ss">
					</div>
					
					咨询方式：<input type="radio" checked="checked" name="consultInfo.consultType" value="现场咨询"/>现场咨询
						 <input type="radio" name="consultInfo.consultType" value="电话咨询"/>电话咨询
						 <input type="radio" name="consultInfo.consultType" value="网站咨询"/>网站咨询<br/>
					了解渠道：广告宣传<input type="checkbox" name="selectConsultwayId" value="1" checked="checked">&nbsp;
							   活动宣传<input type="checkbox" name="selectConsultwayId" value="2">&nbsp;
							   网络渠道<input type="checkbox" name="selectConsultwayId" value="3">&nbsp;<br/>
							   朋友介绍<input type="checkbox" name="selectConsultwayId" value="4">&nbsp;
							   学生介绍<input type="checkbox" name="selectConsultwayId" value="5">&nbsp;
							   教师介绍<input type="checkbox" name="selectConsultwayId" value="6"><br/>
					<div class="input-group input-group-sm">
	 	 				<span class="input-group-addon">备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注</span>
						<input id="remark" name="consultInfo.studentRemark" type="text" class="form-control">
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
