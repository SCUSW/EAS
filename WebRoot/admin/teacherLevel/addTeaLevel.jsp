<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'addGroup.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<style type="text/css">
	div#addlev {
	text-align:left;
	background-color:#ffff99;
	}
	h2 {margin-bottom:0; font-size:14px;}
	ul {margin:0;}
	li {list-style:none;margin-top: 5px;}
	a {text-decoration:none;}
	</style>

  </head>
  
  <body>
  
  	<div id="addlev">
  	
	<form name="addTeaLevel" action="<%=basePath %>teaLevelManage!addTeaLevel.action" method="post">
	
	级别名称：<input id="name" type="text" width="30" name="teaLevel.levelName"/><br/>
	基本课时：<input id="hour" type="text" width="30" name="teaLevel.baseClassHour" onafterpaste="this.value=this.value.replace(/\D/g,'')" onkeyup="this.value=this.value.replace(/\D/g,'')" onkeypress="if(window.event.keyCode<48 || window.event.keyCode>57) window.event.keyCode = 0;" value="" /><br/>
	&nbsp;课&nbsp;时&nbsp;费：<input id="cost" type="text" width="30" name="teaLevel.classCost" onafterpaste="this.value=this.value.replace(/\D/g,'')" onkeyup="this.value=this.value.replace(/\D/g,'')" onkeypress="if(window.event.keyCode<48 || window.event.keyCode>57) window.event.keyCode = 0;" value="" /><br/>
	备注信息：<textarea name="teaLevel.levelRemark" rows="10" cols="30"></textarea><br/>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="button" name="sub" value="确定添加" onclick="check()" />
	
	</form>	
	
	<script type="text/javascript">
	    function check(){
	    	if(addTeaLevel.name.value==""){
	    		alert("请输入分支机构名称！");
	    		addTeaLevel.name.focus();
	    		return;
	    	}if(addTeaLevel.hour.value=="" || addTeaLevel.hour.value==""){
				alert("请输入基本课时和课时费!");
				addTeaLevel.hour.focus();
	    		return;
			}if(isNaN(addTeaLevel.hour.value)){
				alert("基本课时-请输入数字!");
				alert("请输入基本课时和课时费!");
				addTeaLevel.hour.focus();
	    		return;
			}if(isNaN(addTeaLevel.cost.value)){
				alert("课时费-请输入数字!");
				alert("请输入基本课时和课时费!");
				addTeaLevel.cost.focus();
	    		return;
			}else{
	    		addTeaLevel.submit();
	    	}
	    }
    </script>
	
	
	</div>
	
	</body>
</html>