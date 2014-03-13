<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>查询考勤情况</title>

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
	查询员工考勤信息
	<br>
	<a href=""></a>
	<c:forEach items="${request.info }" var="i">
   ${i.attendantTime },${i.staffInfo.staffName },${i.staffInfo.positionInfo.departmentInfo.departmentName }<br>
	</c:forEach>
	总共：${request.total }
	每页显示：${request.pageSize }<br>
	<%if((Integer)request.getAttribute("total")>(Integer)request.getAttribute("pageSize")) { 
		if((Integer)request.getAttribute("currentPage")!=1){	
	%>
	
	<a href="<%=basePath%>attandant!checkStaffAttendant.action?nextPage=1&pageSize=${request.pageSize }">首页</a>
	<a href="<%=basePath%>attandant!checkStaffAttendant.action?nextPage=<%=((Integer)request.getAttribute("currentPage")-1) %>&pageSize=${request.pageSize }">上一页</a>
	<%} %>
	当前第${request.currentPage }页
	<%
	if((Integer)request.getAttribute("currentPage")<(Integer)request.getAttribute("total")/(Integer)request.getAttribute("pageSize")+1){	
	%>
	<a href="<%=basePath%>attandant!checkStaffAttendant.action?nextPage=<%=((Integer)request.getAttribute("currentPage")+1) %>&pageSize=${request.pageSize }">下一页</a>
	<a href="<%=basePath%>attandant!checkStaffAttendant.action?nextPage=<%=((Integer)request.getAttribute("total")/(Integer)request.getAttribute("pageSize")+1) %>&pageSize=${request.pageSize }">末页</a>
	<%} 
	}%>
</body>
</html>
