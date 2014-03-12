<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'addConsultInfo.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <center> <h1>添加咨询信息界面</h1><br/>
   		<form action="marketing!addConsultInfo.action" method="post">
   			员工编号：<input type="text" name="consultInfo.salesmanInfo.staffId"/><br/>
   			学生姓名：<input type="text" name="consultInfo.studentName"/><br/>
   			学生性别：<input type="text" name="consultInfo.studentSex"/><br/>
   			学生年龄：<input type="text" name="consultInfo.studentAge"/><br/>
   			学生学校：<input type="text" name="consultInfo.studentSchool"/><br/>
   			学生住址：<input type="text" name="consultInfo.studentAddr"/><br/>
   			学生电话：<input type="text" name="consultInfo.studentPhone"/><br/>
   			学生专业：<input type="text" name="consultInfo.studentMajor"/><br/>
			咨询时间：<input type="text" name="consultInfo.consultTime"/><br/>
   			咨询方式：<input type="radio" checked="checked" name="consultInfo.consultType" value="现场咨询"/>现场咨询
					 <input type="radio" name="consultInfo.consultType" value="电话咨询"/>电话咨询
					 <input type="radio" name="consultInfo.consultType" value="网站咨询"/>网站咨询<br/>
			了解渠道：<input type="radio" name="studentConsultway.consultwayInfo.consultwayId" value="1">广告宣传
					<input type="radio" name="studentConsultway.consultwayInfo.consultwayId" value="2">活动宣传
					<input type="radio" name="studentConsultway.consultwayInfo.consultwayId" value="3">网络渠道
					<input type="radio" name="studentConsultway.consultwayInfo.consultwayId" value="4">朋友介绍
					<input type="radio" name="studentConsultway.consultwayInfo.consultwayId" value="5">学生介绍
					<input type="radio" name="studentConsultway.consultwayInfo.consultwayId" value="6">教师介绍<br/>
					<input type="hidden" name="studentConsultway.consultInfo.consultId" value="3">
   			备注：<input type="text" name="consultInfo.studentRemark"/><br/>
   			<input type="submit" value="确定添加"/>
   		</form>
   </center>
  </body>
</html>
