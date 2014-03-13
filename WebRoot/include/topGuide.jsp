


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
	#blank{
		height:78px;
	}
	#a{
		z-index:1;
		position:relative;
		display:none;
		height:78px;
		margin-top:-78px;
	}
	#b{
		z-index:2;
		
		position:relative;
		margin-top:-78px;
		display:none;
		height:78px;
		
	}
	#c{
		z-index:3;
		
		position:relative;
		margin-top:-78px;
		display:none;
		height:78px;
	}
	#d{
		z-index:4;
	
		position:relative;
		margin-top:-78px;
		display:none;
		height:78px;		
	}
	#e{
		z-index:5;
		
		position:relative;
		margin-top:-78px;
		display:none;
		height:78px;
	}
	#f{
		z-index:6;
		
		position:relative;
		margin-top:-78px;
		display:none;
		height:78px;
	}
	#content{
		text-align:right;
		height:78px;
	}
	#colorband{
		height:65px;
		margin-top:-78px;
		text-align:left;
	}
	</style>
	<script>
		$(document).ready(function(){
			$("#a").ready(function(){
				$("#a").slideDown(100,function(){
					$("#b").slideDown(100,function(){
						$("#c").slideDown(100,function(){
							$("#d").slideDown(100,function(){
								$("#e").slideDown(100,function(){
									$("#f").slideDown(100,function(){
										var bodyWidth = document.body.clientWidth-308;
										$("#colorband").css({"background-color":"#77d0bd","width":bodyWidth,"opacity":.5,"display":"none"});
										$("#colorband").fadeIn(1000);					
									});
								});
							});
						});
					});
				});
			});
		});
		
		function h(){
			var width = document.body.clientWidth - 308;
			$("#colorband").css({"width":width});
		}
		
		window.onresize = h;
	</script>
	</head>
  <body>
  		<div id="content">
  				<div id="blank"></div>
		  		<div id="a"><img  src="image/topGuide_branch/1.png"></div>
		  		<div id="b"><img  src="image/topGuide_branch/2.png"></div>
		  		<div id="c"><img  src="image/topGuide_branch/3.png"></div>
		  		<div id="d"><img  src="image/topGuide_branch/4.png"></div>
		  		<div id="e"><img  src="image/topGuide_branch/5.png"></div>
		  		<div id="f"><img  src="image/topGuide_branch/6.png"></div>
		  		<div style="text-align:left"><div  id="colorband"></div></div>
		  		
		</div>  	
  </body>
</html>


