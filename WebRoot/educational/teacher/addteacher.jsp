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
    
    <title>My JSP 'addteacher.jsp' starting page</title>
    
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
   <center> <h1>添加老师界面</h1><br/>
   	<form action="educational!addTeacher.action" method="post">
   	    <input type="hidden" name="teacher.staffInfo.staffNo" value="root"/><br/>
   	    <input type="hidden" name="teacher.staffInfo.staffPass" value="root"/><br/>
   	  
   	    
   		姓名：<input type="text" name="teacher.staffInfo.staffName"/><br/>
   		性别：<input type="text" name="teacher.staffInfo.staffSex"/><br/>
   		手机：<input type="text" name="teacher.staffInfo.staffPhone"/><br/>
   		Q Q ： <input type="text" name="teacher.staffInfo.staffQq"/><br/>
   		省份证号：<input type="text" name="teacher.staffInfo.staffIdcard"/><font color="red">${hasIdcard}</font><br/>
   		聘用时间:<input type="text" name="teacher.staffInfo.staffEmplTime"/><br/>
   		其他信息:<input type="text" name="teacher.staffInfo.staffOthers"/><br/>
   		专       业:<input type="text" name="teacher.teacherMajor"/><br/>
   		教师编号:<input type="text" name="teacher.teacherNo"/><font color="red">${hasTeacherNo}</font><br/>
   		教师院校:<input type="text" name="teacher.teacherGraduate"/><br/>
   		教师基本工资:<input type="text" name="teacher.teacherSalary"/><br/>
   		教师等级:<select name="teacher.teacherLevel.levelId">
   		<c:forEach items="${level}" var="l">
   		    <option value="${l.levelId}">${l.levelName} </option>  
   		 </c:forEach>
   		</select></br>
   		教师类别:<select name="teacher.teacherType">
   		    <option value="1">主管老师</option>
   		    <option value="2">任课老师</option>
   		</select></br>
   		
   		用组:<select name="teacher.staffInfo.groupInfo.groupId">
   		<c:forEach items="${group}" var="g">
   		    <option value="${g.groupId}">${g.groupName} </option>  
   		 </c:forEach>
   		</select></br>
   		  职类名称:<select name="teacher.staffInfo.positionInfo.vocationId">
   		<c:forEach items="${position}" var="p">
   		    <option value="${p.vocationId}">${p.vocationName} </option>  
   		 </c:forEach>
   		</select></br>
   		备   注:<input type="text" name="teacher.teacherRemark"/><br/>
   		<input type="submit" value="确定添加"/>
   </form>
   </center>
  </body>
</html>
