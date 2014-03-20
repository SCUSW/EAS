##################################################
#管理员账号：admin密码：123456
#教务老师账号：scu1002密码：123456
#普通老师账号：scu1003/scu1004/scu1005密码：123456
#销售人员账号：scu1006/scu1007/scu1008密码：123456
##################################################

#admin
INSERT INTO `admin_info` VALUES ('1', 'admin', 'E10ADC3949BA59ABBE56E057F20F883E', 'Tom', '13656569898', 'cceasy@hotmail.com', '340825199201021512', '2014-03-12 12:08:46', '1');

#branch
INSERT INTO `branch_info` VALUES ('1', '2014-03-12 12:08:46', '上海分公司', '1', '上海分公司的简介哦~');
INSERT INTO `branch_info` VALUES ('2', '2014-03-12 12:08:46', '成都分公司', '1', '成都分公司的简介哦~');
INSERT INTO `branch_info` VALUES ('3', '2014-03-12 12:08:46', '重庆分公司', '1', '重庆分公司的简介哦~');

#classhour
INSERT INTO `classhour_info` VALUES ('1', '08:00:00', '09:30:00', '1', '周一第一节');
INSERT INTO `classhour_info` VALUES ('2', '10:00:00', '11:30:00', '1', '周一第二节');
INSERT INTO `classhour_info` VALUES ('3', '14:00:00', '15:30:00', '1', '周一第三节');
INSERT INTO `classhour_info` VALUES ('4', '16:00:00', '17:30:00', '1', '周一第四节');
INSERT INTO `classhour_info` VALUES ('5', '08:00:00', '09:30:00', '1', '周二第一节');
INSERT INTO `classhour_info` VALUES ('6', '10:00:00', '11:30:00', '1', '周二第二节');
INSERT INTO `classhour_info` VALUES ('7', '14:00:00', '15:30:00', '1', '周二第三节');
INSERT INTO `classhour_info` VALUES ('8', '16:00:00', '17:30:00', '1', '周二第四节');
INSERT INTO `classhour_info` VALUES ('9', '08:00:00', '09:30:00', '1', '周三第一节');
INSERT INTO `classhour_info` VALUES ('10', '10:00:00', '11:30:00', '1', '周三第二节');
INSERT INTO `classhour_info` VALUES ('11', '14:00:00', '15:30:00', '1', '周三第三节');
INSERT INTO `classhour_info` VALUES ('12', '16:00:00', '17:30:00', '1', '周三第四节');
INSERT INTO `classhour_info` VALUES ('13', '08:00:00', '09:30:00', '1', '周四第一节');
INSERT INTO `classhour_info` VALUES ('14', '10:00:00', '11:30:00', '1', '周四第二节');
INSERT INTO `classhour_info` VALUES ('15', '14:00:00', '15:30:00', '1', '周四第三节');
INSERT INTO `classhour_info` VALUES ('16', '16:00:00', '17:30:00', '1', '周四第四节');
INSERT INTO `classhour_info` VALUES ('17', '08:00:00', '09:30:00', '1', '周五第一节');
INSERT INTO `classhour_info` VALUES ('18', '10:00:00', '11:30:00', '1', '周五第二节');
INSERT INTO `classhour_info` VALUES ('19', '14:00:00', '15:30:00', '1', '周五第三节');
INSERT INTO `classhour_info` VALUES ('20', '16:00:00', '17:30:00', '1', '周五第四节');

