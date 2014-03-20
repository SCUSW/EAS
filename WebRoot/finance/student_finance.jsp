<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>My JSP 'student_finance.jsp' starting page</title>

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
	</style>
	<script type="text/javascript">
	<%if(!com.scusw.util.CheckPrivilege.checkPrivilege(4))
		{
		%>
			$(document).ready(function(){
				$("#cw_xxxx").removeAttr("onclick");
				$("#cw_xxxx").attr("disabled","disabled");
			});
		<%
		}
	%>
	
	<%if(!com.scusw.util.CheckPrivilege.checkPrivilege(5))
		{
		%>
			$(document).ready(function(){
				$("#cw_xgye").removeAttr("onclick");
				$("#cw_xgye").attr("disabled","disabled");
			});
		<%
		}
	%>
	
	</script>

	</head>

	<body>
		<div style="text-align: center">
			<br/>
			<form
				action="<%=basePath%>studentFinanceAction!conditionSearch.action"
				method="post">
				
				<span style="margin-left:-200px;">学员名称：</span><center><input style="width:200px;margin-top:-23px;margin-left:80px;height:30px;" class="form-control" type="text" name="studentInfo.studentName"/><br/></center>
   		
   		<input style="margin-top:0px;margin-left:0px;font-size:10px;" type="submit" class="btn btn-default" value="搜索"/>
			</form>

			<table border="1" class="table table-hover">
				<tr class="warning">
					<td>
						姓名
					</td>
					<td>
						状态
					</td>
					<td>
						余额
					</td>
					<td>
						操作
					</td>
				</tr>
				<c:forEach items="${student_list}" var="s">
					<tr class="success">
						<td>
							${s.studentName }
						</td>
						<td>
							${s.rollState.rollstateName }
						</td>
						<td>
							${s.studentBalance }
						</td>
						<td>
							<input id="cw_xgye" class="btn btn-default" type="button" onclick="addMoney(${s.studentId})" value="充值" />
							<input id="cw_xgye" class="btn btn-default" type="button" onclick="minusMoney(${s.studentId})" value="扣费" />
							<!--<input type="button" value="转正" />-->
							<input id="cw_xxxx" class="btn btn-default" type="button"
								onclick="window.location.href='<%=basePath%>studentFinanceAction!detailInfo.action?studentInfo.studentId=${s.studentId }'"
								value="详细信息" />
						</td>
					</tr>
				</c:forEach>
			</table>

		</div>
	</body>

	<script type="text/javascript">
	function addMoney(studentId) {
		var add_money = prompt("充值金额:", 100);
		if(add_money != "" && add_money != null){
			window.location.href="studentFinanceAction!changeFees.action?studentFees.studentInfo.studentId=" + studentId + "&studentFees.feesNum=" + add_money;
		}
	}
	
	function minusMoney(studentId) {
		var minus_money = window.prompt("扣费金额:", 100);
		minus_money = 0 - minus_money;
		if(minus_money != "" && minus_money != null){
			window.location.href="studentFinanceAction!changeFees.action?studentFees.studentInfo.studentId=" + studentId + "&studentFees.feesNum=" + minus_money;
		}
	}
</script>
</html>
