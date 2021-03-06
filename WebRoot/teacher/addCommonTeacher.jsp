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
    
    <title>My JSP 'updateuser.jsp' starting page</title>
    
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

	<script type="text/javascript" src="<%=basePath%>js/check.js"></script>
  </head>
	
	<script type="text/javascript" >
		$=function(t){
			if(!t)throw "args t can not be null";
			if(typeof t!="string"){
				t=t.toString();
			}
			if(t.charAt(0)=="@"){
					return document.getElementsByName(t);
				}
				return document.getElementById(t);
			
		}
		
		function check1(){
			var staffNo=$("staffNo").value;
			var staffName=$("staffName").value;
			var staffIdcard=$("staffIdcard").value;
			var teacherNo=$("teacherNo").value;
			var teacherMajor=$("teacherMajor").value;
			var teacherGraduate=$("teacherGraduate").value;
			if(isNull(staffNo)){
				alert('账号不能为空  >_<');
				return false;
			}
			if(isNull(staffName)){
				alert('姓名不能为空  >_<');
				return false;
			}
			if(isNull(staffIdcard)){
				alert('身份证号不能为空  >_<');
				return false;
			}
			if(isNull(teacherNo)){
				alert('教师证号不能为空  >_<');
				return false;
			}
			if(isNull(teacherMajor)){
				alert('专业不能为空  >_<');
				return false;
			}
			if(isNull(teacherGraduate)){
				alert('毕业学校不能为空  >_<');
				return false;
			}
			else{
				return true;
			}
		}
	</script>
	
  <body>
     <center> 
     <div style="width:300px;">
   	<form action="teacherAct!addCommonTeacher2.action" method="post">
   		<fieldset>
   			<div >
    	  <div id="legend" class=""><legend>增加任课教师</legend></div>
     </div>
      
     		<div class="input-group input-group-sm">
 	 			<span class="input-group-addon">账&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号</span>
				<input name="staff.staffNo" id="staffNo" type="text" class="form-control">
			</div>
				<div class="input-group input-group-sm">
 	 			<span class="input-group-addon">姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名</span>
				<input name="staff.staffName" id="staffName" type="text" class="form-control">
			</div>
			<!-- 
			<div class="input-group input-group-sm">
 	 			<span class="input-group-addon">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别</span>
				<input   name="staff.staffSex" type="text" class="form-control">
			</div>
			 -->
			 <div class="input-group input-group-sm">
 	 			<span  class="input-group-addon">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别</span>
				<select id="select" name="staff.staffSex"  class="form-control" >
				<option value=1>男</option>
     			 <option value=0>女</option>
     			 </select>
			</div>
			
			<div class="input-group input-group-sm">
 	 			<span class="input-group-addon">身份证号</span>
				<input  name="staff.staffIdcard" id="staffIdcard" type="text" class="form-control">
			</div>
			
			<div class="input-group input-group-sm">
 	 			<span class="input-group-addon">教师证号</span>
				<input  name="teacher.teacherNo" id="teacherNo" type="text" class="form-control">
			</div>
			
			<div class="input-group input-group-sm">
 	 			<span class="input-group-addon">专&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;业</span>
				<input  name="teacher.teacherMajor" id="teacherMajor" type="text" class="form-control">
			</div>
			
			<div class="input-group input-group-sm">
 	 			<span class="input-group-addon">毕业学校</span>
				<input  name="teacher.teacherGraduate" id="teacherGraduate" type="text" class="form-control">
			</div>
			<!--  
			<div class="input-group input-group-sm">
 	 			<span class="input-group-addon">教师等级</span>
				<input  name="teacherLevel.levelId" type="text" class="form-control">
			</div>
			-->
			<div class="input-group input-group-sm">
 	 			<span  class="input-group-addon">教师等级</span>
				<select id="select" name="teacherLevel.levelId"  class="form-control" >
					<c:forEach items="${teacherLevels}" var="t">
						<option value=${t.levelId }>${t.levelName}</option>
					</c:forEach>
     			 </select>
			</div>
			
			<div class="input-group input-group-sm">
 	 			<span class="input-group-addon">手&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;机</span>
				<input  name="staff.staffPhone" id="staffPhone" type="text" class="form-control">
			</div>
			
			<div class="input-group input-group-sm">
 	 			<span class="input-group-addon">Q&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Q</span>
				<input   name="staff.staffQq" id="staffQq" type="text" class="form-control">
			</div>
			<br/>
			
			<input class="btn btn-default" type="submit" value="确定添加" onclick="return check1()"/>
   		</fieldset>
   		<!--
	   	账号：<input type="text" name="staff.staffNo"/><br/>
   		姓名：<input type="text" name="staff.staffName"/><br/>
   		性别：<input type="text" name="staff.staffSex"/><br/>
   		身份证号：<input type="text" name="staff.staffIdcard"/><br/>
   		教师证号：<input type="text" name="teacher.teacherNo"/><br/>
   		专业：<input type="text" name="teacher.teacherMajor"/><br/>
   		毕业院校：<input type="text" name="teacher.teacherGraduate"/><br/>
   		教师等级：<input type="text" name="levelId"/><br/>
   		手机：<input type="text" name="staff.staffPhone"/><br/>
   		QQ：	<input type="text" name="staff.staffQq"/><br/>
   			<input type="submit" value="确定添加"/>
  		 -->
   </form>
   </div>
   <button class="btn btn-default" onclick=" window.history.back()">返回</button>
   </center>
  </body>
</html>