#classroom
INSERT INTO `classroom_info` VALUES ('1', '江安一教A603', '1', '普通教室', '120', '上海分公司一个嗯好的教室~');
INSERT INTO `classroom_info` VALUES ('2', '二机楼A303', '1', '多媒体教室', '100', '上海分公司设备先进');
INSERT INTO `classroom_info` VALUES ('3', '综合楼A707', '1', '大教室', '300', '上海分公司综合大教室');
INSERT INTO `classroom_info` VALUES ('4', '江安一教B603', '1', '普通教室', '120', '成都分公司一个嗯好的教室~');
INSERT INTO `classroom_info` VALUES ('5', '二机楼B303', '1', '多媒体教室', '100', '成都分公司设备先进');
INSERT INTO `classroom_info` VALUES ('6', '综合楼B707', '1', '大教室', '300', '成都分公司综合大教室');
INSERT INTO `classroom_info` VALUES ('7', '江安一教C603', '1', '普通教室', '120', '重庆分公司一个嗯好的教室~');
INSERT INTO `classroom_info` VALUES ('8', '二机楼C303', '1', '多媒体教室', '100', '重庆分公司设备先进');
INSERT INTO `classroom_info` VALUES ('9', '综合楼C707', '1', '大教室', '300', '重庆分公司综合大教室');
INSERT INTO `classroom_info` VALUES ('10', '综合楼C107', '1', '大教室', '300', '重庆分公司综合大教室');
INSERT INTO `classroom_info` VALUES ('11', '江安一教A103', '1', '普通教室', '120', '重庆分公司一个嗯好的教室~');
INSERT INTO `classroom_info` VALUES ('12', '二机楼A103', '1', '多媒体教室', '100', '重庆分公司设备先进');
INSERT INTO `classroom_info` VALUES ('13', '综合楼A727', '1', '大教室', '300', '成都分公司综合大教室');
INSERT INTO `classroom_info` VALUES ('14', '江安一教B633', '1', '普通教室', '120', '成都分公司一个嗯好的教室~');
INSERT INTO `classroom_info` VALUES ('15', '二机楼B343', '1', '多媒体教室', '100', '成都分公司设备先进');
INSERT INTO `classroom_info` VALUES ('16', '综合楼B757', '1', '大教室', '300', '成都分公司综合大教室');
INSERT INTO `classroom_info` VALUES ('17', '江安一教C663', '1', '普通教室', '120', '上海分公司一个嗯好的教室~');
INSERT INTO `classroom_info` VALUES ('18', '二机楼C373', '1', '多媒体教室', '100', '上海分公司设备先进');
INSERT INTO `classroom_info` VALUES ('19', '综合楼C787', '1', '大教室', '300', '上海分公司综合大教室');

#grade
INSERT INTO `grade_info` VALUES ('1', '1', '1年级', '1', '1年级only');
INSERT INTO `grade_info` VALUES ('2', '1', '2年级', '1', '2年级only');
INSERT INTO `grade_info` VALUES ('3', '1', '3年级', '1', '3年级only');
INSERT INTO `grade_info` VALUES ('4', '2', '1年级', '1', '1年级only');
INSERT INTO `grade_info` VALUES ('5', '2', '2年级', '1', '2年级only');
INSERT INTO `grade_info` VALUES ('6', '2', '3年级', '1', '3年级only');
INSERT INTO `grade_info` VALUES ('7', '3', '1年级', '1', '1年级only');
INSERT INTO `grade_info` VALUES ('8', '3', '2年级', '1', '2年级only');
INSERT INTO `grade_info` VALUES ('9', '3', '3年级', '1', '3年级only');

#class
INSERT INTO `class_info` VALUES ('1', '1', '2班', '1');
INSERT INTO `class_info` VALUES ('2', '1', '3班', '1');
INSERT INTO `class_info` VALUES ('3', '1', '1班', '1');
INSERT INTO `class_info` VALUES ('4', '2', '2班', '1');
INSERT INTO `class_info` VALUES ('5', '2', '3班', '1');
INSERT INTO `class_info` VALUES ('6', '2', '1班', '1');
INSERT INTO `class_info` VALUES ('7', '3', '2班', '1');
INSERT INTO `class_info` VALUES ('8', '3', '3班', '1');
INSERT INTO `class_info` VALUES ('9', '3', '1班', '1');
INSERT INTO `class_info` VALUES ('10', '4', '1班', '1');
INSERT INTO `class_info` VALUES ('11', '4', '2班', '1');
INSERT INTO `class_info` VALUES ('12', '4', '3班', '1');
INSERT INTO `class_info` VALUES ('13', '5', '1班', '1');
INSERT INTO `class_info` VALUES ('14', '5', '2班', '1');
INSERT INTO `class_info` VALUES ('15', '5', '3班', '1');
INSERT INTO `class_info` VALUES ('16', '6', '1班', '1');
INSERT INTO `class_info` VALUES ('17', '6', '2班', '1');
INSERT INTO `class_info` VALUES ('18', '6', '3班', '1');
INSERT INTO `class_info` VALUES ('19', '7', '1班', '1');
INSERT INTO `class_info` VALUES ('20', '7', '2班', '1');
INSERT INTO `class_info` VALUES ('21', '7', '3班', '1');
INSERT INTO `class_info` VALUES ('22', '8', '1班', '1');
INSERT INTO `class_info` VALUES ('23', '8', '2班', '1');
INSERT INTO `class_info` VALUES ('24', '8', '3班', '1');
INSERT INTO `class_info` VALUES ('25', '9', '1班', '1');
INSERT INTO `class_info` VALUES ('26', '9', '2班', '1');
INSERT INTO `class_info` VALUES ('27', '9', '3班', '1');

