/*
分支机构
*/
insert into branch_info(branch_founded_time,branch_name,branch_avai,branch_intr) values(NOW(),'上海分公司',1,'上海分公司的简介哦~');
insert into branch_info(branch_founded_time,branch_name,branch_avai,branch_intr) values(NOW(),'成都分公司',1,'成都分公司的简介哦~');
insert into branch_info(branch_founded_time,branch_name,branch_avai,branch_intr) values(NOW(),'重庆分公司',1,'重庆分公司的简介哦~');

/*
部门
*/
insert into department_info(branch_id,department_name,department_founded_time,department_avai,department_intr) values(1,'人事部',NOW(),1,'人事部门的备注');
insert into department_info(branch_id,department_name,department_founded_time,department_avai,department_intr) values(1,'开发部',NOW(),1,'开发部门的备注');
insert into department_info(branch_id,department_name,department_founded_time,department_avai,department_intr) values(1,'科研部',NOW(),1,'科研部门的备注');

insert into department_info(branch_id,department_name,department_founded_time,department_avai,department_intr) values(2,'人事部',NOW(),1,'人事部门的备注');
insert into department_info(branch_id,department_name,department_founded_time,department_avai,department_intr) values(2,'开发部',NOW(),1,'开发部门的备注');
insert into department_info(branch_id,department_name,department_founded_time,department_avai,department_intr) values(2,'科研部',NOW(),1,'科研部门的备注');

insert into department_info(branch_id,department_name,department_founded_time,department_avai,department_intr) values(3,'人事部',NOW(),1,'人事部门的备注');
insert into department_info(branch_id,department_name,department_founded_time,department_avai,department_intr) values(3,'开发部',NOW(),1,'开发部门的备注');
insert into department_info(branch_id,department_name,department_founded_time,department_avai,department_intr) values(3,'科研部',NOW(),1,'科研部门的备注');

/*
职位
*/
insert into position_info(department_id,vocation_name,wage_base,vocation_avai,vocation_remark) values(1,'扫地的职位','2000',1,'扫地的备注');
insert into position_info(department_id,vocation_name,wage_base,vocation_avai,vocation_remark) values(1,'部门主管的职位','3000',1,'部门主管的备注');
insert into position_info(department_id,vocation_name,wage_base,vocation_avai,vocation_remark) values(1,'普通员工的职位','4000',1,'普通员工的备注');

insert into position_info(department_id,vocation_name,wage_base,vocation_avai,vocation_remark) values(2,'扫地的职位','2000',1,'扫地的备注');
insert into position_info(department_id,vocation_name,wage_base,vocation_avai,vocation_remark) values(2,'部门主管的职位','3000',1,'部门主管的备注');
insert into position_info(department_id,vocation_name,wage_base,vocation_avai,vocation_remark) values(2,'普通员工的职位','4000',1,'普通员工的备注');

insert into position_info(department_id,vocation_name,wage_base,vocation_avai,vocation_remark) values(3,'扫地的职位','2000',1,'扫地的备注');
insert into position_info(department_id,vocation_name,wage_base,vocation_avai,vocation_remark) values(3,'部门主管的职位','3000',1,'部门主管的备注');
insert into position_info(department_id,vocation_name,wage_base,vocation_avai,vocation_remark) values(3,'普通员工的职位','4000',1,'普通员工的备注');

insert into position_info(department_id,vocation_name,wage_base,vocation_avai,vocation_remark) values(4,'扫地的职位','2000',1,'扫地的备注');
insert into position_info(department_id,vocation_name,wage_base,vocation_avai,vocation_remark) values(4,'部门主管的职位','3000',1,'部门主管的备注');
insert into position_info(department_id,vocation_name,wage_base,vocation_avai,vocation_remark) values(4,'普通员工的职位','4000',1,'普通员工的备注');

