<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'test.jsp' starting page</title>
    
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
	<script type="text/javascript" src="js/form_validate.js"></script>	
	
	<script type="text/javascript">
		 
	</script>

  </head>
  
  <body>
   <table border="0px" style="font-size:12px">
  <tr> 
      <td colpan="3"><input type="submit" name="button" id="button" value="提交" /></td>
    </tr>
    <tr> 
      <td align="right">身份证(正则表达式库):</td>
      <td><input name="sfz" type="text" id="sfz" /></td>
      <td><div id="sfzTip" style="width:300px"></div></td>  <!--必须注意这里提示验证信息中的div的id值，跟要验证控件中的id值多了一个Tip，下面的都是这样。必须多的是Tip，也必须要多。-->
    </tr>
    </table>
  </body>
</html>