#rollstate
INSERT INTO `roll_state` VALUES ('1', '在校学生', 'normal');
INSERT INTO `roll_state` VALUES ('2', '退学', 'unnormal');
INSERT INTO `roll_state` VALUES ('3', '毕业', 'gtaduate');
INSERT INTO `roll_state` VALUES ('4', '其它', 'others');

#privilegeInfo
INSERT INTO `privilege_info` VALUES ('1', '系统管理员', '管理系统权限');
INSERT INTO `privilege_info` VALUES ('2', '查看公司账单', '财务');
INSERT INTO `privilege_info` VALUES ('3', '增加公司账单记录', '财务');
INSERT INTO `privilege_info` VALUES ('4', '查看学员详细信息', '财务');
INSERT INTO `privilege_info` VALUES ('5', '修改学员余额', '财务');
INSERT INTO `privilege_info` VALUES ('6', '查看职工详细信息', '财务');
INSERT INTO `privilege_info` VALUES ('7', '查看职工收入明细', '财务');
INSERT INTO `privilege_info` VALUES ('8', '修改营销人员绩效', '财务');
INSERT INTO `privilege_info` VALUES ('9', '修改教师提成', '财务');
INSERT INTO `privilege_info` VALUES ('10', '查看学生信息', '教师');
INSERT INTO `privilege_info` VALUES ('11', '查看自己开设的课程', '教师');
INSERT INTO `privilege_info` VALUES ('12', '给课程学生评分', '教师');
INSERT INTO `privilege_info` VALUES ('13', '查看学生考勤', '教师');
INSERT INTO `privilege_info` VALUES ('14', '增加学生考勤', '教师');
INSERT INTO `privilege_info` VALUES ('15', '开设课程', '教师');
INSERT INTO `privilege_info` VALUES ('16', '上传教案', '教师');
INSERT INTO `privilege_info` VALUES ('17', '上传总结', '教师');
INSERT INTO `privilege_info` VALUES ('18', '查看任课教师信息', '教师');
INSERT INTO `privilege_info` VALUES ('19', '查看任课教师考勤', '教师');
INSERT INTO `privilege_info` VALUES ('20', '增加任课教师考勤', '教师');
INSERT INTO `privilege_info` VALUES ('21', '查看任课教师课程', '教师');
INSERT INTO `privilege_info` VALUES ('22', '设置任课教师课程价格', '教师');
INSERT INTO `privilege_info` VALUES ('23', '查看任课教师教案', '教师');
INSERT INTO `privilege_info` VALUES ('24', '查看任课教师总结', '教师');
INSERT INTO `privilege_info` VALUES ('25', '学生基本信息查看', '教务');
INSERT INTO `privilege_info` VALUES ('26', '确认学生考勤', '教务');
INSERT INTO `privilege_info` VALUES ('27', '教师基本信息查看', '教务');
INSERT INTO `privilege_info` VALUES ('28', '教师课程信息查看', '教务');
INSERT INTO `privilege_info` VALUES ('29', '教师工资清单查看确认', '教务');
INSERT INTO `privilege_info` VALUES ('30', '添加教师', '教务');
INSERT INTO `privilege_info` VALUES ('31', '修改课程信息', '教务');
INSERT INTO `privilege_info` VALUES ('32', '添加课程信息', '教务');
INSERT INTO `privilege_info` VALUES ('33', '删除课程信息', '教务');
INSERT INTO `privilege_info` VALUES ('34', '智能排课', '教务');
INSERT INTO `privilege_info` VALUES ('35', '查看教学日历', '教务');
INSERT INTO `privilege_info` VALUES ('36', '添加咨询信息', '营销');
INSERT INTO `privilege_info` VALUES ('37', '查询营销人员信息', '营销');
INSERT INTO `privilege_info` VALUES ('38', '查看营销人员绩效', '营销');
INSERT INTO `privilege_info` VALUES ('39', '设置提成比例', '营销');

