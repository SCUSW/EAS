<%@page import="com.scusw.util.CheckPrivilege"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" >
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'demo.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/minDemo.js"></script>
	
	
	
	<style type="text/css"><!--
		body{
			background-image: url(image/background.jpg);
			background-repeat: repeat;
		}
		
		#guiderow{
			height:110px;
		}
		
		#myContent{
			
			margin-top:-130px;
			margin-left:340px;
			width:910px;
			height:505px;
			border-left-color: red;
			border-right-color:yellow ;
			border-top-color:;
			border-bottom-color:#77d0bd;
			border-style: solid;
			display:none;
			z-index:1000;
			position:relative;
		}
		
		
		 a.mytable:link{
		 	color:white;
			text-decoration:none;
		}
		a.mytable:visited{
			color:white;
			text-decoration:none;
		}
		a.mytable:hover{
			color:black;
			text-decoration:none;
		}
	
		#min_1{
			left:702px;
		}
		#min_2{
			left:602px;
		}
		#min_3{
			left:502px;
		}
		#min_4{
			left:402px;
		}
		#min_5{
			left:302px;
		}
		#min_6{
			left:202px;
		}
		#min_7{
			left:102px;
		}
		#min_8{
			left:102px;
		}
		#min_9{
			left:58px;
		}
		
		#min_guide a:link{
			color:white;
		}
		#min_guide a:visited{
			color:white	;
		}
		#min_guide a:hover{
			color:black;
			text-decoration: none;
		}
		#min_guide{
			width:790px;
			margin-bottom: 30px;
			margin-left:400px;
			background-color: #c9d4e0;
			height:40px;
		}
		#min_guide_box{
			display:none;
		}
		
		#min_cguide{
			position:relative;
			top:200px;
			font-size:18px;
			font-family: "微软雅黑";
		}
		#min_cguide div{
			position:relative;
			height:55px;
			left:-100px;
		}
	--></style>
	</head>
  
  <body>
  <%
  if(!com.scusw.util.CheckLogin.checkLogin()){
%>
<%
}
   %>
   <div class="container-fluid">
	<div class="row-fluid" >
		<div class="span12">
				<%@ include file="../include/banner.jsp" %>
		</div>
	</div>
	
	<div  class="row-fluid" >
		<div id="guiderow" class="span12">
			
			<%@ include file="../include/topGuide.jsp" %>
			<div id="min_guide" >
				<div id="min_guide_box" >
				<ul class="nav nav-pills ">
 				 <li id="min_1" class="active"><a href="privilegeManage!listPrivilege.action" target="text">用户权限</a></li>
 				 <li id="min_2"><a href="branchManage!listBranch.action" target="text">分支机构</a></li>
  				 <li id="min_3"><a href="departmentManage!listDepartment.action" target="text">部门信息</a></li>
  				 <li id="min_4"><a href="teaLevelManage!listTeaLevel.action" target="text">教师等级</a></li>
  				 <li id="min_5"><a href="attandant!checkStuAttendant.action" target="text">考勤信息</a></li>
  				 <li id="min_6"><a href="vocationManage!listVocation.action" target="text">工资管理</a></li>
  				 <li id="min_7"><a href="grade!queryGrade.action" target="text">年级管理</a></li>
  				 <li id="min_8"><a href="class!queryClass.action" target="text">班级管理</a></li>
  				 <li id="min_9" class="disabled"><a target="text">工作日程</a></li>
  				 
				</ul>
				</div>
				
			</div>
		<%@ include file="../include/leftGuide.jsp" %>
		<%@ include file="/include/footer.html"%>	
		</div>
	</div>
	
	<div  style="position:relative;z-index:100" class="row-fluid">
		<div class="span4">
			<div  id="min_cguide">
				<div id="element1"><a id="td11" class="mytable" href="privilegeManage!listPrivilege.action" target="text">权限列表</a></div>
				<div id="element2"><a id="td12" class="mytable" href="privilegeManage!listGroup.action" target="text">查看用户组</a></div>
				<div id="element3"><a id="td13" class="mytable" href="privilegeManage!addGroup1.action" target="text">增加用户组</a></div>			
			</div>
		</div>	
		
		<div class="span8">
			<div  id="myContent">
				<center><iframe width="900" height="500" frameborder="0" name="text" scrolling="yes" src="<%=basePath %>privilegeManage!listPrivilege.action" ></iframe></center>
			</div>
				
		</div>
	</div>
</div>
  </body>
</html>
