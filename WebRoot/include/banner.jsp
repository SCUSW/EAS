<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   
    
    <title>My JSP 'index.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	
	<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/main.js"></script>
	
	<link rel="stylesheet" type="text/css" href="styles.css">
	


	<style type="text/css">
		#left{
			margin-left:-263px;
			
		}
		#right{
			
			margin-top:-155px;
			margin-left:863px;
		}
		#banner_text{
			position:relative;
			text-align:center;
			font-size:20px;
			font-family:"张海山锐线体简";
			margin-top:-28px;
			margin-left:-1155px;
			top:-90px;
			display:none;
		}
	</style>
	<script>
			
		$(document).ready(function(){
			$("#left").ready(function(){
				$("#left").animate({marginLeft:'0px'},200);
				$("#right").animate({marginLeft:'263px'},200);
				$("#banner_text").show(3000);
			});
		})
	
	</script>
		
	</head>
  <body>
  	<div id="left"><img src="image/banner_left.png"/></div>
  	<div id="right"><img src="image/banner_right.png" border="0" usemap="#Map"/>
      <map name="Map">
        <area shape="rect" coords="966,126,1026,147" href="./demo.jsp">
        <area shape="rect" coords="1033,127,1093,146" href="./login!loginOut.action">
      </map>
  	</div>
  	<div id="banner_text">欢迎您!<br/>${session.studentName} </div>
  	<s:debug></s:debug>
  
  </body>
</html>


