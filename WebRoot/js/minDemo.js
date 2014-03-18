//js of admin demo page 
/*
 * author 曾扬
 */


var flag = new Array(1,0,0,0,0,0,0,0,0);//标记目前在哪个导航
var name = new Array("#min_1","#min_2","#min_3","#min_4","#min_5","#min_6","#min_7","#min_8","#min_9");//标记导航的名字
var name2 = new Array("min_1","min_2","min_3","min_4","min_5","min_6","min_7","min_8","min_9")

function createMin(){
				$("#min_guide_box").show(1000,function(){
					$("#min_1").animate({left:'0px'},200,function(){
						$("#min_2").animate({left:'0px'},200,function(){
							$("#min_3").animate({left:'0px'},200,function(){
								$("#min_4").animate({left:'0px'},200,function(){
									$("#min_5").animate({left:'0px'},200,function(){
										$("#min_6").animate({left:'0px'},200,function(){
											$("#min_7").animate({left:'0px'},200,function(){
												$("#min_8").animate({left:'0px',marginTop:'0px'},200,function(){
													$("#min_9").animate({left:'0px'});
												});
											});
										});
									});
								});	
							});
						});
					});
				});
		}
		//动作——导航深色块变化
		function colorBlockChange(guideNum){
			
			for(var i=0;i<9;i=i+1){
				if(flag[i]==1){
					document.getElementById(name2[i]).className = '';
					$(name[i]).removeClass("active");
					flag[i]=0;
				}
			}
			document.getElementById(name2[guideNum]).className = 'active';
			flag[guideNum]=1;
			
		}


	/*	//动作——清除子导航
		function clearElement1(){
			$("#element1").animate({left:'-100px'},200);
			$("#b1").animate({marginLeft:'-150px'},200);
		}
		function clearElement2(){
			$("#element2").animate({left:'-100px'},200);
			$("#c1").animate({marginLeft:'-150px'},200);
		}
		function clearElement3(){
			$("#element3").animate({left:'-100px'},200);
			$("#d1").animate({marginLeft:'-150px'},200);
		}*/
		//动作——清除子导航后显示子导航
		function showChildGuide(){
			//清除子导航
			$("#element1").animate({left:'-100px'},200);
			$("#b1").animate({marginLeft:'-150px'},200,function(){
				$("#element2").animate({left:'-100px'},200);
				$("#c1").animate({marginLeft:'-150px'},200,function(){
					$("#element3").animate({left:'-100px'},200);
					$("#d1").animate({marginLeft:'-150px'},200,function(){//清除子导航完成
						$("#element1").animate({left:'35px'},200);//生成新的导航
						$("#b1").animate({marginLeft:'0px'},200,function(){
							$("#element2").animate({left:'35px'},200);
							$("#c1").animate({marginLeft:'0px'},200,function(){
								$("#element3").animate({left:'35px'},200);
								$("#d1").animate({marginLeft:'0px'},200);
							});
						});
					});
				});	
			});
			
			
			
		}
		
		//用户权限子导航
		function setChildGuideRight(){
			//改变元素的链接和名字
			showChildGuide();
			document.getElementById("td11").href="privilegeManage!listPrivilege.action";
			document.getElementById("td11").innerHTML="权限列表";
			document.getElementById("td12").href="privilegeManage!listGroup.action";
			document.getElementById("td12").innerHTML="查看用户组";
			document.getElementById("td13").href="privilegeManage!addGroup1.action";
			document.getElementById("td13").innerHTML="增加用户组";
			
					
		}
		
		
		//分支机构子导航
		function setChildGuideBranch(){
			//改变元素的链接和名字
			showChildGuide();
			
			document.getElementById("td11").href="branchManage!listBranch.action";
			document.getElementById("td11").innerHTML="查看分支机构";
			document.getElementById("td12").href="admin/branchInfo/addBranch.jsp";
			document.getElementById("td12").innerHTML="添加分支机构";
			document.getElementById("td13").href="privilegeManage!addGroup1.action";
			document.getElementById("td13").innerHTML="";
				
		}
		
		
		//部门信息子导航
		function setChildGuideDepartment(){
			//改变元素的链接和名字
			showChildGuide();
			
			document.getElementById("td11").href="departmentManage!listDepartment.action";
			document.getElementById("td11").innerHTML="查看部门信息 ";
			document.getElementById("td12").href="departmentManage!getBranchs.action";
			document.getElementById("td12").innerHTML="添加部门信息";
			document.getElementById("td13").href="privilegeManage!addGroup1.action";
			document.getElementById("td13").innerHTML="";
				
		}
		//教师等级子导航
		function setChildGuideTeacherLevel(){
			//改变元素的链接和名字
			showChildGuide();
			
			document.getElementById("td11").href="teaLevelManage!listTeaLevel.action";
			document.getElementById("td11").innerHTML="查看教师等级 ";
			document.getElementById("td12").href="admin/teacherLevel/addTeaLevel.jsp";
			document.getElementById("td12").innerHTML="添加教师等级";
			document.getElementById("td13").href="privilegeManage!addGroup1.action";
			document.getElementById("td13").innerHTML="";
				
		}
		//考勤信息子导航
		function setChildGuideAttendant(){
			//改变元素的链接和名字
			showChildGuide();
			
			document.getElementById("td11").href="attandant!checkStuAttendant.action?nextPage=1&pageSize=20&gradeId=0&courseId=0&studentName=&studentNo=";
			document.getElementById("td11").innerHTML="学员考勤查询 ";
			document.getElementById("td12").href="attandant!checkStaffAttendant.action?nextPage=1&pageSize=20&departmentId=0&staffNo=&staffName=";
			document.getElementById("td12").innerHTML="员工考勤查询";
			document.getElementById("td13").href="attandant!checkStaffAttendant.action?nextPage=1&pageSize=20";
			document.getElementById("td13").innerHTML="";
				
		}
		//工资管理子导航
		function setChildGuideWage(){
			//改变元素的链接和名字
			showChildGuide();
			
			document.getElementById("td11").href="vocationManage!listVocation.action";
			document.getElementById("td11").innerHTML="查看职类信息 ";
			document.getElementById("td12").href="vocationManage!addVocation1.action";
			document.getElementById("td12").innerHTML="增加职类信息";
			document.getElementById("td13").href="attandant!checkStaffAttendant.action?nextPage=1&pageSize=20";
			document.getElementById("td13").innerHTML="";
				
		}
		//年级管理子导航
		function setChildGrade(){
			//改变元素的链接和名字
			showChildGuide();
			
			document.getElementById("td11").href="grade!queryGrade.action";
			document.getElementById("td11").innerHTML="查询年级信息";
			document.getElementById("td12").href="grade!addGrade.action";
			document.getElementById("td12").innerHTML="添加年级";
			document.getElementById("td13").href="attandant!checkStaffAttendant.action?nextPage=1&pageSize=20";
			document.getElementById("td13").innerHTML="";
				
		}
		
		//班级管理子导航
		function setChildClass(){
			//改变元素的链接和名字
			showChildGuide();
			
			document.getElementById("td11").href="class!queryClass.action";
			document.getElementById("td11").innerHTML="查询班级信息";
			document.getElementById("td12").href="class!addClass.action";
			document.getElementById("td12").innerHTML="添加班级";
			document.getElementById("td13").href="attandant!checkStaffAttendant.action?nextPage=1&pageSize=20";
			document.getElementById("td13").innerHTML="";
				
		}
		
		$(document).ready(function(){
			//创建主导航 
			createMin();
			
			$("#myContent").fadeIn(3000);
		
			//动作——做导航动态弹出
			$("#element1").animate({left:'25px'},400,function(){
				$("#element2").animate({left:'25px'},200,function(){
					$("#element3").animate({left:'25px'},200);
				});
			});
			
			//动作——监听鼠标是否落在子导航上
			$("#td11").mouseover(function(){
				$("#element1").animate({left:'55px'},200);
				$("#b1").animate({marginLeft:'30px'},200);
		
			});
			$("#td11").mouseout(function(){
				$("#element1").animate({left:'25px'},200);
				$("#b1").animate({marginLeft:'0px'},200);
			});
			
			$("#td12").mouseover(function(){
				$("#element2").animate({left:'55px'},200);
				$("#c1").animate({marginLeft:'30px'},200);
		
			});
			$("#td12").mouseout(function(){
				$("#element2").animate({left:'25px'},200);
				$("#c1").animate({marginLeft:'0px'},200);
			});
			
			
			$("#td13").mouseover(function(){
				$("#element3").animate({left:'55px'},200);
				$("#d1").animate({marginLeft:'30px'},200);
		
			});
			$("#td13").mouseout(function(){
				$("#element3").animate({left:'25px'},200);
				$("#d1").animate({marginLeft:'0px'},200);
			});
			
			//监听主导航点击事件
			$("#min_1").click(function(){
				setChildGuideRight();
				colorBlockChange(0);
			});
			$("#min_2").click(function(){
				setChildGuideBranch();
				colorBlockChange(1);
			});
			$("#min_3").click(function(){
				setChildGuideDepartment();
				colorBlockChange(2);
			});
			$("#min_4").click(function(){
				setChildGuideTeacherLevel();
				colorBlockChange(3);
			});
			$("#min_5").click(function(){
				setChildGuideAttendant();
				colorBlockChange(4);
			});
			$("#min_6").click(function(){
				setChildGuideWage();
				colorBlockChange(5);
			});
			$("#min_7").click(function(){
				setChildGrade();
				colorBlockChange(6);
			});
			$("#min_8").click(function(){
				setChildClass();
				colorBlockChange(7);
			});
			
		});	