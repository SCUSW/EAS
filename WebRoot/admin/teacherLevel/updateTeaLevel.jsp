<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'updateBranch.jsp' starting page</title>
    
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
  	<center>
  	<div id="updatelev">
  	<br/>
	<form name="updateTeaLevel" action="<%=basePath %>teaLevelManage!updateTeaLevel2.action" method="post">
	<input type="hidden" name="teaLevel.levelAvai" value="${request.teaLevel.levelAvai}"/>
	
	<div style="width:300px;">
		<div class="input-group input-group-sm">
 	 			<span class="input-group-addon">级别编号</span>
				<input id="lid" type="text" width="30" readonly="readonly" name="teaLevel.levelId" value="${request.teaLevel.levelId }"  class="form-control" >
			</div>
		</div>
	
	<div style="width:300px;">
		<div class="input-group input-group-sm">
 	 			<span class="input-group-addon">级别名称</span>
				<input id="name" type="text" width="30" name="teaLevel.levelName" value="${request.teaLevel.levelName }" class="form-control" >
			</div>
		</div>
	
	<div style="width:300px;">
		<div class="input-group input-group-sm">
 	 			<span class="input-group-addon">基本课时</span>
				<input id="hour" type="text" width="30" name="teaLevel.baseClassHour" onafterpaste="this.value=this.value.replace(/\D/g,'')" onkeyup="this.value=this.value.replace(/\D/g,'')" onkeypress="if(window.event.keyCode<48 || window.event.keyCode>57) window.event.keyCode = 0;" value="${request.teaLevel.baseClassHour }" class="form-control" >
			</div>
		</div>
		
	<div style="width:300px;">
		<div class="input-group input-group-sm">
 	 			<span class="input-group-addon">课&nbsp;&nbsp;时&nbsp;&nbsp;费</span>
				<input id="cost" type="text" width="30" name="teaLevel.classCost" onafterpaste="this.value=this.value.replace(/\D/g,'')" onkeyup="this.value=this.value.replace(/\D/g,'')" onkeypress="if(window.event.keyCode<48 || window.event.keyCode>57) window.event.keyCode = 0;" value="${request.teaLevel.classCost }" class="form-control" >
			</div>
		</div>	
	
	<div style="width:300px;">
		<div class="input-group input-group-sm">
 	 			<span class="input-group-addon">备注信息</span>
				<textarea class="form-control" name="teaLevel.levelRemark" rows="10" cols="30" >${request.teaLevel.levelRemark }</textarea><br/>
			</div>
		</div>	
	
	<input class="btn btn-default" type="button" name="sub" value="提交修改" onclick="check()" />	
	</form>	
	
	<script type="text/javascript">
	    function check(){
	    	if(updateTeaLevel.name.value==""){
	    		alert("请输入分支机构名称！");
	    		updateTeaLevel.name.focus();
	    		return;
	    	}if(updateTeaLevel.hour.value=="" || updateTeaLevel.hour.value==""){
				alert("请输入基本课时和课时费!");
				updateTeaLevel.hour.focus();
	    		return;
			}if(isNaN(updateTeaLevel.hour.value)){
				alert("基本课时-请输入数字!");
				alert("请输入基本课时和课时费!");
				updateTeaLevel.hour.focus();
	    		return;
			}if(isNaN(updateTeaLevel.cost.value)){
				alert("课时费-请输入数字!");
				alert("请输入基本课时和课时费!");
				updateTeaLevel.cost.focus();
	    		return;
			}else{
	    		updateTeaLevel.submit();
	    	}
	    }
    </script>
	
	
	</div>
	</center>
	</body>
</html>
