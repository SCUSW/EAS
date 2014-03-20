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
						<option value="${v.vocationId }" ${v.vocationId eq request.staff.positionInfo.vocationId?"selected":"" }>${v.vocationId }.${v.vocationName }</option>
					</c:forEach>
				</SELECT>
		</div>
		
		
		<div class="">
 	 			<span class="">选择员工归属权限组:</span>
				
				<SELECT class="form-control" name="staff.groupInfo.groupId" id="group" >
					<c:forEach items="${request.groups }" var="g">
						<option value="${g.groupId }" ${g.groupId eq request.staff.groupInfo.groupId?"selected":"" } >${g.groupId }.${g.groupName }</option>
					</c:forEach>
				</SELECT>
		</div>
		
		
		</div>
		
		<div style="width:300px;">
		<div class="input-group input-group-sm">
 	 			<span class="input-group-addon">员工账号</span>
				<input id="staffNo" type="text" width="30" name="staff.staffNo"  readonly="readonly" value="${request.staff.staffNo }"  class="form-control" >
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
				<input id="staffName" type="text" width="30" name="staff.staffName" value="${request.staff.staffName }"  class="form-control" >
			</div>
		</div>
		
		<div style="width:300px;">
		<div class="input-group input-group-sm">
 	 			<span class="input-group-addon">员工性别</span>
 	 			<select id="staffSex" name="staff.staffSex" >
 	 				<option value="0" ${request.staff.staffSex eq 0?"selected":"" } >女</option>
 	 				<option value="1" ${request.staff.staffSex eq 1?"selected":"" } >男</option>
 	 			</select>
			</div>
		</div>
		
		<div style="width:300px;">
		<div class="input-group input-group-sm">
 	 			<span class="input-group-addon">手机号码</span>
				<input id="staffPhone" type="text" width="30" name="staff.staffPhone" 
				onafterpaste="this.value=this.value.replace(/\D/g,'')" 
				onkeyup="this.value=this.value.replace(/\D/g,'')" 
				onkeypress="if(window.event.keyCode<48 || window.event.keyCode>57) window.event.keyCode = 0;"
				 value="${request.staff.staffPhone }"  class="form-control" >
			</div>
		</div>
		
		<div style="width:300px;">
		<div class="input-group input-group-sm">
 	 			<span class="input-group-addon">QQ&nbsp;&nbsp;号码</span>
				<input id="staffQq" type="text" width="30" name="staff.staffQq" 
				onafterpaste="this.value=this.value.replace(/\D/g,'')" 
				onkeyup="this.value=this.value.replace(/\D/g,'')" 
				onkeypress="if(window.event.keyCode<48 || window.event.keyCode>57) window.event.keyCode = 0;"
				 value="${request.staff.staffQq }"  class="form-control" >
			</div>
		</div>
		
		<div style="width:300px;">
		<div class="input-group input-group-sm">
 	 			<span class="input-group-addon">身份证号</span>
				<input id="staffIdcard" type="text" width="30"  readonly="readonly" name="staff.staffIdcard"0 
				onafterpaste="this.value=this.value.replace(/\D/g,'')" 
				onkeyup="this.value=this.value.replace(/\D/g,'')" 
				onkeypress="if(window.event.keyCode<48 || window.event.keyCode>57) window.event.keyCode = 0;" 
				value="${request.staff.staffIdcard }"  class="form-control" >
			</div>
		</div>
		
		<div style="width:300px;">
		<div class="input-group input-group-sm">
 	 			<span class="input-group-addon">入职时间</span>
				<input id="staffEmplTime" type="text" width="30" name="staff.staffEmplTime" 
				 readonly="readonly" disabled="disabled" value="${request.staff.staffEmplTime }"  class="form-control" >
			</div>
		</div>
		
		
		
		
		
		<div style="width:300px;">
		<div class="input-group input-group-sm">
 	 			<span class="input-group-addon">备注信息</span>
				<textarea class="form-control"  name="staff.staffOthers" rows="10" cols="30">${request.staff.staffOthers }</textarea>  
			</div>
		</div>
		
		<input class="btn btn-default" type="button" name="update" value="提交修改" onclick="check()" />
		</form>	
		
		 <script type="text/javascript">
		    function check(){
		    	if(addStaff.staffNo.value==""){
		    		alert("请输入员工账号！");
		    		addStaff.staffNo.focus();
		    		return;
		    	}if(addStaff.staffPass.value==""){
		    		alert("请输入员工密码！");
		    		addStaff.staffPass.focus();
		    		return;
		    	}if(addStaff.staffName.value==""){
		    		alert("请输入员工姓名！");
		    		addStaff.staffName.focus();
		    		return;
		    	}else{
		    		addStaff.submit();
		    	}
		    }
	    </script>
		
		
		</div>
	</center>
	</body>
</html>