#groupInfo
INSERT INTO `group_info` VALUES ('1', '管理员组', '1', '管理员');
INSERT INTO `group_info` VALUES ('2', '普通教师', '1', '普通教师');
INSERT INTO `group_info` VALUES ('3', '营销人员组', '1', '营销人员');
INSERT INTO `group_info` VALUES ('4', '学生组', '1', '学生');
INSERT INTO `group_info` VALUES ('5', '主管教师', '1', '主管老师');
INSERT INTO `group_info` VALUES ('6', '待定', '1', '待定');

#department
INSERT INTO `department_info` VALUES ('1', '1', '人事部', '2014-03-12 12:08:46', '1', '人事部门的备注');
INSERT INTO `department_info` VALUES ('2', '1', '开发部', '2014-03-12 12:08:46', '1', '开发部门的备注');
INSERT INTO `department_info` VALUES ('3', '1', '科研部', '2014-03-12 12:08:46', '1', '科研部门的备注');
INSERT INTO `department_info` VALUES ('4', '2', '人事部', '2014-03-12 12:08:46', '1', '人事部门的备注');
INSERT INTO `department_info` VALUES ('5', '2', '开发部', '2014-03-12 12:08:46', '1', '开发部门的备注');
INSERT INTO `department_info` VALUES ('6', '2', '科研部', '2014-03-12 12:08:46', '1', '科研部门的备注');
INSERT INTO `department_info` VALUES ('7', '3', '人事部', '2014-03-12 12:08:46', '1', '人事部门的备注');
INSERT INTO `department_info` VALUES ('8', '3', '开发部', '2014-03-12 12:08:46', '1', '开发部门的备注');
INSERT INTO `department_info` VALUES ('9', '3', '科研部', '2014-03-12 12:08:46', '1', '科研部门的备注');

#vocation
INSERT INTO `position_info` VALUES ('1', '1', '总经理', '2000', '1', '总经理的备注');
INSERT INTO `position_info` VALUES ('2', '1', '开发部科长', '3000', '1', '开发部科长的备注');
INSERT INTO `position_info` VALUES ('3', '1', '教师', '4000', '1', '教师的备注');
INSERT INTO `position_info` VALUES ('4', '2', '总经理', '2000', '1', '总经理的备注');
INSERT INTO `position_info` VALUES ('5', '2', '开发部科长', '3000', '1', '开发部科长的备注');
INSERT INTO `position_info` VALUES ('6', '2', '教师', '4000', '1', '教师的备注');
INSERT INTO `position_info` VALUES ('7', '3', '总经理', '2000', '1', '总经理的备注');
INSERT INTO `position_info` VALUES ('8', '3', '开发部科长', '3000', '1', '开发部科长的备注');
INSERT INTO `position_info` VALUES ('9', '3', '教师', '4000', '1', '教师的备注');
INSERT INTO `position_info` VALUES ('10', '4', '总经理', '2000', '1', '总经理的备注');
INSERT INTO `position_info` VALUES ('11', '4', '开发部科长', '3000', '1', '开发部科长的备注');
INSERT INTO `position_info` VALUES ('12', '4', '教师', '4000', '1', '教师的备注');
INSERT INTO `position_info` VALUES ('13', '5', '总经理', '2000', '1', '总经理的备注');
INSERT INTO `position_info` VALUES ('14', '5', '开发部科长', '3000', '1', '开发部科长的备注');
INSERT INTO `position_info` VALUES ('15', '5', '教师', '4000', '1', '教师的备注');
INSERT INTO `position_info` VALUES ('16', '6', '总经理', '2000', '1', '总经理的备注');
INSERT INTO `position_info` VALUES ('17', '6', '开发部科长', '3000', '1', '开发部科长的备注');
INSERT INTO `position_info` VALUES ('18', '6', '教师', '4000', '1', '教师的备注');
INSERT INTO `position_info` VALUES ('19', '7', '总经理', '2000', '1', '总经理的备注');
INSERT INTO `position_info` VALUES ('20', '7', '开发部科长', '3000', '1', '开发部科长的备注');
INSERT INTO `position_info` VALUES ('21', '7', '教师', '4000', '1', '教师的备注');
INSERT INTO `position_info` VALUES ('22', '8', '总经理', '2000', '1', '总经理的备注');
INSERT INTO `position_info` VALUES ('23', '8', '开发部科长', '3000', '1', '开发部科长的备注');
INSERT INTO `position_info` VALUES ('24', '8', '教师', '4000', '1', '教师的备注');
INSERT INTO `position_info` VALUES ('25', '9', '总经理', '2000', '1', '总经理的备注');
INSERT INTO `position_info` VALUES ('26', '9', '开发部科长', '3000', '1', '开发部科长的备注');
INSERT INTO `position_info` VALUES ('27', '9', '教师', '4000', '1', '教师的备注');

