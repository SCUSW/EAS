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
    
    <title>My JSP 'addVocation.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	
	<link rel="stylesheet" type="text/css" href="css/body.css">
	
	
	<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	
	
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/main.js"></script>



	

  </head>
 
  		<body >
  		 <center>
  		 <br/>
	  	<div id="addsta">
	  	
		<form id="addStaff" name="addStaff" action="setStaff!addStaff4.action" method="post">
		
	
		
		<div style="width:300px;">
		<div class="">
 	 			<span class="">选择员工职位:</span>
				
				<SELECT class="form-control" name="staff.positionInfo.vocationId" id="vocation" >
					<c:forEach items="${request.vocations }" var="v">
						<option value="${v.vocationId }">${v.vocationId }.${v.vocationName }</option>
					</c:forEach>
				</SELECT>
		</div>
		
		
		<div class="">
 	 			<span class="">选择员工归属权限组:</span>
				
				<SELECT class="form-control" name="staff.groupInfo.groupId" id="group" >
					<c:forEach items="${request.groups }" var="g">
						<option value="${g.groupId }">${g.groupId }.${g.groupName }</option>
					</c:forEach>
				</SELECT>
		</div>
		
		
		</div>
		
		<div style="width:300px;">
		<div class="input-group input-group-sm">
 	 			<span class="input-group-addon">员工账号</span>
				<input id="staffNo" type="text" width="30" name="staff.staffNo" value=""  class="form-control" >
			</div>
		</div>
		
		
		<div style="width:300px;">
		<div class="input-group input-group-sm">
 	 			<span class="input-group-addon">员工密码</span>
				<input id="staffPass" type="text" width="30" name="staff.staffPass" value=""  class="form-control" >
			</div>
		</div>
		
		<div style="width:300px;">
		<div class="input-group input-group-sm">
 	 			<span class="input-group-addon">员工姓名</span>
				<input id="staffName" type="text" width="30" name="staff.staffName" value=""  class="form-control" >
			</div>
		</div>
		
		<div style="width:300px;">
		<div class="input-group input-group-sm">
 	 			<span class="input-group-addon">员工性别</span>
 	 			<select id="staffSex" name="staff.staffSex" >
 	 				<option value="0">女</option>
 	 				<option value="1">男</option>
 	 			</select>
			</div>
		</div>
		
		<div style="width:300px;">
		<div class="input-group input-group-sm">
 	 			<span class="input-group-addon">手机号码</span>
				<input id="staffPhone" type="text" width="30" name="staff.staffPhone" onafterpaste="this.value=this.value.replace(/\D/g,'')" onkeyup="this.value=this.value.replace(/\D/g,'')" onkeypress="if(window.event.keyCode<48 || window.event.keyCode>57) window.event.keyCode = 0;" value=""  class="form-control" >
			</div>
		</div>
		
		<div style="width:300px;">
		<div class="input-group input-group-sm">
 	 			<span class="input-group-addon">QQ&nbsp;&nbsp;号码</span>
				<input id="staffQq" type="text" width="30" name="staff.staffQq" onafterpaste="this.value=this.value.replace(/\D/g,'')" onkeyup="this.value=this.value.replace(/\D/g,'')" onkeypress="if(window.event.keyCode<48 || window.event.keyCode>57) window.event.keyCode = 0;" value=""  class="form-control" >
			</div>
		</div>
		
		<div style="width:300px;">
		<div class="input-group input-group-sm">
 	 			<span class="input-group-addon">身份证号</span>
				<input id="staffIdcard" type="text" width="30" name="staff.staffIdcard"0 
				onafterpaste="this.value=this.value.replace(/\D/g,'')" 
				onkeyup="this.value=this.value.replace(/\D/g,'')" 
				onkeypress="if(window.event.keyCode<48 || window.event.keyCode>57) window.event.keyCode = 0;" 
				value=""  class="form-control" >
			</div>
		</div>
		
		
		
		
		
		<div style="width:300px;">
		<div class="input-group input-group-sm">
 	 			<span class="input-group-addon">备注信息</span>
				<textarea class="form-control"  name="staff.staffOthers" rows="10" cols="30"></textarea>  
			</div>
		</div>
		
		<input class="btn btn-default" type="button" name="add" value="确定添加" onclick="check()" />
		</form>	
		
		 <script type="text/javascript">
		    function check(){
		    	if(!isNumberOrLetter(addStaff.staffNo.value)){
		    		alert("请正确输入员工账号（6到16个字符,包括字母和数字）！");
		    		addStaff.staffNo.focus();
		    		return;
		    	}if(!idNumber(addStaff.staffIdcard.value)){
		    		alert("请正确填写18位或15位身份证号码");
		    		addStaff.staffIdcard.focus();
		    		return;
		    	}if(!isMobileNO(addStaff.staffPhone.value)){
		    		alert("手机号码格式不对");
		    		addStaff.staffPhone.focus();
		    		return;
		    	}if(addStaff.staffPass.value==""){
		    		alert("请输入员工密码！");
		    		addStaff.staffPass.focus();
		    		return;
		    	}if((addStaff.staffQq.value.length>11 || addStaff.staffQq.value.length<5) && addStaff.staffQq.value!=""){
		    		alert("请正确输入QQ！");
		    		addStaff.staffQq.focus();
		    		return;
		    	}if(addStaff.staffName.value==""){
		    		alert("请输入员工姓名！");
		    		addStaff.staffName.focus();
		    		return;
		    	}else{
		    		addStaff.submit();
		    	}
		    }
		    
		    function idNumber(s)//身份证验证
	           {
	             regu1=/^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$/;//15wei
	             regu2=/^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{4}$/;//18wei
	             re1=new RegExp(regu1);
	             re2=new RegExp(regu2);
	            
	             if(!(re1.test(s)||re2.test(s)))
	             {
	            	 return false;
//	                   document.getElementById ("idCardInf").innerHTML="格式不对！";
//	                   document.getElementById ("idCardInf").style.color="red";
	               
	             }
	             else
	             {
	            	 return true;
//	                  document.getElementById ("idCardInf").innerHTML="通过！";
//	                  document.getElementById ("idCardInf").style.color="green";
//	                  document.getElementById ("idCardCheck").innerHTML="";
	             }
	            
//	             alert("请正确填写18位或15位身份证号码");
	           }
		    
		    function isMobileNO(s)//手机验证
	           {
	             var a = /^((\(\d{3}\))|(\d{3}\-))?13\d{9}|15\d{9}$/ ;
	           if( !s.match(a) )
	           {
	        	   return false;
//	               document.getElementById ("mobileNOInf").innerHTML="格式不对！";
//	               document.getElementById ("mobileNOInf").style.color="red";
//	                   alert("手机号码格式不对");
	           }
	           else
	           {
	        	   return true;
//	                  document.getElementById ("mobileNOInf").innerHTML="通过！";
//	                  document.getElementById ("mobileNOInf").style.color="green";
//	                  document.getElementById ("mobileNOCheck").innerHTML="";
	           }
//13和15开头的号码 
	         }
		    
		    
		    
		    
//			用户名验证：匹配规则为6到16个字符（包括字母和数字）。代码如下：

		    function isNumberOrLetter(s)//判断是否是数字或字母,用于验证用户名，失去焦点验证。
		    {
		               var regu = "^[0-9a-zA-Z]{6,16}$";
		               var re = new RegExp(regu);
		               if (!re.test(s))
		               {
		            	   return false;
//		               document.getElementById ("userInf").innerHTML="用户名格式不对！";
//		               document.getElementById ("userInf").style.color="red";
		              
		               }
		               else
		               {
		            	   return true;
//		               document.getElementById ("userInf").innerHTML="用户名通过！";
//		               document.getElementById ("userInf").style.color="green";
//		                document.getElementById ("userIDCheck").innerHTML="";
//		    
		               }
             }
             
	    </script>
		
		
		</div>
	</center>
	</body>
</html>