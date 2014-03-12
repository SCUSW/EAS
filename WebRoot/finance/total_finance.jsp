<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'total_finance.jsp' starting page</title>
    
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
   <div style="text-align:center">
   <table>
   <tr>
   <td width="40%">
   当前分公司余额：${total_money }<br/><br/><br/>
   <button>查看历史明细</button>
   </td>
   <td width="60%">
		<form action="<%=basePath %>totalFinanceAction!addFinance.action" method="post">
		<h4>新增一笔收支信息</h4>
		收支标题：<input type="text" name="financialRecords.financialFrom"/><br/><br/>
   		涉及金额：<input type="text" name="financialRecords.financialNum"/><br/><br/>
   		收支类型：
   		<select name="financeType">
   			<option value="-1">支出</option>
   			<option value="1">收入</option>
   		</select><br/><br/>
   		描述：<textarea name="financialRecords.financialRemark" rows="7" cols="48"></textarea><br/><br/><br/>
   		<input type="submit" value="提交"/>
   		</form>
	</td>
	</tr>
   	</table>
   	</div>
  </body>
</html>
