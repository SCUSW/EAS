<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/main.js"></script>
	
	<style type="text/css">
		body{
			background-image:url(image/background.jpg);
			background-repeat:repeat;
			position:relative;
			font-family: "微软雅黑";
		}
	
		#left_side{
			position:relative;
			top:0px;
			left:-197px;
			}
		#mid_side{
			text-align:center;
			position:relative;
			font-family: "微软雅黑";
			width:100%;
			top:-20px;
	}
			
		#login{
			position:relative;
			margin-top:-510px;
			margin-left:180px;
			text-align:center;
			display:none;

			}
		#circle{
			display:none;
		}
	
	#footer{
		width:100%;
		margin-top:240px;
		text-align:center;
		position:relative;
	}
	#content{
		margin-top:-100px;
	}
	</style>
    
    <script>
		$(document).ready(function(){
			$("#mid_side").ready(function() {
                $("#circle,#login").show(1000);
                $("#left_side").animate({left:'0px'},1000);
            });	
		})
	</script>
    
  </head>
  
  <body>
 	<div class="container-fluid">
    	<div id="content">
		<table id="table">
        	<tr>
            	<td height="519px" id="left_side"><img src="image/leftSide.png"></td>
                <td id="mid_side">          
	                	<p style="font-size:34;">欢迎使用NaughtyKid教务管理系统</p><br/><img id="circle"  src="image/circle.png" width="448" height="441">
                </td>
                
            </tr>
            	
         
        </table>
        <div id="login">
			 <form class="form-horizontal" action="<%=basePath %>login!checkUser.action" method="post">
				<fieldset>
					<center style="font-size:26px;font-family:'微软雅黑'">请登录</center>
					<div class="control-group">
         			 <label class="control-label" for="input01"></label>
         			 <div class="controls">
           				 账号：<input type="text" name="loginNo" placeholder="请输入账号..." class="input-xlarge">
          				  <p class="help-block"></p>
        				 密码：<input type="text" name="loginPass" placeholder="请输入密码..." class="input-xlarge">
           				 <p class="help-block"></p>
           				 <input type="radio" checked="checked" name="role" value="student"/>学生&nbsp;&nbsp;
           				 <input type="radio" name="role" value="staff"/>工作人员<br/><br/>
           				<div class="btn-group">
						  <input type="submit" value="登录" class="btn btn-default"></button>
						</div>         				 
       			  	 </div>
       				</div>
       				</fieldset>
       				</form>
          </div>

        </div>
						

            </div>
    </div>
    
    <div id="footer">
    	2014年3月NaughtyKid版权所有 © NaughtyKid<br />
			Copyright © NaughtKid <br />
    </div>
    </div>
  </body>
</html>
