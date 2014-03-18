<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	<form action="<%=basePath%>attandant!checkStaffAttendant.action" method="get">
		<input name="nextPage" value="1"  type="hidden">
		每页显示数量
		<select name="pageSize" >
			<option value="10" ${request.pageSize eq 10?"selected":"" }>10</option>
			<option value="15" ${request.pageSize eq 15?"selected":"" }>15</option>
			<option value="20" ${request.pageSize eq 20?"selected":"" }>20</option>
			<option value="25" ${request.pageSize eq 25?"selected":"" }>25</option>
			<option value="40" ${request.pageSize eq 40?"selected":"" }>40</option>
		</select><br>
		姓名:<input type="text" value="${request.staffName }" name="staffName"><br>
		员工号:<input type="text" value="${request.staffNo }" name="staffNo"><br>
		部门:<select name="departmentId">
		<c:forEach items="${request.department }" var="i">
    		<option value=${i.departmentId } ${request.departmentId eq i.departmentId?"selected":"" }>
    		${i.departmentName }
    		</option>
    	</c:forEach>
    		<option value=0 ${request.departmentId eq 0?"selected":"" }>
    		所有部门
    		</option>
		</select>
		<input type="submit" value="提交">
	</form>
	<c:forEach items="${request.info }" var="i">
   <fmt:formatDate value="${i.attendantTime }" pattern="yyyy年M月d日  EEEE HH:mm:ss"/>,${i.staffInfo.staffName },${i.staffInfo.staffNo},${i.staffInfo.positionInfo.departmentInfo.departmentName }<br>
	</c:forEach>
	总共：${request.total }
	每页显示：${request.pageSize }<br>
	<%
	if (request.getAttribute("staffName")!=null)
		request.setAttribute("staffName", java.net.URLEncoder.encode((String)request.getAttribute("staffName"),"utf-8"));
	 %>
	<%/* if((Integer)request.getAttribute("total")>(Integer)request.getAttribute("pageSize")) {  */
		if((Integer)request.getAttribute("currentPage")!=1){	
	%>
	
	<a href="<%=basePath%>attandant!checkStaffAttendant.action?nextPage=1&pageSize=${request.pageSize }&departmentId=${request.departmentId}&staffName=${request.staffName}&staffNo=${request.staffNo }">首页</a>
	<a href="<%=basePath%>attandant!checkStaffAttendant.action?nextPage=<%=((Integer)request.getAttribute("currentPage")-1) %>&pageSize=${request.pageSize }&departmentId=${request.departmentId}&staffName=${request.staffName}&staffNo=${request.staffNo }">上一页</a>
	<%} %>
	当前第${request.currentPage }页
	<%
	if((Integer)request.getAttribute("currentPage")<(Integer)request.getAttribute("total")/(Integer)request.getAttribute("pageSize")+1){	
	%>
	<a href="<%=basePath%>attandant!checkStaffAttendant.action?nextPage=<%=((Integer)request.getAttribute("currentPage")+1) %>&pageSize=${request.pageSize }&departmentId=${request.departmentId}&staffName=${request.staffName}&staffNo=${request.staffNo }">下一页</a>
	<a href="<%=basePath%>attandant!checkStaffAttendant.action?nextPage=<%=((Integer)request.getAttribute("total")/(Integer)request.getAttribute("pageSize")+1) %>&pageSize=${request.pageSize }&departmentId=${request.departmentId}&staffName=${request.staffName}&staffNo=${request.staffNo }">末页</a>
	<%} 
	/* } */%>
</body>
</html>
