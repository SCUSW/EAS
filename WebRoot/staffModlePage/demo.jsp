<%@page import="com.scusw.util.CheckPrivilege"%>
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
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
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
			position:relative;	
			margin-top:-80px;
			position:relative;
			z-index:100;
			left:-7px;
			padding-bottom: 0px;
			top:250px;
			font-size:18px;
			font-family: "微软雅黑";
		}
		#guide div{
			position:relative;
			height:55px;
			left:-100px;
		}
		#guiderow{
			height:110px;
		}
		.mytable tr{
			width:100px;
			padding-left: 20px;
			padding-right:22px;
			font-size:12px;
			font-family:"";
		}
		#myContent{
			display:none;
			margin-top:-580px;
			margin-left:340px;
			width:910px;
			height:505px;
			border-left-color: red;
			border-right-color:yellow ;
			border-top-color:;
			border-bottom-color:#77d0bd;
			border-style: solid;
		
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
		#jw_1,#jw_2,#jw_3{
			display:none;
		}
		#cw_1,#cw_2,#cw_3{
			display:none;
			
		}
		#yx_1,#yx_2,#yx_3{
			display:none;
			
		}
		#js_1,#js_2,#js_3,#js_4{
			display:none;
			
		}
	</style>
	<script>
		var flag1=0,flag2=0,flag3=0,flag4=0;//分别标记教务管理，财务管理，营销管理，教师管理
		//清空教务管理
		function clearJw(){
			if(flag1){
				flag1=0;
				$("#jw_1").animate({left:'0px'},200,function(){
					$("#jw_1").fadeOut(100,function(){
						$("#jw_2").animate({left:'0px'},200,function(){
							$("#jw_2").fadeOut(100,function(){
								$("#jw_3").animate({left:'0px'},200,function(){
									$("#jw_3").fadeOut(100);
								});
							});
						});
					});
				});
			}
		}
		//清空财务管理
		function clearCw(){
			if(flag2){
				flag2=0;
				$("#cw_1").animate({left:'0px'},200,function(){
					$("#cw_1").fadeOut(100,function(){
						$("#cw_2").animate({left:'0px'},200,function(){
							$("#cw_2").fadeOut(100,function(){
								$("#cw_3").animate({left:'0px'},200,function(){
									$("#cw_3").fadeOut(100);
								});
							});
						});
					});
				});
			}
		}
		//清空营销管理
		function clearYx(){
			if(flag3){
				flag3=0;
				$("#yx_1").animate({left:'0px'},200,function(){
					$("#yx_1").fadeOut(100,function(){
						$("#yx_2").animate({left:'0px'},200,function(){
							$("#yx_2").fadeOut(100,function(){
								$("#yx_3").animate({left:'0px'},200,function(){
									$("#yx_3").fadeOut(100);
								});
							});
						});
					});
				});
			}
		}
		//清空教师管理
		function clearJs(){
			if(flag4){
				flag4=0;
				$("#js_1").animate({left:'0px'},200,function(){
					$("#js_1").fadeOut(100,function(){
						$("#js_2").animate({left:'0px'},200,function(){
							$("#js_2").fadeOut(100,function(){
								$("#js_3").animate({left:'0px'},200,function(){
									$("#js_3").fadeOut(100,function(){
										$("#js_4").animate({left:'0px'},200,function(){
											$("#js_4").fadeOut(100);
										});
									});
								});
							});
						});
					});
				});
			}
		}
	//判断二级导航是否为空
		function judgeIsCleared(){
		}
	//判断导航是否相同
		function judgeIsSameGuide(myflag){
			if(myflag){
				return true;
			}
			else
				return false;
		}
		//生成二级导航
		function createJw(){
			if(!judgeIsSameGuide(flag1)){
				clearCw();
				clearYx();
				clearJs();
				flag1 = 1;
				$("#jw_1,#jw_2,#jw_3").show(600,function(){
					$("#jw_1").animate({left:'-500px'},200,function(){
						$("#jw_2").animate({left:'-350px'},200,function(){
							$("#jw_3").animate({left:'-200px'},200);
						});
					});
				});
			}
			
		}
		function createCw(){
			if(!judgeIsSameGuide(flag2)){
				flag2 = 1;
				clearJw();
				clearYx();
				clearJs();
				$("#cw_1,#cw_2,#cw_3").show(600,function(){
					$("#cw_1").animate({left:'-500px'},200,function(){
						$("#cw_2").animate({left:'-350px'},200,function(){
							$("#cw_3").animate({left:'-200px'},200);
						});
					});
				});
			}
		}
		function createYx(){
			if(!judgeIsSameGuide(flag3)){
				flag3 = 1;
				clearJw();
				clearCw();
				clearJs();
				$("#yx_1,#yx_2,#yx_3").show(600,function(){
					$("#yx_1").animate({left:'-500px'},200,function(){
						$("#yx_2").animate({left:'-350px'},200,function(){
							$("#yx_3").animate({left:'-200px'},200);
						});
					});
				});
			}
		}
		function createJs(){
			if(!judgeIsSameGuide(flag4)){
				flag4 = 1;
				clearJw();
				clearCw();
				clearYx();
				$("#js_1,#js_2,#js_3,#js_4").show(600,function(){
					$("#js_1").animate({left:'-500px'},200,function(){
						$("#js_2").animate({left:'-350px'},200,function(){
							$("#js_3").animate({left:'-200px'},200,function(){
								$("#js_4").animate({left:'-50px'},200);
							});
						});
					});
				});
			}
		}
		$(document).ready(function(){
			//监听用户点击哪个导航
			$("#td11").click(createJw);
			$("#td12").click(createCw);
			$("#td13").click(createYx);
			$("#td14").click(createJs);
		
			$("#myContent").fadeIn(3000);
			$("#td1").animate({left:'25px'},400,function(){
				$("#td2").animate({left:'25px'},200,function(){
					$("#td3").animate({left:'25px'},200,function(){
						$("#td4").animate({left:'25px'},200);
					});
				});
			});
			
			
			$("#td11").mouseover(function(){
				$("#td1").animate({left:'55px'},200);
				$("#b1").animate({marginLeft:'30px'},200);
		
			});
			$("#td11").mouseout(function(){
				$("#td1").animate({left:'25px'},200);
				$("#b1").animate({marginLeft:'0px'},200);
			});
			
			$("#td12").mouseover(function(){
				$("#td2").animate({left:'55px'},200);
				$("#c1").animate({marginLeft:'30px'},200);
		
			});
			$("#td12").mouseout(function(){
				$("#td2").animate({left:'25px'},200);
				$("#c1").animate({marginLeft:'0px'},200);
			});
			
			
			$("#td13").mouseover(function(){
				$("#td3").animate({left:'55px'},200);
				$("#d1").animate({marginLeft:'30px'},200);
		
			});
			$("#td13").mouseout(function(){
				$("#td3").animate({left:'25px'},200);
				$("#d1").animate({marginLeft:'0px'},200);
			});
			
			
			
			$("#td14").mouseover(function(){
				$("#td4").animate({left:'55px'},200);
				$("#e1").animate({marginLeft:'30px'},200);
		
			});
			$("#td14").mouseout(function(){
				$("#td4").animate({left:'25px'},200);
				$("#e1").animate({marginLeft:'0px'},200);
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
			<div id="child_guide" style="height:20px;position:relative;left:1100px;width:100px;">
				<div id="jw" style="height:0px;">
					<div id="jw_blank" style="position:relative;margin-top:0px;">&nbsp;</div>
					<div id="jw_1" style="position:relative;margin-top:-20px;"><a href="#">待定</a></div>
					<div id="jw_2" style="position:relative;margin-top:-20px;"><a href="#">待定</a></div>
					<div id="jw_3" style="position:relative;margin-top:-20px;"><a href="#">待定</a></div>
				</div>
				<div id="cw"  style="height:0px;">
					<div id="cw_blank" style="position:relative;margin-top:0px;">&nbsp;</div>
					<div id="cw_1" style="position:relative;margin-top:-20px;"><a href="<%=basePath %>totalFinanceAction!totalFinance.action" target="text">总费用管理</a></div>
					<div id="cw_2" style="position:relative;margin-top:-20px;"><a href="<%=basePath %>studentFinanceAction!searchAll.action" target="text">学员费用管理</a></div>
					<div id="cw_3" style="position:relative;margin-top:-20px;"><a href="<%=basePath %>staffFinanceAction!searchAll.action" target="text">职工费用管理</a></div>
				</div>
				<div id="yx"  style="height:0px;">
					<div id="yx_blank" style="position:relative;margin-top:0px;">&nbsp;</div>
					<div id="yx_1" style="position:relative;margin-top:-20px;"><a href="marketing/addConsultInfo.jsp" target="text">添加咨询</a></div>
					<div id="yx_2" style="position:relative;margin-top:-20px;"><a href="marketing/queryPerformance.jsp" target="text">营销人员绩效</a></div>
					<div id="yx_3" style="position:relative;margin-top:-20px;"><a href="marketing/querySalesman.jsp" target="text">营销人员信息</a></div>
				</div>
				<div id="js"  style="height:0px;">
					<div id="js_blank" style="position:relative;margin-top:0px;">&nbsp;</div>
					<div id="js_1" style="position:relative;margin-top:-20px;"><a href="teacher/searchOwnCommonTeacher.jsp" target="text">任课老师</a></div>
					<div id="js_2" style="position:relative;margin-top:-20px;"><a href="teacherAct!searchTeacherOwnCourse.action" target="text">学生</a></div>
					<div id="js_3" style="position:relative;margin-top:-20px;"><a href="teacherAct!getOwnCourse.action" target="text">课程</a></div>
					<div id="js_4" style="position:relative;margin-top:-20px;"><a href="teacherAct!getOwnTeacherInfo.action" target="text">个人</a></div>
				</div>
			</div>
			<div  id="guide">
				
					
						<div id="td1"><a id="td11" class="mytable" href="" target="text">教务管理</a></div>
						<div id="td2"><a id="td12" class="mytable" href="<%=basePath %>totalFinanceAction!totalFinance.action" target="text">财务管理</a></div>
						<div id="td3"><a id="td13" class="mytable" href="<%=basePath %>marketing/addConsultInfo.jsp" target="text">营销管理</a></div>
						<div id="td4"><a id="td14" class="mytable" href="teacherAct!searchTeacherOwnCourse.action" target="text">教师管理</a></div>
					
				
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
				<center><iframe width="900" height="500" frameborder="0" name="text" scrolling="yes" src="" ></iframe></center>
			</div>
				
		</div>
	</div>
</div>
  </body>
</html>
