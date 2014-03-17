<%@ page language="java" import="java.util.*,com.scusw.model.StaffInfo,com.scusw.model.SalesmanInfo,com.scusw.model.TeacherInfo" pageEncoding="UTF-8"%>
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
    
    <title>My JSP 'staff_finance.jsp' starting page</title>
    
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
  
  <body>
    <div style="text-align: center">
    <form action="staffFinanceAction!searchStaff.action" method="post">
    	<br/>
    	<span style="margin-left:-200px;">职工名称：</span><center><input style="width:200px;margin-top:-23px;margin-left:80px;height:31px;" class="form-control" type="text" name="staffInfo.staffName"/><br/></center>
   		<!--
   		入职年份：<input type="text" /> -- <input type="text" />
   		-->
   		<input style="margin-top:0px;margin-left:0px;font-size:10px;" type="submit" class="btn btn-default" value="搜索"/>
   		<!--<input type="button" value="设置教师工资"/>-->
   		</form>
   	
   	<table border="1" class="table table-hover" style="font-size:12px;">
   		<tr class="warning">
   			<td>员工编号</td><td>员工姓名</td><td>员工职位</td><td>员工基本工资</td><td>员工提成</td><td>员工总工资</td><td>操作</td><td>上次支付工资时间</td>
   		</tr>
   		<!--<c:forEach items="${staff_list}" var="s">
   		<tr>
   			<td>${s.staffNo }</td><td>${s.staffName }</td><td>${s.positionInfo.vocationName }</td><td>${s.positionInfo.wageBase }</td><td></td><td></td><td><input class="btn btn-default" type="button" value="支付工资"/>
   		</tr>
   		</c:forEach>
   	-->
   	<%
   		float extraMoney;
   		float totalSalary;
   		for(StaffInfo s : (List<StaffInfo>)request.getAttribute("staff_list")){
   			extraMoney = 0;
   			%>
   			<tr>
   			<td><%=s.getStaffNo() %></td>
   			<td><%=s.getStaffName() %></td>
   			<td><%=s.getPositionInfo().getVocationName() %></td>
   			<td><%=s.getPositionInfo().getWageBase() %></td>
   			<td>
   			<%
   			
   			if(!s.getSalesmanInfos().isEmpty()){
   				extraMoney += ((SalesmanInfo)s.getSalesmanInfos().iterator().next()).getSalesmanSalary();
   			} 
   			if(!s.getTeacherInfos().isEmpty()){
   			   	extraMoney += ((TeacherInfo)s.getTeacherInfos().iterator().next()).getTeacherSalary();
   			}
   			out.print(extraMoney);
   			
   			totalSalary = s.getPositionInfo().getWageBase() + extraMoney;
   			%>
   			</td>
   			<td><%=totalSalary %></td>
   			<td>
   			<input onclick="window.location.href('<%=basePath %>staffFinanceAction!payStaff.action?staffFees.sfeesNum=<%=totalSalary %>&staffFees.staffInfo.staffId=<%=s.getStaffId() %>')" type="button" class="btn btn-default" value="支付工资"/>
   			<input onclick="window.location.href('<%=basePath %>staffFinanceAction!checkHistoryById.action?staffFees.staffInfo.staffId=<%=s.getStaffId() %>')" type="button" class="btn btn-default" value="历史纪录"/>
   			</td>
   			<td>&nbsp;</td>
   			</tr>
   			<%
   		}
   	 %>
   	</table>
   	</div>
  </body>
</html>
