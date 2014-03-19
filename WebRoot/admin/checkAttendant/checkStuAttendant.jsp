<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
   查询学员考勤信息
	<br>
	<a href=""></a>
	<form action="<%=basePath%>attandant!checkStuAttendant.action" method="get">
		
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
	 	 			<span class="input-group-addon">学生姓名</span>
					<input type="text" value="${request.studentName }" name="studentName" class="form-control" >
				</div>
			<div style="width:300px;" class="input-group input-group-sm">
	 	 			<span class="input-group-addon">学生学号</span>
					<input type="text" value="${request.studentNo }" name="studentNo" class="form-control" >
				</div>
				
				
			<div style="width:100px;" class="input-group input-group-sm">
				<input  name="nextPage" value="1"  type="hidden">
				<span  class="input-group-addon">所属课程</span>
				<select name="courseId" class="btn btn-default" >
					<c:forEach items="${request.course }" var="i">
    				<option value=${i.courseId } ${request.courseId eq i.courseId?"selected":"" }>
    				${i.courseName }
    				</option>
    				</c:forEach>
    				<option value=0 ${request.courseId eq 0?"selected":"" }>
		    		所有课程
		    		</option>
				</select>
			</div>
			
			<div style="width:100px;" class="input-group input-group-sm">
				<input  name="nextPage" value="1"  type="hidden">
				<span  class="input-group-addon">年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;级</span>
				<select name="gradeId" class="btn btn-default" >
					<c:forEach items="${request.grade }" var="i">
    				<option value=${i.gradeId } ${request.gradeId eq i.gradeId?"selected":"" }>
		    		${i.gradeName }
		    		</option>
    				</c:forEach>
    				<option value=0 ${request.gradeId eq 0?"selected":"" }>
		    		所有年级
		    		</option>
				</select>
			</div>
			
			
			<input type="submit" class="btn btn-default" value="提交">
		</div>
	</form>
	<table class="table table-hover">
	<tr class="warning"><td>时间</td><td>姓名</td><td>学号</td><td>班级</td><td>年级</td><td>课程名</td></tr>
	
	<c:forEach items="${request.stuinfo }" var="i">
	<tr class="success">
	<td>${i.attendantTime }</td>
	<td>${i.registerInfo.studentInfo.studentName }</td>
    <td>${i.registerInfo.studentInfo.studentNo }</td>
    <td>${i.registerInfo.studentInfo.classInfo.className }</td>
    <td>${i.registerInfo.studentInfo.classInfo.gradeInfo.gradeName }</td>
    <td>${i.registerInfo.courseInfo.courseName }</td>
	</tr>
	</c:forEach>
	</table>
	
	总共：${request.total }
	每页显示：${request.pageSize }<br>
	<%/* if((Integer)request.getAttribute("total")>(Integer)request.getAttribute("pageSize")) {  */
		if((Integer)request.getAttribute("currentPage")!=1){	
	%>
	
	<button class="btn btn-default" onclick="window.location.href='<%=basePath%>attandant!checkStuAttendant.action?nextPage=1&pageSize=${request.pageSize }&gradeId=${request.gradeId }&courseId=${request.courseId }&studentName=${request.studentName }&studentNo=${request.studentNo}'">首页</button>
	<button class="btn btn-default" onclick="window.location.href='<%=basePath%>attandant!checkStuAttendant.action?nextPage=<%=((Integer)request.getAttribute("currentPage")-1) %>&pageSize=${request.pageSize }&gradeId=${request.gradeId }&courseId=${request.courseId }&studentName=${request.studentName }&studentNo=${request.studentNo}'">上一页</button>
	<%} %>
	当前第${request.currentPage }页
	<%
	if((Integer)request.getAttribute("currentPage")<(Integer)request.getAttribute("total")/(Integer)request.getAttribute("pageSize")+1){	
	%>
	<button class="btn btn-default" onclick="window.location.href='<%=basePath%>attandant!checkStuAttendant.action?nextPage=<%=((Integer)request.getAttribute("currentPage")+1) %>&pageSize=${request.pageSize }&gradeId=${request.gradeId }&courseId=${request.courseId }&studentName=${request.studentName }&studentNo=${request.studentNo}'">下一页</button>
	<button class="btn btn-default" onclick="window.location.href='<%=basePath%>attandant!checkStuAttendant.action?nextPage=<%=((Integer)request.getAttribute("total")/(Integer)request.getAttribute("pageSize")+1) %>&pageSize=${request.pageSize }&gradeId=${request.gradeId }&courseId=${request.courseId }&studentName=${request.studentName }&studentNo=${request.studentNo}'">末页</button>
	<%} 
	/* } */%>

  
  
</center>	 
  </body>
</html>
