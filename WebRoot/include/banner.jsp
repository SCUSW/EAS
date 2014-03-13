


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   
    
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
	
	<link rel="stylesheet" type="text/css" href="styles.css">
	


	<style type="text/css">
		#left{
			margin-left:-263px;
			
		}
		#right{
			
			margin-top:-155px;
			margin-left:863px;
		}
	</style>
	<script>
			
		$(document).ready(function(){
			$("#left").ready(function(){
				$("#left").animate({marginLeft:'0px'},200);
				$("#right").animate({marginLeft:'263px'},200);
			});
		})
	
	</script>
		
	</head>
  <body>
  	<div id="left"><img src="image/banner_left.png"/></div>
  	<div id="right"><img src="image/banner_right.png"/></div>
  </body>
</html>


