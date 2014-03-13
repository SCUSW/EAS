

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
	#a1{
		z-index:1;
		position:relative;
		margin-left:-197px;	
		
	}
	#b1{
		z-index:2;
		margin-left:-197px;
		position:relative;
		margin-top:-500px;
	}
	#c1{
		z-index:3;
		margin-left:-197px;
		position:relative;
		margin-top:-500px;
	}
	#d1{
		z-index:4;
		margin-left:-197px;
		position:relative;
		margin-top:-500px;
	}
	#e1{
		z-index:5;
		margin-left:-197px;
		position:relative;
		margin-top:-500px;
	}
	#f1{
		z-index:6;
		margin-left:-197px;
		position:relative;
		margin-top:-500px;
	}
	#colorband1{
		background-color:#c0392b;
		margin-top:-100px;
	}
	</style>
	
	<script>
		$(document).ready(function(){
			$("#a1").ready(function(){
				$("#a1").animate({marginLeft:'0px'},200,function(){
					$("#b1").animate({marginLeft:'0px'},200,function(){
						$("#c1").animate({marginLeft:'0px'},200,function(){
							$("#d1").animate({marginLeft:'0px'},200,function(){
								$("#e1").animate({marginLeft:'0px'},200,function(){
									$("#f1").animate({marginLeft:'0px'},200,function(){
										
									});
								});
							});
						});
					});
				});
				
			});	
		})
		
	</script>
	

		
	
	
	</head>
  <body>
  
		  		<div id="a1"><img  src="image/leftGuide_branch/1.png"></div>
		
		  		<div id="b1"><img  src="image/leftGuide_branch/2.png"></div>
		  		<div id="c1"><img  src="image/leftGuide_branch/3.png"></div>
		  		<div id="d1"><img  src="image/leftGuide_branch/4.png"></div>
		  		<div id="e1"><img  src="image/leftGuide_branch/5.png"></div>
		  		<div id="f1"><img  src="image/leftGuide_branch/6.png"></div>
		  		<div id="colorband1"></div>
		  			  	
  </body>
</html>