insert into position_info(department_id,vocation_name,wage_base,vocation_avai,vocation_remark) values(5,'扫地的职位','2000',1,'扫地的备注');
insert into position_info(department_id,vocation_name,wage_base,vocation_avai,vocation_remark) values(5,'部门主管的职位','3000',1,'部门主管的备注');
insert into position_info(department_id,vocation_name,wage_base,vocation_avai,vocation_remark) values(5,'普通员工的职位','4000',1,'普通员工的备注');

insert into position_info(department_id,vocation_name,wage_base,vocation_avai,vocation_remark) values(6,'扫地的职位','2000',1,'扫地的备注');
insert into position_info(department_id,vocation_name,wage_base,vocation_avai,vocation_remark) values(6,'部门主管的职位','3000',1,'部门主管的备注');
insert into position_info(department_id,vocation_name,wage_base,vocation_avai,vocation_remark) values(6,'普通员工的职位','4000',1,'普通员工的备注');

insert into position_info(department_id,vocation_name,wage_base,vocation_avai,vocation_remark) values(7,'扫地的职位','2000',1,'扫地的备注');
insert into position_info(department_id,vocation_name,wage_base,vocation_avai,vocation_remark) values(7,'部门主管的职位','3000',1,'部门主管的备注');
insert into position_info(department_id,vocation_name,wage_base,vocation_avai,vocation_remark) values(7,'普通员工的职位','4000',1,'普通员工的备注');

insert into position_info(department_id,vocation_name,wage_base,vocation_avai,vocation_remark) values(8,'扫地的职位','2000',1,'扫地的备注');
insert into position_info(department_id,vocation_name,wage_base,vocation_avai,vocation_remark) values(8,'部门主管的职位','3000',1,'部门主管的备注');
insert into position_info(department_id,vocation_name,wage_base,vocation_avai,vocation_remark) values(8,'普通员工的职位','4000',1,'普通员工的备注');

insert into position_info(department_id,vocation_name,wage_base,vocation_avai,vocation_remark) values(9,'扫地的职位','2000',1,'扫地的备注');
insert into position_info(department_id,vocation_name,wage_base,vocation_avai,vocation_remark) values(9,'部门主管的职位','3000',1,'部门主管的备注');
insert into position_info(department_id,vocation_name,wage_base,vocation_avai,vocation_remark) values(9,'普通员工的职位','4000',1,'普通员工的备注');

/*
权限
*/
insert into privilege_info(privilege_name,privilege_desc) values('系统管理员','管理系统');
insert into privilege_info(privilege_name,privilege_desc) values('学生','学生权限');
insert into privilege_info(privilege_name,privilege_desc) values('教务老师','教务老师权限');

/*
用户组
*/
insert into group_info(group_name,group_avai,group_remark) values('第一组',1,'最厉害的组');
insert into group_info(group_name,group_avai,group_remark) values('第二组',1,'第二厉害的组');
insert into group_info(group_name,group_avai,group_remark) values('第三组',1,'最不厉害的组');

/*
用户组权限
*/
insert into group_privilege(group_id,privilege_id) values(1,1);
insert into group_privilege(group_id,privilege_id) values(2,2);
insert into group_privilege(group_id,privilege_id) values(3,3);

