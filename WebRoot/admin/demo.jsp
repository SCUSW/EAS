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
	<script type="text/javascript" src="js/main.js"></script>
	
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
	<script>
	
	//创建主导航函数
		function createMin(){
				$("#min_guide_box").show(1000,function(){
					$("#min_1").animate({left:'0px'},200,function(){
						$("#min_2").animate({left:'0px'},200,function(){
							$("#min_3").animate({left:'0px'},200,function(){
								$("#min_4").animate({left:'0px'},200,function(){
									$("#min_5").animate({left:'0px'},200,function(){
										$("#min_6").animate({left:'0px'},200,function(){
											$("#min_7").animate({left:'0px'},200,function(){
												$("#min_8").animate({left:'0px',marginTop:'0px'},200,function(){
													$("#min_9").animate({left:'0px'});
												});
											});
										});
									});
								});	
							});
						});
					});
				});
		}
		
		//动作——清除子导航
		function clearElement1(){
			$("#element1").animate({left:'-100px'},200);
			$("#b1").animate({marginLeft:'-150px'},200);
		}
		function clearElement2(){
			$("#element2").animate({left:'-100px'},200);
			$("#c1").animate({marginLeft:'-150px'},200);
		}
		function clearElement3(){
			$("#element3").animate({left:'-100px'},200);
			$("#d1").animate({marginLeft:'-150px'},200);
		}
		//动作——清除子导航后显示子导航
		function showChildGuide(){
			//清除子导航
			$("#element1").animate({left:'-100px'},200);
			$("#b1").animate({marginLeft:'-150px'},200,function(){
				$("#element2").animate({left:'-100px'},200);
				$("#c1").animate({marginLeft:'-150px'},200,function(){
					$("#element3").animate({left:'-100px'},200);
					$("#d1").animate({marginLeft:'-150px'},200,function(){//清除子导航完成
						$("#element1").animate({left:'35px'},200);//生成新的导航
						$("#b1").animate({marginLeft:'0px'},200,function(){
							$("#element2").animate({left:'35px'},200);
							$("#c1").animate({marginLeft:'0px'},200,function(){
								$("#element3").animate({left:'35px'},200);
								$("#d1").animate({marginLeft:'0px'},200);
							});
						});
					});
				});	
			});
			
			
			
		}
		
		//用户权限子导航
		function setChildGuideRight(){
			//改变元素的链接和名字
			showChildGuide();
			document.getElementById("td11").href="<%=basePath %>privilegeManage!listPrivilege.action";
			document.getElementById("td11").innerHTML="权限列表";
			document.getElementById("td12").href="<%=basePath %>privilegeManage!listGroup.action";
			document.getElementById("td12").innerHTML="查看用户组";
			document.getElementById("td13").href="<%=basePath %>privilegeManage!addGroup1.action";
			document.getElementById("td13").innerHTML="增加用户组";
			
					
		}
		
		
		//分支机构子导航
		function setChildGuideBranch(){
			//改变元素的链接和名字
			showChildGuide();
			
			document.getElementById("td11").href="<%=basePath %>branchManage!listBranch.action";
			document.getElementById("td11").innerHTML="查看分支机构";
			document.getElementById("td12").href="admin/branchInfo/addBranch.jsp";
			document.getElementById("td12").innerHTML="添加分支机构";
			document.getElementById("td13").href="<%=basePath %>privilegeManage!addGroup1.action";
			document.getElementById("td13").innerHTML="";
				
		}
		
		
		//部门信息子导航
		function setChildGuideDepartment(){
			//改变元素的链接和名字
			showChildGuide();
			
			document.getElementById("td11").href="<%=basePath %>departmentManage!listDepartment.action";
			document.getElementById("td11").innerHTML="查看部门信息 ";
			document.getElementById("td12").href="<%=basePath %>departmentManage!getBranchs.action";
			document.getElementById("td12").innerHTML="添加部门信息";
			document.getElementById("td13").href="<%=basePath %>privilegeManage!addGroup1.action";
			document.getElementById("td13").innerHTML="";
				
		}
		//教师等级子导航
		function setChildGuideTeacherLevel(){
			//改变元素的链接和名字
			showChildGuide();
			
			document.getElementById("td11").href="<%=basePath %>teaLevelManage!listTeaLevel.action";
			document.getElementById("td11").innerHTML="查看教师等级 ";
			document.getElementById("td12").href="admin/teacherLevel/addTeaLevel.jsp";
			document.getElementById("td12").innerHTML="添加教师等级";
			document.getElementById("td13").href="<%=basePath %>privilegeManage!addGroup1.action";
			document.getElementById("td13").innerHTML="";
				
		}
		//考勤信息子导航
		function setChildGuideAttendant(){
			//改变元素的链接和名字
			showChildGuide();
			
			document.getElementById("td11").href="<%=basePath%>attandant!checkStuAttendant.action";
			document.getElementById("td11").innerHTML="学员考勤查询 ";
			document.getElementById("td12").href="admin/teacherLevel/addTeaLevel.jsp";
			document.getElementById("td12").innerHTML="员工考勤查询";
			document.getElementById("td13").href="<%=basePath%>attandant!checkStaffAttendant.action?nextPage=1&pageSize=20";
			document.getElementById("td13").innerHTML="";
				
		}
		//工资管理子导航
		function setChildGuideWage(){
			//改变元素的链接和名字
			showChildGuide();
			
			document.getElementById("td11").href="<%=basePath %>vocationManage!listVocation.action";
			document.getElementById("td11").innerHTML="查看职类信息 ";
			document.getElementById("td12").href="<%=basePath %>vocationManage!addVocation1.action";
			document.getElementById("td12").innerHTML="增加职类信息";
			document.getElementById("td13").href="<%=basePath%>attandant!checkStaffAttendant.action?nextPage=1&pageSize=20";
			document.getElementById("td13").innerHTML="";
				
		}
		//年级管理子导航
		function setChildGrade(){
			//改变元素的链接和名字
			showChildGuide();
			
			document.getElementById("td11").href="<%=basePath%>grade!queryGrade.action";
			document.getElementById("td11").innerHTML="查询年级信息";
			document.getElementById("td12").href="<%=basePath%>grade!addGrade.action";
			document.getElementById("td12").innerHTML="添加年级";
			document.getElementById("td13").href="<%=basePath%>attandant!checkStaffAttendant.action?nextPage=1&pageSize=20";
			document.getElementById("td13").innerHTML="";
				
		}
		
		//班级管理子导航
		function setChildClass(){
			//改变元素的链接和名字
			showChildGuide();
			
			document.getElementById("td11").href="<%=basePath%>class!queryClass.action";
			document.getElementById("td11").innerHTML="查询班级信息";
			document.getElementById("td12").href="<%=basePath%>class!addGrade.action";
			document.getElementById("td12").innerHTML="添加班级";
			document.getElementById("td13").href="<%=basePath%>attandant!checkStaffAttendant.action?nextPage=1&pageSize=20";
			document.getElementById("td13").innerHTML="";
				
		}
		
		$(document).ready(function(){
			//创建主导航 
			createMin();
			
			$("#myContent").fadeIn(3000);
		
			//动作——做导航动态弹出
			$("#element1").animate({left:'25px'},400,function(){
				$("#element2").animate({left:'25px'},200,function(){
					$("#element3").animate({left:'25px'},200);
				});
			});
			
			//动作——监听鼠标是否落在子导航上
			$("#td11").mouseover(function(){
				$("#element1").animate({left:'55px'},200);
				$("#b1").animate({marginLeft:'30px'},200);
		
			});
			$("#td11").mouseout(function(){
				$("#element1").animate({left:'25px'},200);
				$("#b1").animate({marginLeft:'0px'},200);
			});
			
			$("#td12").mouseover(function(){
				$("#element2").animate({left:'55px'},200);
				$("#c1").animate({marginLeft:'30px'},200);
		
			});
			$("#td12").mouseout(function(){
				$("#element2").animate({left:'25px'},200);
				$("#c1").animate({marginLeft:'0px'},200);
			});
			
			
			$("#td13").mouseover(function(){
				$("#element3").animate({left:'55px'},200);
				$("#d1").animate({marginLeft:'30px'},200);
		
			});
			$("#td13").mouseout(function(){
				$("#element3").animate({left:'25px'},200);
				$("#d1").animate({marginLeft:'0px'},200);
			});
			
			//监听主导航点击事件
			$("#min_1").click(function(){
				setChildGuideRight();
			});
			$("#min_2").click(function(){
				setChildGuideBranch();
			});
			$("#min_3").click(function(){
				setChildGuideDepartment();
			});
			$("#min_4").click(function(){
				setChildGuideTeacherLevel();
			});
			$("#min_5").click(function(){
				setChildGuideAttendant();
			});
			$("#min_6").click(function(){
				setChildGuideWage();
			});
			$("#min_7").click(function(){
				setChildGrade();
			});
			$("#min_8").click(function(){
				setChildClass();
			});
			
		});	
		
		
	</script>
		
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
 				 <li id="min_1" class="active"><a href="admin/setPrivilege/subMenu.jsp" target="text">用户权限</a></li>
 				 <li id="min_2"><a href="admin/branchInfo/subMenu.jsp" target="text">分支机构</a></li>
  				 <li id="min_3"><a href="admin/deptInfo/subMenu.jsp" target="text">部门信息</a></li>
  				 <li id="min_4"><a href="admin/teacherLevel/subMenu.jsp" target="text">教师等级</a></li>
  				 <li id="min_5"><a href="admin/checkAttendant/subMenu.jsp" target="text">考勤信息</a></li>
  				 <li id="min_6"><a href="admin/wageInfo/subMenu.jsp" target="text">工资管理</a></li>
  				 <li id="min_7"><a href="admin/gradeInfo/subMenu.jsp" target="text">年级管理</a></li>
  				 <li id="min_8"><a href="admin/classInfo/subMenu.jsp" target="text">班级管理</a></li>
  				 <li id="min_9"><a href="admin/scheduleInfo/subMenu.jsp" target="text">工作日程</a></li>
  				 
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
				<div id="element1"><a id="td11" class="mytable" href="<%=basePath %>privilegeManage!listPrivilege.action" target="text">权限列表</a></div>
				<div id="element2"><a id="td12" class="mytable" href="<%=basePath %>privilegeManage!listGroup.action" target="text">查看用户组</a></div>
				<div id="element3"><a id="td13" class="mytable" href="<%=basePath %>privilegeManage!addGroup1.action" target="text">增加用户组</a></div>			
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
