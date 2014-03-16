<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'updateClass.jsp' starting page</title>
    
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
    This is my JSP page. <br>
    
    <center>
    <form action="<%=basePath%>class!updateClassInfo.action?classId=${request.classInfo.classId }" method="post">
    	班级名<input type="text" value="${request.classInfo.className }" name="className"><br>
    	所属年级<select name="gradeIdStr">
    	<c:forEach items="${request.grade }" var="i">
    		<option value=${i.gradeId } ${request.classInfo.gradeInfo.gradeId eq i.gradeId?"selected":"" }>
    		${i.gradeName }
    		</option>
    	</c:forEach>
    		<option value=0 ${empty request.classInfo.gradeInfo.gradeId?"selected":"" }>
    		不属于任何年级
    		</option>
    	</select>
    	<input type="submit" value="提交修改">
    </form>
    </center>
  </body>
</html>