/*
员工信息
*/
insert into staff_info(staff_pass,vocation_id,group_id,staff_name,staff_phone,staff_qq,staff_idcard,staff_empl_time,staff_avai,staff_others) values('123456',1,1,'张三1','18255623489','147895654','354895214478596548',NOW(),1,'没有其他信息');
insert into staff_info(staff_pass,vocation_id,group_id,staff_name,staff_phone,staff_qq,staff_idcard,staff_empl_time,staff_avai,staff_others) values('123456',2,2,'张三2','18255658989','147895654','353895214478596548',NOW(),1,'没有其他信息');
insert into staff_info(staff_pass,vocation_id,group_id,staff_name,staff_phone,staff_qq,staff_idcard,staff_empl_time,staff_avai,staff_others) values('123456',3,3,'张三3','18345658989','147895654','356895214478596548',NOW(),1,'没有其他信息');
insert into staff_info(staff_pass,vocation_id,group_id,staff_name,staff_phone,staff_qq,staff_idcard,staff_empl_time,staff_avai,staff_others) values('123456',4,1,'张三4','18255888989','147895654','354885214478596548',NOW(),1,'没有其他信息');
insert into staff_info(staff_pass,vocation_id,group_id,staff_name,staff_phone,staff_qq,staff_idcard,staff_empl_time,staff_avai,staff_others) values('123456',5,2,'张三5','18255577989','147895654','350005214478596548',NOW(),1,'没有其他信息');
insert into staff_info(staff_pass,vocation_id,group_id,staff_name,staff_phone,staff_qq,staff_idcard,staff_empl_time,staff_avai,staff_others) values('123456',6,3,'张三6','18255658989','147895654','354847214478596548',NOW(),1,'没有其他信息');
insert into staff_info(staff_pass,vocation_id,group_id,staff_name,staff_phone,staff_qq,staff_idcard,staff_empl_time,staff_avai,staff_others) values('123456',7,1,'张三7','18241448989','147895654','354145217478596548',NOW(),1,'没有其他信息');
insert into staff_info(staff_pass,vocation_id,group_id,staff_name,staff_phone,staff_qq,staff_idcard,staff_empl_time,staff_avai,staff_others) values('123456',8,2,'张三8','18286668989','147895654','354895227785962548',NOW(),1,'没有其他信息');
insert into staff_info(staff_pass,vocation_id,group_id,staff_name,staff_phone,staff_qq,staff_idcard,staff_empl_time,staff_avai,staff_others) values('123456',9,3,'张三9','18258778989','147895654','354895296668596548',NOW(),1,'没有其他信息');

/*
公告信息
*/
insert into notice_info(staff_id,notice_type,notice_title,notice_content,notice_time,notice_avai) values(1,'公告类型1','第1个公告','第1公告内容',NOW(),1);
insert into notice_info(staff_id,notice_type,notice_title,notice_content,notice_time,notice_avai) values(1,'公告类型2','第2个公告','第2个公告内容',NOW(),1);
insert into notice_info(staff_id,notice_type,notice_title,notice_content,notice_time,notice_avai) values(1,'公告类型3','第3个公告','第3个公告内容',NOW(),1);

/*
工作日程信息
*/
insert into schedule_info(staff_id,schedule_begin,schedule_end,schedule_content,schedule_avai) values(1,NOW(),NOW(),'我的工作日程信息哈哈哈1',1);
insert into schedule_info(staff_id,schedule_begin,schedule_end,schedule_content,schedule_avai) values(2,NOW(),NOW(),'我的工作日程信息哈哈哈2',1);
insert into schedule_info(staff_id,schedule_begin,schedule_end,schedule_content,schedule_avai) values(3,NOW(),NOW(),'我的工作日程信息哈哈哈3',1);

/*
教师等级信息
*/
insert into teacher_level(level_name,base_class_hour,class_cost,level_avai,level_remark) values('第1教师等级',30,500,1,'第1等级教师的备注');
insert into teacher_level(level_name,base_class_hour,class_cost,level_avai,level_remark) values('第2教师等级',20,400,1,'第2等级教师的备注');
insert into teacher_level(level_name,base_class_hour,class_cost,level_avai,level_remark) values('第3教师等级',40,300,1,'第3等级教师的备注');

/*
教师信息
*/
insert into teacher_info(staff_id,level_id,teacher_no,teacher_major,teacher_graduate,teacher_salary,teacher_type,teacher_remark) values(2,1,'911111','数学','川大',0,1,'备注1');
insert into teacher_info(staff_id,level_id,teacher_no,teacher_major,teacher_graduate,teacher_salary,teacher_type,teacher_remark) values(3,2,'932111','语文','浙大',0,1,'备注2');
insert into teacher_info(staff_id,level_id,teacher_no,teacher_major,teacher_graduate,teacher_salary,teacher_type,teacher_remark) values(4,3,'911351','英语','北大',0,1,'备注3');