# staff
# 2:主管老师
# 3、4、5：普通老师
#
INSERT INTO `staff_info` VALUES ('1', 'scu1001', 'e10adc3949ba59abbe56e057f20f883e', '1', '1', '1', 'jane', '18255623489', '147895654', '340825199209151514', '2014-03-12 12:08:46', '1', '没有其他信息');
INSERT INTO `staff_info` VALUES ('2', 'scu1002', 'e10adc3949ba59abbe56e057f20f883e', '1', '9', '5', '令狐冲', '18255658989', '147895654', '340825199209151515', '2014-03-12 12:14:34', '1', '没有其他信息');
INSERT INTO `staff_info` VALUES ('3', 'scu1003', 'e10adc3949ba59abbe56e057f20f883e', '0', '9', '2', '东方不败', '18345658989', '147895654', '340825199209151516', '2014-03-12 12:14:36', '1', '没有其他信息');
INSERT INTO `staff_info` VALUES ('4', 'scu1004', 'e10adc3949ba59abbe56e057f20f883e', '0', '9', '2', '任盈盈', '18255888989', '147895654', '340825199209151517', '2014-03-12 12:14:38', '1', '没有其他信息');
INSERT INTO `staff_info` VALUES ('5', 'scu1005', 'e10adc3949ba59abbe56e057f20f883e', '0', '9', '2', '仪琳', '18255577989', '147895654', '340825199209151518', '2014-03-12 12:14:41', '1', '没有其他信息');
INSERT INTO `staff_info` VALUES ('6', 'scu1006', 'e10adc3949ba59abbe56e057f20f883e', '1', '10', '7', '任我行', '18255658989', '147895654', '340825199209151519', '2014-03-12 12:14:44', '1', '没有其他信息');
INSERT INTO `staff_info` VALUES ('7', 'scu1007', 'e10adc3949ba59abbe56e057f20f883e', '1', '11', '7', '岳不群', '18241448989', '147895654', '340825199209151524', '2014-03-12 12:14:47', '1', '没有其他信息');
INSERT INTO `staff_info` VALUES ('8', 'scu1008', 'e10adc3949ba59abbe56e057f20f883e', '1', '12', '7', '田伯光', '18286668989', '147895654', '340825199209151534', '2014-03-12 12:14:51', '1', '没有其他信息');
INSERT INTO `staff_info` VALUES ('9', 'scu1009', 'e10adc3949ba59abbe56e057f20f883e', '1', '22', '7', '方证大师', '18258778989', '147895654', '340825199209151544', '2014-03-12 12:14:55', '1', '没有其他信息');
INSERT INTO `staff_info` VALUES ('9', 'scu1010', 'e10adc3949ba59abbe56e057f20f883e', '1', '26', '7', '左冷禅', '18258778989', '147895654', '340825199209151544', '2014-03-12 12:14:55', '1', '没有其他信息');

#teacher
INSERT INTO `teacher_info` VALUES ('2', '1', '9115692', '艺术', '川大', '0', '1', '主管老师令狐冲');
INSERT INTO `teacher_info` VALUES ('3', '2', '9115693', '英语', '浙大', '0', '0', '普通教师东方不败');
INSERT INTO `teacher_info` VALUES ('4', '3', '9115694', '英语', '北大', '0', '0', '普通教师任盈盈');
INSERT INTO `teacher_info` VALUES ('5', '3', '9115695', '英语', '川师', '0', '0', '普通教师仪琳');

#salesman
INSERT INTO `salesman_info` VALUES ('6', '0', '销售人员1备注');
INSERT INTO `salesman_info` VALUES ('7', '0', '销售人员2备注');
INSERT INTO `salesman_info` VALUES ('8', '0', '销售人员3备注');


