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
	
	<link rel="stylesheet" type="text/css" href="css/body.css">
	
	
	<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/main.js"></script>
	<script type="text/javascript" src="js/staffDemo.js"></script>
	
	<link rel="stylesheet" type="text/css" href="css/staffDemo.css">
		
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
					<div id="jw_1" style="position:relative;margin-top:-20px;"><a href="educational/student/querystu.jsp" target="text">学生教务管理</a></div>
					<div id="jw_2" style="position:relative;margin-top:-20px;"><a href="educational/teacher/queryteacher.jsp" target="text">老师教务管理</a></div>
					<div id="jw_3" style="position:relative;margin-top:-20px;"><a href="educational/course/querycourseinfo.jsp" target="text">课程信息管理</a></div>
					<div id="jw_4" style="position:relative;margin-top:-20px;"><a href="educational/course/sortcourseindex.jsp" target="text">智能排课</a></div>					

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
				
					
						<div id="td1"><a id="td11" class="mytable" href="educational/student/querystu.jsp" target="text">教务管理</a></div>
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
