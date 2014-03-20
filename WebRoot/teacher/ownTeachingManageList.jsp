<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'commonTeacherList.jsp' starting page</title>
    
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
	
	<script type="text/javascript">
	<%if(!com.scusw.util.CheckPrivilege.checkPrivilege(16))
		{
		%>
			$(document).ready(function(){
				$("#js_16").removeAttr("onclick");
				$("#js_16").attr("disabled","disabled");
			});
		<%
		}
	%>
	</script>
  </head>
  
  <body>
    	<center>
    			<table class="table table-hover" border="1">
    				<tr class="warning">
    					<td>时间</td><td>审核状态</td><td>教学计划</td><td>教案</td><td>总结</td>
    				</tr>
    				<c:forEach items="${ownTeachingManageInfos}" var="t">
    				<tr class="success"> 
    					<td>${t.setTime}</td>
    					
						<c:choose>
							<c:when test="${t.examState==0}">  
  								<td>未审核</td>
　							</c:when>
							<c:when test="${t.examState==1}">  
								<td>审核通过</td>
　　							</c:when>
							<c:otherwise>  
 								<td>审核未通过</td>
　　							</c:otherwise>
						</c:choose>
						
						<td><button id="js_16" class="btn btn-default" onclick="window.location.href='${t.teachPlan}'">下载教学计划</button></td>
						
						<c:choose>
							<c:when test="${t.lessonPlan!=null}">  
  								<td><button id="js_16" class="btn btn-default" onclick="window.location.href='${t.lessonPlan}'">下载教案</button></td>
　							</c:when>
							<c:otherwise>  
 								<td>
    							<form action="teacherAct!uploadLessonPlan.action" method="post" enctype="multipart/form-data" >   
    							<input type="hidden" name="teachingManage.teachingManageId" value="${t.teachingManageId}"/>
    							<input type="hidden" name="course.courseId" value="${course.courseId}"/>
								<input type="file"  id="lessonPlan" name="doc"/>  
         						<input id="js_16" class="btn btn-button" type="submit" value="上传教案" >  
     							</form> 
     					</td>
　　							</c:otherwise>
						</c:choose>
						
						
    					<c:choose>
							<c:when test="${t.teacherSummary!=null}">  
  								<td><button class="btn btn-default" onclick="window.location.href='${t.teacherSummary}'">下载总结</button></td>
　							</c:when>
							<c:otherwise>  
 								<td>
    							 	<form action="teacherAct!uploadTeacherSummary.action" method="post" enctype="multipart/form-data" >   
    								<input type="hidden" name="teachingManage.teachingManageId" value="${t.teachingManageId}"/>
    								<input type="hidden" name="course.courseId" value="${course.courseId}"/>
									<input class="btn btn-default" type="file" id="teacherSummary" name="doc"/>  
         							<input id="js_16" class="btn btn-default" type="submit" value="上传总结" ">  
     								</form> 
     							</td>
　　							</c:otherwise>
						</c:choose>
						
     					<td>
    						
     					</td>
    				    					
    				</tr>
    				</c:forEach>	
    				<tr class="active"><td  colspan="5"><form id="uploadForm" action="teacherAct!uploadTeachPlan.action"  method="post" enctype="multipart/form-data" >   
    			<input type="hidden" name="course.courseId" value="${course.courseId}"/>
					<input class="btn btn-default" type="file" id="teachPlan" name="doc"/><br />  
         			<input id="js_16" class="btn btn-default" type="submit" value="上传教学计划 " >  
     			</form>  </td></tr>		
    			</table>
    			
     			<br>
     			<button class="btn btn-default" onclick=" window.history.back()">返回</button>
    	</center>
  </body>
</html>