/*
专业信息
*/
insert into major_info(major_name,major_intr,major_avai) values('软件工程','软件工程简介。。。',1);
insert into major_info(major_name,major_intr,major_avai) values('量子物理','量子物理简介。。。',1);
insert into major_info(major_name,major_intr,major_avai) values('土木工程','土木工程简介。。。',1);

/*
课程信息
*/
insert into course_info(major_id,staff_id,course_name,course_start,course_end,course_price,course_avai,course_desc) values(1,2,'线性代数',NOW(),NOW(),20,1,'线性代数简介');
insert into course_info(major_id,staff_id,course_name,course_start,course_end,course_price,course_avai,course_desc) values(2,3,'广义相对论',NOW(),NOW(),20,1,'广义相对论简介');
insert into course_info(major_id,staff_id,course_name,course_start,course_end,course_price,course_avai,course_desc) values(3,4,'大学英语',NOW(),NOW(),20,1,'大学英语简介');

/*
教学管理信息
*/
insert into teaching_manage_info(course_id,teach_plan,lesson_plan,teacher_summary,set_time) values(1,'1教学计划的URL','1教案的URL','1总结的URL',NOW());
insert into teaching_manage_info(course_id,teach_plan,lesson_plan,teacher_summary,set_time) values(2,'2教学计划的URL','2教案的URL','2总结的URL',NOW());
insert into teaching_manage_info(course_id,teach_plan,lesson_plan,teacher_summary,set_time) values(3,'3教学计划的URL','3教案的URL','3总结的URL',NOW());

/*
课时信息
*/
insert into classhour_info(classhour_start,classhour_end,classhour_avai) values(NOW(),NOW(),1);

/*
教室信息
*/
insert into classroom_info(classroom_addr,classroom_avai,classroom_type,classroom_capacity,classroom_remark) values('江安一觉A603',1,'普通教室',120,'没有备注');
insert into classroom_info(classroom_addr,classroom_avai,classroom_type,classroom_capacity,classroom_remark) values('耳机楼B303',1,'多媒体教室',100,'没有备注');
insert into classroom_info(classroom_addr,classroom_avai,classroom_type,classroom_capacity,classroom_remark) values('综合楼B707',1,'大教室',300,'没有备注');

/*
课时信息
*/
insert into course_classhour(course_id,classhour_id,classroom_id) values(1,1,1);
insert into course_classhour(course_id,classhour_id,classroom_id) values(2,1,2);
insert into course_classhour(course_id,classhour_id,classroom_id) values(3,1,3);

/*
销售人员信息
*/
insert into salesman_info(staff_id,salesman_salary,staffsman_remark) values(5,0,'销售人员1备注');
insert into salesman_info(staff_id,salesman_salary,staffsman_remark) values(6,0,'销售人员2备注');
insert into salesman_info(staff_id,salesman_salary,staffsman_remark) values(7,0,'销售人员3备注');

/*
学生咨询信息
*/
insert into consult_info(staff_id,student_name,student_sex,student_age,student_addr,student_phone,student_school,student_major,consult_type,consult_time,student_remark) 
values (5,'jack1',1,18,'jack1 addr','4589651','川大','软件工程','咨询方式1',NOW(),'jack1 remark');
insert into consult_info(staff_id,student_name,student_sex,student_age,student_addr,student_phone,student_school,student_major,consult_type,consult_time,student_remark) 
values (6,'jack2',0,18,'jack2 addr','4589652','川大','软件工程','咨询方式2',NOW(),'jack2 remark');
insert into consult_info(staff_id,student_name,student_sex,student_age,student_addr,student_phone,student_school,student_major,consult_type,consult_time,student_remark) 
values (7,'jack3',1,18,'jack3 addr','4589653','川大','软件工程','咨询方式3',NOW(),'jack3 remark');

/*
了解渠道信息
*/
insert into consultway_info(consultway_name) values('报纸了解');
insert into consultway_info(consultway_name) values('亲友了解');
insert into consultway_info(consultway_name) values('同学了解');

/*
学生了解渠道信息
*/
insert into student_consultway(consultway_id,consult_id) values(1,1);
insert into student_consultway(consultway_id,consult_id) values(2,2);
insert into student_consultway(consultway_id,consult_id) values(3,3);

