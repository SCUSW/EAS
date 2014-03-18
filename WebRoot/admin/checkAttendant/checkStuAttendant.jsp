<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
   查询学员考勤信息 <br>
   
   <s:debug></s:debug>
   <form action="<%=basePath%>attandant!checkStuAttendant.action" method="get">
		<input name="nextPage" value="1"  type="hidden">
		每页显示数量
		<select name="pageSize" >
			<option value="10" ${request.pageSize eq 10?"selected":"" }>10</option>
			<option value="15" ${request.pageSize eq 15?"selected":"" }>15</option>
			<option value="20" ${request.pageSize eq 20?"selected":"" }>20</option>
			<option value="25" ${request.pageSize eq 25?"selected":"" }>25</option>
			<option value="40" ${request.pageSize eq 40?"selected":"" }>40</option>
		</select><br>
		学生姓名:<input type="text" value="${request.studentName }" name="studentName"><br>
		学生学号:<input type="text" value="${request.studentNo }" name="studentNo"><br>
		所属课程:<select name="courseId">
		<c:forEach items="${request.course }" var="i">
    		<option value=${i.courseId } ${request.courseId eq i.courseId?"selected":"" }>
    		${i.courseName }
    		</option>
    	</c:forEach>
    		<option value=0 ${request.courseId eq 0?"selected":"" }>
    		所有课程
    		</option>
		</select><br>
		年级:<select name="gradeId">
		<c:forEach items="${request.grade }" var="i">
    		<option value=${i.gradeId } ${request.gradeId eq i.gradeId?"selected":"" }>
    		${i.gradeName }
    		</option>
    	</c:forEach>
    		<option value=0 ${request.gradeId eq 0?"selected":"" }>
    		所有年级
    		</option>
		</select>
		<input type="submit" value="提交">
	</form>
   <c:forEach items="${request.stuinfo }" var="i">
   <fmt:formatDate value="${i.attendantTime }" pattern="yyyy年M月d日  EEEE HH:mm:ss"/>,${i.registerInfo.studentInfo.studentName },${i.registerInfo.studentInfo.studentNo },${i.registerInfo.studentInfo.classInfo.className },${i.registerInfo.studentInfo.classInfo.gradeInfo.gradeName },${i.registerInfo.courseInfo.courseName }<br>
   </c:forEach>
  总共：${request.total }
	每页显示：${request.pageSize }<br>
	<%/* if((Integer)request.getAttribute("total")>(Integer)request.getAttribute("pageSize")) {  */
		if((Integer)request.getAttribute("currentPage")!=1){	
	%>
	
	<a href="<%=basePath%>attandant!checkStuAttendant.action?nextPage=1&pageSize=${request.pageSize }&gradeId=${request.gradeId }&courseId=${request.courseId }&studentName=${request.studentName }&studentNo=${request.studentNo}">首页</a>
	<a href="<%=basePath%>attandant!checkStuAttendant.action?nextPage=<%=((Integer)request.getAttribute("currentPage")-1) %>&pageSize=${request.pageSize }&gradeId=${request.gradeId }&courseId=${request.courseId }&studentName=${request.studentName }&studentNo=${request.studentNo}">上一页</a>
	<%} %>
	当前第${request.currentPage }页
	<%
	if((Integer)request.getAttribute("currentPage")<(Integer)request.getAttribute("total")/(Integer)request.getAttribute("pageSize")+1){	
	%>
	<a href="<%=basePath%>attandant!checkStuAttendant.action?nextPage=<%=((Integer)request.getAttribute("currentPage")+1) %>&pageSize=${request.pageSize }&gradeId=${request.gradeId }&courseId=${request.courseId }&studentName=${request.studentName }&studentNo=${request.studentNo}">下一页</a>
	<a href="<%=basePath%>attandant!checkStuAttendant.action?nextPage=<%=((Integer)request.getAttribute("total")/(Integer)request.getAttribute("pageSize")+1) %>&pageSize=${request.pageSize }&gradeId=${request.gradeId }&courseId=${request.courseId }&studentName=${request.studentName }&studentNo=${request.studentNo}">末页</a>
	<%} 
	/* } */%>
  </body>
</html>
