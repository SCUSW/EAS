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
	<link href="css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
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
			var account=$("account").value;
			var pass=$("pass").value;
			var name=$("name").value;
			var idCard=$("idCard").value;
			var number=$("number").value;
			var major=$("major").value;
			var time=$("time").value;
			
			if(isNull(account)){
				alert('用户不能为空');
				return false;
			}
			if(isNull(pass)){
			alert("密码不能为空");
			return false;
			}
			if(isNull(name)){
			alert("姓名不能为空");
			return false;
			}
			if(isNull(idCard)){
			alert("身份证不能为空");
			return false;
			}
			if(isNull(time)){
			alert("身份证不能为空");
			return false;
			}
		if(isNull(major)){
			alert("专业不能为空");
			return false;
			}
			if(isNull(number)){
			alert("教师号不能为空");
			return false;
			}
			else{
				return true;
			}
		}
  </script>
  <body>
   <center> <h1>添加老师</h1><br/>
   	<form action="educational!addTeacher.action" method="post">
   	   <div style="width:300px;">
		   	<div class="input-group input-group-sm">
	 			<span class="input-group-addon">登录帐号</span>
				<input name="teacher.staffInfo.staffNo" id="account" type="text" class="form-control"><font color="red">${hasNo}</font>
			</div>
		</div>
		<div style="width:300px;">
		   	<div class="input-group input-group-sm">
	 			<span class="input-group-addon">登录密码</span>
				<input name="teacher.staffInfo.staffPass" id="pass" type="text" class="form-control">
			</div>
		</div>
   	  	<div style="width:300px;">
		   	<div class="input-group input-group-sm">
	 			<span class="input-group-addon">姓名</span>
				<input name="teacher.staffInfo.staffName" id="name" type="text" class="form-control">
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
				<input name="teacher.staffInfo.staffIdcard" id="idCard" type="text" class="form-control"><font color="red">${hasIdcard}</font>
			</div>
		</div>
		
		<div style="width:300px;">
		   	<div class="input-group input-group-sm">
	 			<span class="input-group-addon">聘用时间</span>
				<input type="text" id="time" name="teacher.staffInfo.staffEmplTime" class="form-control" value="2014-03-20 21:05:00" data-date-format="yyyy-mm-dd hh:ii:ss">
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
				<input name="teacher.teacherMajor" id="major"
				 type="text" class="form-control"><font color="red">${emptyMajor}</font>
			</div>
		</div>
		
		<div style="width:300px;">
		   	<div class="input-group input-group-sm">
	 			<span class="input-group-addon">教师编号</span>
				<input name="teacher.teacherNo" id="number"
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
		
		
	 			
				<input name="teacher.teacherSalary"
				 type="hidden" class="form-control"
				 value="0">

		
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
	 			<span class="input-group-addon">用户组</span>
				<select class="form-control" name="teacher.staffInfo.groupInfo.groupId">
		   		<c:forEach items="${group}" var="g">
		   		    <option value="${g.groupId}">${g.groupName} </option>  
		   		 </c:forEach>
		   		</select>
			</div>
		</div>
		
   		<div style="width:300px;">
		   	<div class="input-group input-group-sm">
	 			<span class="input-group-addon">职类</span>
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
   		
   		<input class="btn btn-default" type="submit" value="确定添加" onclick="return check1()"/>
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
   </center>
  </body>
</html>
