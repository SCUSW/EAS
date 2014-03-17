<%@ page language="java" import="java.util.*,com.scusw.model.StaffInfo,com.scusw.model.SalesmanInfo,com.scusw.model.TeacherInfo" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <div style="text-align: center">
    <form action="staffFinanceAction!searchStaff.action" method="post">
   		职工名称：<input type="text" name="staffInfo.staffName"/>
   		<!--
   		入职年份：<input type="text" /> -- <input type="text" />
   		-->
   		<input type="submit"  value="搜索"/>
   		<!--<input type="button" value="设置教师工资"/>-->
   		</form>
   	
   	<table border="1">
   		<tr>
   			<td>员工编号</td><td>员工姓名</td><td>员工职位</td><td>员工基本工资</td><td>员工提成</td><td>员工总工资</td><td>操作</td><td>上次支付工资时间</td>
   		</tr>
   		<!--<c:forEach items="${staff_list}" var="s">
   		<tr>
   			<td>${s.staffNo }</td><td>${s.staffName }</td><td>${s.positionInfo.vocationName }</td><td>${s.positionInfo.wageBase }</td><td></td><td></td><td><input type="button" value="支付工资"/>
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
   			<input onclick="window.location.href('<%=basePath %>staffFinanceAction!payStaff.action?staffFees.sfeesNum=<%=totalSalary %>&staffFees.staffInfo.staffId=<%=s.getStaffId() %>')" type="button" value="支付工资"/>
   			<input onclick="window.location.href('<%=basePath %>staffFinanceAction!checkHistoryById.action?staffFees.staffInfo.staffId=<%=s.getStaffId() %>')" type="button" value="历史纪录"/>
   			</td>
   			<td><%= ((HashMap<String, String>)request.getAttribute("lastPayTime")).get(s.getStaffId().toString()) == null ? "无支付信息" : ((HashMap<String, String>)request.getAttribute("lastPayTime")).get(s.getStaffId().toString()) %></td>
   			</tr>
   			<%
   		}
   	 %>
   	</table>
   	</div>
  </body>
</html>
