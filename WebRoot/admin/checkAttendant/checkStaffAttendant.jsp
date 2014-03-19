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
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	
	<link rel="stylesheet" type="text/css" href="css/body.css">
	
	
	<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/main.js"></script>

</head>

<body><center>
	查询员工考勤信息
	<br>
	<a href=""></a>
	<form action="<%=basePath%>attandant!checkStaffAttendant.action" method="get">
		
		<div >
			<div style="width:100px;" class="input-group input-group-sm">
				<input  name="nextPage" value="1"  type="hidden">
				<span class="input-group-addon">每页显示数量</span>
				<select class="btn btn-default" name="pageSize" >
					<option value="10" ${request.pageSize eq 10?"selected":"" }>10</option>
					<option value="15" ${request.pageSize eq 15?"selected":"" }>15</option>
					<option value="20" ${request.pageSize eq 20?"selected":"" }>20</option>
					<option value="25" ${request.pageSize eq 25?"selected":"" }>25</option>
					<option value="40" ${request.pageSize eq 40?"selected":"" }>40</option>
				</select><br>
			</div>
		
			<div style="width:300px;" class="input-group input-group-sm">
	 	 			<span class="input-group-addon">姓&nbsp;&nbsp;&nbsp;&nbsp;名</span>
					<input type="text" value="${request.staffName }" name="staffName" class="form-control" >
				</div>
			<div style="width:300px;" class="input-group input-group-sm">
	 	 			<span class="input-group-addon">员工号</span>
					<input type="text" value="${request.staffNo }" name="staffNo" class="form-control" >
				</div>
				
				
			<div style="width:100px;" class="input-group input-group-sm">
				<input  name="nextPage" value="1"  type="hidden">
				<span  class="input-group-addon">部&nbsp;&nbsp;&nbsp;&nbsp;门</span>
				<select name="departmentId" class="btn btn-default" >
					<c:forEach items="${request.department }" var="i">
    				<option value=${i.departmentId } ${request.departmentId eq i.departmentId?"selected":"" }>
    				${i.departmentName }
    				</option>
    				</c:forEach>
    				<option value=0 ${request.departmentId eq 0?"selected":"" }>
		    		所有部门
		    		</option>
				</select>
			</div>
			<input type="submit" class="btn btn-default" value="提交">
		</div>
	</form>
	<table class="table table-hover">
	<tr class="warning"><td>时间</td><td>姓名</td><td>员工编号</td><td>部门</td></tr>
	
	<c:forEach items="${request.info }" var="i">
	<tr class="success">
	<td>${i.attendantTime }</td>
	<td>${i.staffInfo.staffName }</td>
    <td>${i.staffInfo.staffNo}</td>
    <td>${i.staffInfo.positionInfo.departmentInfo.departmentName }
	</td></tr>
	</c:forEach>
	
	</table>
	总共：${request.total }
	每页显示：${request.pageSize }<br>
	<%
	if (request.getAttribute("staffName")!=null)
		request.setAttribute("staffName", java.net.URLEncoder.encode((String)request.getAttribute("staffName"),"utf-8"));
	 %>
	<%/* if((Integer)request.getAttribute("total")>(Integer)request.getAttribute("pageSize")) {  */
		if((Integer)request.getAttribute("currentPage")!=1){	
	%>
	
	<button class="btn btn-default" onclick="window.location.href='<%=basePath%>attandant!checkStaffAttendant.action?nextPage=1&pageSize=${request.pageSize }&departmentId=${request.departmentId}&staffName=${request.staffName}&staffNo=${request.staffNo }'">首页</button>
	<button class="btn btn-default" onclick="window.location.href='<%=basePath%>attandant!checkStaffAttendant.action?nextPage=<%=((Integer)request.getAttribute("currentPage")-1) %>&pageSize=${request.pageSize }&departmentId=${request.departmentId}&staffName=${request.staffName}&staffNo=${request.staffNo }'">上一页</button>
	<%} %>
	当前第${request.currentPage }页
	<%
	if((Integer)request.getAttribute("currentPage")<(Integer)request.getAttribute("total")/(Integer)request.getAttribute("pageSize")+1){	
	%>
	<button class="btn btn-default" onclick="window.location.href='<%=basePath%>attandant!checkStaffAttendant.action?nextPage=<%=((Integer)request.getAttribute("currentPage")+1) %>&pageSize=${request.pageSize }&departmentId=${request.departmentId}&staffName=${request.staffName}&staffNo=${request.staffNo }'">下一页</button>
	<button class="btn btn-default" onclick="window.location.href='<%=basePath%>attandant!checkStaffAttendant.action?nextPage=<%=((Integer)request.getAttribute("total")/(Integer)request.getAttribute("pageSize")+1) %>&pageSize=${request.pageSize }&departmentId=${request.departmentId}&staffName=${request.staffName}&staffNo=${request.staffNo }'">末页</button>
	<%} 
	/* } */%>
	</center>
</body>
</html>




