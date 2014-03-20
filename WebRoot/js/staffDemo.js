var flag1=0,flag2=0,flag3=0,flag4=0;//分别标记教务管理，财务管理，营销管理，教师管理
		//清空教务管理
		function clearJw(){
			if(flag1){
				flag1=0;
				$("#jw_1").animate({left:'0px'},200,function(){
					$("#jw_1").fadeOut(100,function(){
						$("#jw_2").animate({left:'0px'},200,function(){
							$("#jw_2").fadeOut(100,function(){
								$("#jw_3").animate({left:'0px'},200,function(){
									$("#jw_3").fadeOut(100,function(){
										$("#jw_4").animate({left:'0px'},200,function(){
											$("#jw_4").fadeOut(100);
										});
									});
								});
							});
						});
					});
				});
			}
		}
		//清空财务管理
		function clearCw(){
			if(flag2){
				flag2=0;
				$("#cw_1").animate({left:'0px'},200,function(){
					$("#cw_1").fadeOut(100,function(){
						$("#cw_2").animate({left:'0px'},200,function(){
							$("#cw_2").fadeOut(100,function(){
								$("#cw_3").animate({left:'0px'},200,function(){
									$("#cw_3").fadeOut(100);
								});
							});
						});
					});
				});
			}
		}
		//清空营销管理
		function clearYx(){
			if(flag3){
				flag3=0;
				$("#yx_1").animate({left:'0px'},200,function(){
					$("#yx_1").fadeOut(100,function(){
						$("#yx_2").animate({left:'0px'},200,function(){
							$("#yx_2").fadeOut(100,function(){
								$("#yx_3").animate({left:'0px'},200,function(){
									$("#yx_3").fadeOut(100,function(){
										$("#yx_4").animate({left:'0px'},200,function(){
											$("#yx_4").fadeOut(100);
										});
									});
								});
							});
						});
					});
				});
			}
		}
		//清空教师管理
		function clearJs(){
			if(flag4){
				flag4=0;
				$("#js_1").animate({left:'0px'},200,function(){
					$("#js_1").fadeOut(100,function(){
						$("#js_2").animate({left:'0px'},200,function(){
							$("#js_2").fadeOut(100,function(){
								$("#js_3").animate({left:'0px'},200,function(){
									$("#js_3").fadeOut(100,function(){
										$("#js_4").animate({left:'0px'},200,function(){
											$("#js_4").fadeOut(100);
										});
									});
								});
							});
						});
					});
				});
			}
		}
	//判断二级导航是否为空
		function judgeIsCleared(){
		}
	//判断导航是否相同
		function judgeIsSameGuide(myflag){
			if(myflag){
				return true;
			}
			else
				return false;
		}
		//生成二级导航
		function createJw(){
			if(!judgeIsSameGuide(flag1)){
				clearCw();
				clearYx();
				clearJs();
				flag1 = 1;
				$("#jw_1,#jw_2,#jw_3,#jw_4").show(600,function(){
					$("#jw_1").animate({left:'-500px'},200,function(){
						$("#jw_2").animate({left:'-350px'},200,function(){
							$("#jw_3").animate({left:'-200px'},200,function(){
								$("#jw_4").animate({left:'-50px'},200);
							});
						});
					});
				});
			}
			
		}
		function createCw(){
			if(!judgeIsSameGuide(flag2)){
				flag2 = 1;
				clearJw();
				clearYx();
				clearJs();
				$("#cw_1,#cw_2,#cw_3").show(600,function(){
					$("#cw_1").animate({left:'-500px'},200,function(){
						$("#cw_2").animate({left:'-350px'},200,function(){
							$("#cw_3").animate({left:'-200px'},200);
						});
					});
				});
			}
		}
		function createYx(){
			if(!judgeIsSameGuide(flag3)){
				flag3 = 1;
				clearJw();
				clearCw();
				clearJs();
				$("#yx_1,#yx_2,#yx_3,#yx_4").show(600,function(){
					$("#yx_1").animate({left:'-500px'},200,function(){
						$("#yx_2").animate({left:'-350px'},200,function(){
							$("#yx_3").animate({left:'-200px'},200,function(){
								$("#yx_4").animate({left:'-50px'},200);
							});
						});
					});
				});
			}
		}
		function createJs(){
			if(!judgeIsSameGuide(flag4)){
				flag4 = 1;
				clearJw();
				clearCw();
				clearYx();
				$("#js_1,#js_2,#js_3,#js_4").show(600,function(){
					$("#js_1").animate({left:'-500px'},200,function(){
						$("#js_2").animate({left:'-350px'},200,function(){
							$("#js_3").animate({left:'-200px'},200,function(){
								$("#js_4").animate({left:'-50px'},200);
							});
						});
					});
				});
			}
		}
		$(document).ready(function(){
			//监听用户点击哪个导航
			$("#td11").click(createJw);
			$("#td12").click(createCw);
			$("#td13").click(createYx);
			$("#td14").click(createJs);
		
			$("#myContent").fadeIn(3000);
			$("#td1").animate({left:'25px'},400,function(){
				$("#td2").animate({left:'25px'},200,function(){
					$("#td3").animate({left:'25px'},200,function(){
						$("#td4").animate({left:'25px'},200);
					});
				});
			});
			
			
			$("#td11").mouseover(function(){
				$("#td1").animate({left:'55px'},200);
				$("#b1").animate({marginLeft:'30px'},200);
		
			});
			$("#td11").mouseout(function(){
				$("#td1").animate({left:'25px'},200);
				$("#b1").animate({marginLeft:'0px'},200);
			});
			
			$("#td12").mouseover(function(){
				$("#td2").animate({left:'55px'},200);
				$("#c1").animate({marginLeft:'30px'},200);
		
			});
			$("#td12").mouseout(function(){
				$("#td2").animate({left:'25px'},200);
				$("#c1").animate({marginLeft:'0px'},200);
			});
			
			
			$("#td13").mouseover(function(){
				$("#td3").animate({left:'55px'},200);
				$("#d1").animate({marginLeft:'30px'},200);
		
			});
			$("#td13").mouseout(function(){
				$("#td3").animate({left:'25px'},200);
				$("#d1").animate({marginLeft:'0px'},200);
			});
			
			
			
			$("#td14").mouseover(function(){
				$("#td4").animate({left:'55px'},200);
				$("#e1").animate({marginLeft:'30px'},200);
		
			});
			$("#td14").mouseout(function(){
				$("#td4").animate({left:'25px'},200);
				$("#e1").animate({marginLeft:'0px'},200);
			});
		});	
		
		
		