#major
INSERT INTO `major_info` VALUES ('1', '软件工程', '软件工程简介。。。', '1');
INSERT INTO `major_info` VALUES ('2', '量子物理', '量子物理简介。。。', '1');
INSERT INTO `major_info` VALUES ('3', '自然', '自然科学简介。。。', '1');
INSERT INTO `major_info` VALUES ('4', '数学', '数学简介。。。', '1');
INSERT INTO `major_info` VALUES ('5', '艺术', '艺术简介。。。', '1');
INSERT INTO `major_info` VALUES ('6', '英语', '英语简介。。。', '1');

#course
INSERT INTO `course_info` VALUES ('1', '4', '4', '线性代数', '2014-03-12', '2014-07-12', '20', '2', '1', '线性代数简介');
INSERT INTO `course_info` VALUES ('2', '2', '3', '广义相对论', '2014-03-12', '2014-07-12', '20', 3, '1', '广义相对论简介');
INSERT INTO `course_info` VALUES ('3', '6', '5', '大学英语', '2014-03-12', '2014-07-12', '20', 4, '1', '大学英语简介');
INSERT INTO `course_info` VALUES ('4', '2', '3', '狭义相对论', '2014-03-18', '2014-07-12', '1', 5, '1', '没有简介，想知道去百度google');
INSERT INTO `course_info` VALUES ('5', '2', '4', '量子物理', '2014-03-18', '2014-07-12', '2', 3, '1', '没有简介，想知道去百度google');
INSERT INTO `course_info` VALUES ('6', '2', '5', '原子力学', '2014-03-18', '2014-07-12', '3', 2, '1', '没有简介，想知道去百度google');
INSERT INTO `course_info` VALUES ('7', '5', '3', '语文', '2014-03-18', '2014-07-12', '4', 1, '1', '没有简介，想知道去百度google');
INSERT INTO `course_info` VALUES ('8', '4', '5', '数学', '2014-03-18', '2014-07-12', '5', 6, '1', '没有简介，想知道去百度google');
INSERT INTO `course_info` VALUES ('10', '6', '4', '英语', '2014-03-18', '2014-07-12', '3', 8, '1', '没有简介，想知道去百度google');
INSERT INTO `course_info` VALUES ('11', '3', '5', '化学', '2014-03-18', '2014-07-12', '7', 2, '1', '没有简介，想知道去百度google');
INSERT INTO `course_info` VALUES ('12', '3', '4', '生物', '2014-03-18', '2014-07-12', '8', 3, '1', '没有简介，想知道去百度google');
INSERT INTO `course_info` VALUES ('13', '2', '3', '物理', '2014-03-18', '2014-07-12', '9', 4, '1', '没有简介，想知道去百度google');
INSERT INTO `course_info` VALUES ('14', '5', '3', '政治', '2014-03-18', '2014-07-12', '0', 5, '1', '没有简介，想知道去百度google');
INSERT INTO `course_info` VALUES ('15', '5', '4', '历史', '2014-03-18', '2014-07-12', '1', 2, '1', '没有简介，想知道去百度google');
INSERT INTO `course_info` VALUES ('16', '5', '5', '地理', '2014-03-18', '2014-07-12', '2', 4, '1', '没有简介，想知道去百度google');

#consultway
INSERT INTO `consultway_info` VALUES ('1', '上网看到的');
INSERT INTO `consultway_info` VALUES ('2', '听妈妈说的');
INSERT INTO `consultway_info` VALUES ('3', '同学告诉我的');
INSERT INTO `consultway_info` VALUES ('4', '其他途径');

#student
INSERT INTO `student_info` VALUES ('1', 'E10ADC3949BA59ABBE56E057F20F883E', '1', '4', '1', '1', '1143111421', '柯南', '1', 10, '中国 安徽 安庆 太湖', '13365459878', '10000', '川大', '软件工程', '2014-03-19 15:01:12', '1', '这是我的备注。。哈哈');
INSERT INTO `student_info` VALUES ('2', 'E10ADC3949BA59ABBE56E057F20F883E', '2', '4', '1', '2', '1143111422', '小兰', '0', '14', '四川 成都 江安 川大', '13365459877', '255', '川大', '软件工程', '2014-03-19 15:01:12', '1', '再看我就把你喝掉');
INSERT INTO `student_info` VALUES ('3', 'e10adc3949ba59abbe56e057f20f883e', '3', '4', '1', '3', '1143111423', '小哀', '0', '18', '重庆 重庆 沙坪 地中海', '13365459876', '300', '川大', '软件工程', '2014-03-16 00:51:38', '1', '我喜欢喝茶');