/*
年级信息
*/
insert into grade_info(branch_id,grade_name,grade_avai,grade_remark) values(1,'1年级',1,'1年级only');
insert into grade_info(branch_id,grade_name,grade_avai,grade_remark) values(1,'2年级',1,'2年级only');
insert into grade_info(branch_id,grade_name,grade_avai,grade_remark) values(1,'3年级',1,'3年级only');
insert into grade_info(branch_id,grade_name,grade_avai,grade_remark) values(2,'1年级',1,'1年级only');
insert into grade_info(branch_id,grade_name,grade_avai,grade_remark) values(2,'2年级',1,'2年级only');
insert into grade_info(branch_id,grade_name,grade_avai,grade_remark) values(2,'3年级',1,'3年级only');

/*
班级信息
*/
insert into class_info(grade_id,class_name,class_avai) values(1,'1班',1);
insert into class_info(grade_id,class_name,class_avai) values(1,'2班',1);
insert into class_info(grade_id,class_name,class_avai) values(1,'3班',1);
insert into class_info(grade_id,class_name,class_avai) values(2,'1班',1);
insert into class_info(grade_id,class_name,class_avai) values(2,'2班',1);
insert into class_info(grade_id,class_name,class_avai) values(2,'3班',1);
insert into class_info(grade_id,class_name,class_avai) values(3,'1班',1);
insert into class_info(grade_id,class_name,class_avai) values(3,'2班',1);
insert into class_info(grade_id,class_name,class_avai) values(3,'3班',1);
insert into class_info(grade_id,class_name,class_avai) values(4,'1班',1);
insert into class_info(grade_id,class_name,class_avai) values(4,'2班',1);
insert into class_info(grade_id,class_name,class_avai) values(4,'3班',1);
insert into class_info(grade_id,class_name,class_avai) values(5,'1班',1);
insert into class_info(grade_id,class_name,class_avai) values(5,'2班',1);
insert into class_info(grade_id,class_name,class_avai) values(5,'3班',1);
insert into class_info(grade_id,class_name,class_avai) values(6,'1班',1);
insert into class_info(grade_id,class_name,class_avai) values(6,'2班',1);
insert into class_info(grade_id,class_name,class_avai) values(6,'3班',1);

/*
学籍状态
*/
insert into roll_state(rollstate_name,rollstate_intr) values('在校学生','normal');
insert into roll_state(rollstate_name,rollstate_intr) values('退学','unnormal');
insert into roll_state(rollstate_name,rollstate_intr) values('毕业','gtaduate');

/*
学生基本信息
*/
insert into student_info(student_pass,class_id,group_id,rollstate_id,consult_id,student_no,student_name,student_sex,student_age,student_addr,student_phone,student_balance,student_school,student_major,attend_time,student_state,student_remark) 
values('123456',1,2,1,1,'1143111121','jack1',1,18,'jack1 addr','4589651',10000,'川大','软件工程',NOW(),1,'jack1 remark');
insert into student_info(student_pass,class_id,group_id,rollstate_id,consult_id,student_no,student_name,student_sex,student_age,student_addr,student_phone,student_balance,student_school,student_major,attend_time,student_state,student_remark) 
values('123456',2,2,1,1,'1143111122','jack2',0,18,'jack2 addr','4589652',10000,'川大','软件工程',NOW(),1,'jack2 remark');
insert into student_info(student_pass,class_id,group_id,rollstate_id,consult_id,student_no,student_name,student_sex,student_age,student_addr,student_phone,student_balance,student_school,student_major,attend_time,student_state,student_remark) 
values('123456',3,2,1,1,'1143111123','jack3',1,18,'jack3 addr','4589653',10000,'川大','软件工程',NOW(),1,'jack3 remark');

/*
选课信息
*/
insert into  register_info(student_id,course_id,student_course_score) values(1,1,100);
insert into  register_info(student_id,course_id,student_course_score) values(2,2,100);
insert into  register_info(student_id,course_id,student_course_score) values(3,3,100);