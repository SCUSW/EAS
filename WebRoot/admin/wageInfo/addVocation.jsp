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


<!-- 	


	<script type="text/javascript" src="js/jquery.js">
	
		$(document).ready(function(){
				
				$("#branch").change(function(){
					var branch = $(this).val();
					var department =$("#department");
					$("#department option").remove();
					$.post("vocationAction.action",{sf:branch},function(data){
						alert(data.sf);
						for(var i=0;i<data.list.length;i++){
							department.append("<option value="+ data.list[i].departmentId+">"+data.list[i].departmentName+"</option>");
						}
					})
				});
			
			});
	
	</script> 
	
	
-->
	
	
	
	
	
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/main.js"></script>



	

  </head>
 
<!-- 	<body bgcolor="#ffff99" onLoad="loadBranch()"> -->
  		<body >
  		 <center>
  		 <br/>
	  	<div id="addvoc">
	  	
		<form id="addVocation" name="addVocation" action="vocationManage!addVocation3.action" method="post">
		
	
		
		<div style="width:300px;">
		<div class="">
 	 			<span class="">选择职类所属部门:</span>
				
				<SELECT class="form-control" name="vocation.departmentInfo.departmentId" id="department" >
					<c:forEach items="${request.departments }" var="d">
						<option value="${d.departmentId }">${d.departmentId }.${d.departmentName }</option>
					</c:forEach>
				</SELECT>
		</div>
		
		</div>
		
		<div style="width:300px;">
		<div class="input-group input-group-sm">
 	 			<span class="input-group-addon">职位名称</span>
				<input id="name" type="text" width="30" name="vocation.vocationName"  class="form-control" >
			</div>
		</div>
		
		<div style="width:300px;">
		<div class="input-group input-group-sm">
 	 			<span class="input-group-addon">工资基数</span>
				<input id="wagebase" type="text" width="30" name="vocation.wageBase" onafterpaste="this.value=this.value.replace(/\D/g,'')" onkeyup="this.value=this.value.replace(/\D/g,'')" onkeypress="if(window.event.keyCode<48 || window.event.keyCode>57) window.event.keyCode = 0;" value=""  class="form-control" >
			</div>
		</div>
		
		<div style="width:300px;">
		<div class="input-group input-group-sm">
 	 			<span class="input-group-addon">备注信息</span>
				<textarea class="form-control"  name="vocation.remark" rows="10" cols="30"></textarea>  
			</div>
		</div>
		
		<input class="btn btn-default" type="button" name="add" value="确定添加" onclick="check()" />
		</form>	
		
		 <script type="text/javascript">
		    function check(){
		    	if(addVocation.name.value==""){
		    		alert("请输入分支机构名称！");
		    		addVocation.name.focus();
		    		return;
		    	}else{
		    		addVocation.submit();
		    	}
		    }
	    </script>
		
		
		</div>
	</center>
	</body>
</html>