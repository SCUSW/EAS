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
    
    <title>My JSP 'gradeInfo.jsp' starting page</title>
    
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
    <table border="1">
    <thead>
    <tr>
    <td>年级名</td><td>班级数量</td><td>查看</td><td>删除</td>
    </tr>
    </thead>
    <c:forEach items="${request.grade }" var="i">
    <tr>
    <td>${i.gradeName }</td>
    <td>${fn:length(i.classInfos) }</td>
    <td><a href="<%=basePath%>class!checkClassForGrade.action?gradeId=${i.gradeId }">查看详情</a></td>
    <td><a href="<%=basePath%>grade!deleteGrade.action?gradeId=${i.gradeId }">删除班级</a></td>
    </tr>
    </c:forEach>
    </table>
  </body>
</html>
