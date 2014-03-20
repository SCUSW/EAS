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
	
	<link rel="stylesheet" type="text/css" href="css/body.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/main.js"></script>
	
	<link rel="stylesheet" type="text/css" href="styles.css">
	


	<style type="text/css">
	#banner_w{
		position:relative;
		height:300px;
	}
	#guide_w{
		position:relative;
		text-align:center;
		background-color:;
		
	}
	#content_w{
		position:relative;
		text-align:center;
	}
	#welcome_w{
		margin-top:100px;
		
	}
	</style>
	<script>
	/*
	function d(){
		$(document).ready(function() {
			var h=document.body.clientWidth; 
			var w=document.body.clientHeight;
				$("banner_w").ready(function(){
				$("#welcome_w").show(2000);	
				$("#guide_w").animate({marginLeft:-h/2+100,marginTop:-w},2000);
				$("#circle_w").animate({height:'150px',width:'150px'},2000);
				
			});
		})
	}
	function f(){
		var w=document.body.clientWidth; 
		$("#guide_w").animate({left:-w/2+100,top:'-300px'},10);
	}
	d();
	window.onresize=f;
		
		
*/
</script>
		


	</head>
  <body>
  	<div class="container-fulied">
	  	<div id="content_w">
		  	<div id="guide_w">
		  		
		  		<div id="welcome_w"><h1>welcome<br/>${session.name }</h1></div>
		  	</div>
	  	</div>
	  </div>
  </body>
</html>


