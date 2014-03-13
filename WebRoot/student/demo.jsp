<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'demo.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/main.js"></script>
	
	<style type="text/css">
		body{
			background-image: url(image/background.jpg);
			background-repeat: repeat;
		}
		#guide{
			float: right;
			margin-top:-80px;
			position:relative;
			z-index:100;
			left:-7px;
			padding-bottom: 0px;
			display:none;
			
			
			
		}
		#guiderow{
			height:110px;
		}
		#td{
			width:10px;
			padding-left: 20px;
			padding-right:22px;
			font-size:12px;
			font-family:"微软雅黑";
		}
		#myContent{
			display:none;
			margin-top:-580px;
			margin-left:340px;
			width:900px;
			height:500px;
			border-left-color: red;
			border-right-color:yellow ;
			border-top-color:;
			border-bottom-color:#77d0bd;
			border-style: solid;
		}
	</style>
	<script>
		$(document).ready(function(){
			$("#guide").fadeIn(3000);
			$("#myContent").fadeIn(3000);
		});	
	</script>
		
  </head>
  
  <body>
   <div class="container-fluid">
	<div class="row-fluid" >
		<div class="span12">
				<%@ include file="../include/banner.jsp" %>
		</div>
	</div>
	<div  class="row-fluid" >
		<div id="guiderow" class="span12">
			
			<%@ include file="../include/topGuide.jsp" %>
			<div  id="guide">
				<table class="mytable">
					<tr>
						<td id="td"><a href="student/showInfo.jsp" target="text">个人信息</a></td>
						<td id="td"><a href="student/updateStudent.jsp" target="text">修改信息</a></td>
						<td id="td"><a href="student/showNotice.jsp" target="text">公告查询</a></td>
						<td id="td"><a href="student/showMajorInfo.jsp" target="text">专业查询</a></td>
						<td id="td">&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td id="td">&nbsp;&nbsp;&nbsp;&nbsp;</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<div class="row-fluid">
		<div class="span4">

		<div style="height:1px;"></div>
			<%@ include file="../include/leftGuide.jsp" %>
			<%@ include file="/include/footer.html"%>
		</div>	
		<div class="span8">
			<div  id="myContent">
				<center><iframe width="900" height="500" frameborder="0" name="text" scrolling="yes" src="student/showInfo.jsp" ></iframe></center>
			</div>
		</div>
	</div>
	
</div>
  </body>
</html>
