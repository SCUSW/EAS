/*
Navicat MySQL Data Transfer

Source Server         : Localhost
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : eas

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2014-03-21 04:12:31
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin_info
-- ----------------------------
DROP TABLE IF EXISTS `admin_info`;
CREATE TABLE `admin_info` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_no` varchar(16) NOT NULL,
  `admin_pass` varchar(32) NOT NULL,
  `admin_name` varchar(64) DEFAULT NULL,
  `admin_tel` varchar(16) DEFAULT NULL,
  `admin_email` varchar(64) DEFAULT NULL,
  `admin_idcard` varchar(18) DEFAULT NULL,
  `admin_set_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `admin_avai` int(11) DEFAULT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_info
-- ----------------------------
INSERT INTO `admin_info` VALUES ('1', 'admin', 'E10ADC3949BA59ABBE56E057F20F883E', 'Tom', '13656569898', 'cceasy@hotmail.com', '340825199201021512', '2014-03-12 12:08:46', '1');

-- ----------------------------
-- Table structure for branch_info
-- ----------------------------
DROP TABLE IF EXISTS `branch_info`;
CREATE TABLE `branch_info` (
  `branch_id` int(11) NOT NULL AUTO_INCREMENT,
  `branch_founded_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `branch_name` varchar(64) DEFAULT NULL,
  `branch_avai` int(11) DEFAULT NULL,
  `branch_intr` text,
  PRIMARY KEY (`branch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of branch_info
-- ----------------------------
INSERT INTO `branch_info` VALUES ('1', '2014-03-12 12:08:46', '上海分公司', '1', '上海分公司的简介哦~');
INSERT INTO `branch_info` VALUES ('2', '2014-03-12 12:08:46', '成都分公司', '1', '成都分公司的简介哦~');
INSERT INTO `branch_info` VALUES ('3', '2014-03-12 12:08:46', '重庆分公司', '1', '重庆分公司的简介哦~');

-- ----------------------------
-- Table structure for check_info
-- ----------------------------
DROP TABLE IF EXISTS `check_info`;
CREATE TABLE `check_info` (
  `check_id` int(11) NOT NULL AUTO_INCREMENT,
  `class_id` int(11) DEFAULT NULL,
  `check_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `check_file` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`check_id`),
  KEY `FK_class_checkin` (`class_id`),
  CONSTRAINT `FK_class_checkin` FOREIGN KEY (`class_id`) REFERENCES `class_info` (`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of check_info
-- ----------------------------

-- ----------------------------
-- Table structure for classhour_info
-- ----------------------------
DROP TABLE IF EXISTS `classhour_info`;
CREATE TABLE `classhour_info` (
  `classhour_id` int(11) NOT NULL AUTO_INCREMENT,
  `classhour_start` time DEFAULT NULL,
  `classhour_end` time DEFAULT NULL,
  `classhour_avai` int(11) DEFAULT NULL,
  `classhour_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`classhour_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of classhour_info
-- ----------------------------
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

-- ----------------------------
-- Table structure for classroom_info
-- ----------------------------
DROP TABLE IF EXISTS `classroom_info`;
CREATE TABLE `classroom_info` (
  `classroom_id` int(11) NOT NULL AUTO_INCREMENT,
  `classroom_addr` varchar(64) DEFAULT NULL,
  `classroom_avai` int(11) DEFAULT NULL,
  `classroom_type` varchar(64) DEFAULT NULL,
  `classroom_capacity` int(11) DEFAULT NULL,
  `classroom_remark` text,
  PRIMARY KEY (`classroom_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of classroom_info
-- ----------------------------
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

-- ----------------------------
-- Table structure for class_info
-- ----------------------------
DROP TABLE IF EXISTS `class_info`;
CREATE TABLE `class_info` (
  `class_id` int(11) NOT NULL AUTO_INCREMENT,
  `grade_id` int(11) DEFAULT NULL,
  `class_name` varchar(64) DEFAULT NULL,
  `class_avai` int(11) DEFAULT NULL,
  PRIMARY KEY (`class_id`),
  KEY `FK_class_grade` (`grade_id`),
  CONSTRAINT `FK_class_grade` FOREIGN KEY (`grade_id`) REFERENCES `grade_info` (`grade_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of class_info
-- ----------------------------
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

-- ----------------------------
-- Table structure for consultway_info
-- ----------------------------
DROP TABLE IF EXISTS `consultway_info`;
CREATE TABLE `consultway_info` (
  `consultway_id` int(11) NOT NULL AUTO_INCREMENT,
  `consultway_name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`consultway_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of consultway_info
-- ----------------------------
INSERT INTO `consultway_info` VALUES ('1', '上网看到的');
INSERT INTO `consultway_info` VALUES ('2', '听妈妈说的');
INSERT INTO `consultway_info` VALUES ('3', '同学告诉我的');
INSERT INTO `consultway_info` VALUES ('4', '其他途径');

-- ----------------------------
-- Table structure for consult_info
-- ----------------------------
DROP TABLE IF EXISTS `consult_info`;
CREATE TABLE `consult_info` (
  `consult_id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_id` int(11) DEFAULT NULL,
  `student_name` varchar(64) DEFAULT NULL,
  `student_sex` int(11) DEFAULT NULL,
  `student_age` int(11) DEFAULT NULL,
  `student_addr` varchar(255) DEFAULT NULL,
  `student_phone` varchar(12) DEFAULT NULL,
  `student_school` varchar(64) DEFAULT NULL,
  `student_major` varchar(64) DEFAULT NULL,
  `consult_type` varchar(64) DEFAULT NULL,
  `consult_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `student_remark` text,
  PRIMARY KEY (`consult_id`),
  KEY `FK_consult_salesman` (`staff_id`),
  CONSTRAINT `FK_consult_salesman` FOREIGN KEY (`staff_id`) REFERENCES `salesman_info` (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of consult_info
-- ----------------------------
INSERT INTO `consult_info` VALUES ('1', '6', '柯南', '1', '10', '中国 安徽 安庆 太湖', '13365459878', '川大', '软件工程', '1', '2014-03-19 15:01:12', '这是我的备注。。哈哈');
INSERT INTO `consult_info` VALUES ('2', '6', '小兰', '2', '14', '四川 成都 江安 川大', '13365459877', '川大', '软件工程', '2', '2014-03-19 15:01:12', '再看我就把你喝掉');
INSERT INTO `consult_info` VALUES ('3', '6', '小哀', '2', '18', '重庆 重庆 沙坪 地中海', '13365459876', '川大', '软件工程', '3', '2014-03-16 00:51:38', '我喜欢喝茶');

-- ----------------------------
-- Table structure for course_classhour
-- ----------------------------
DROP TABLE IF EXISTS `course_classhour`;
CREATE TABLE `course_classhour` (
  `course_classhour_id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) DEFAULT NULL,
  `classhour_id` int(11) DEFAULT NULL,
  `classroom_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`course_classhour_id`),
  KEY `FK_course_classroom` (`classroom_id`),
  KEY `FK_course_etc` (`course_id`),
  KEY `FK_course_time` (`classhour_id`),
  CONSTRAINT `FK_course_classroom` FOREIGN KEY (`classroom_id`) REFERENCES `classroom_info` (`classroom_id`),
  CONSTRAINT `FK_course_etc` FOREIGN KEY (`course_id`) REFERENCES `course_info` (`course_id`),
  CONSTRAINT `FK_course_time` FOREIGN KEY (`classhour_id`) REFERENCES `classhour_info` (`classhour_id`)
) ENGINE=InnoDB AUTO_INCREMENT=346 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course_classhour
-- ----------------------------

-- ----------------------------
-- Table structure for course_info
-- ----------------------------
DROP TABLE IF EXISTS `course_info`;
CREATE TABLE `course_info` (
  `course_id` int(11) NOT NULL AUTO_INCREMENT,
  `major_id` int(11) DEFAULT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `course_name` varchar(64) DEFAULT NULL,
  `course_start` date DEFAULT NULL,
  `course_end` date DEFAULT NULL,
  `course_price` float DEFAULT NULL,
  `course_times` int(11) DEFAULT NULL,
  `course_avai` int(11) DEFAULT NULL,
  `course_desc` text,
  PRIMARY KEY (`course_id`),
  KEY `course_name_index` (`course_name`),
  KEY `FK_course_major` (`major_id`),
  KEY `FK_teacher_course` (`staff_id`),
  CONSTRAINT `FK_course_major` FOREIGN KEY (`major_id`) REFERENCES `major_info` (`major_id`),
  CONSTRAINT `FK_teacher_course` FOREIGN KEY (`staff_id`) REFERENCES `teacher_info` (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course_info
-- ----------------------------
INSERT INTO `course_info` VALUES ('1', '4', '4', '线性代数', '2014-03-12', '2014-07-12', '20', '2', '1', '线性代数简介');
INSERT INTO `course_info` VALUES ('2', '2', '3', '广义相对论', '2014-03-12', '2014-07-12', '20', '3', '1', '广义相对论简介');
INSERT INTO `course_info` VALUES ('3', '6', '5', '大学英语', '2014-03-12', '2014-07-12', '20', '4', '1', '大学英语简介');
INSERT INTO `course_info` VALUES ('4', '2', '3', '狭义相对论', '2014-03-18', '2014-07-12', '1', '5', '1', '没有简介，想知道去百度google');
INSERT INTO `course_info` VALUES ('5', '2', '4', '量子物理', '2014-03-18', '2014-07-12', '2', '3', '1', '没有简介，想知道去百度google');
INSERT INTO `course_info` VALUES ('6', '2', '5', '原子力学', '2014-03-18', '2014-07-12', '3', '2', '1', '没有简介，想知道去百度google');
INSERT INTO `course_info` VALUES ('7', '5', '3', '语文', '2014-03-18', '2014-07-12', '4', '1', '1', '没有简介，想知道去百度google');
INSERT INTO `course_info` VALUES ('8', '4', '5', '数学', '2014-03-18', '2014-07-12', '5', '6', '1', '没有简介，想知道去百度google');
INSERT INTO `course_info` VALUES ('10', '6', '4', '英语', '2014-03-18', '2014-07-12', '3', '8', '1', '没有简介，想知道去百度google');
INSERT INTO `course_info` VALUES ('11', '3', '5', '化学', '2014-03-18', '2014-07-12', '7', '2', '1', '没有简介，想知道去百度google');
INSERT INTO `course_info` VALUES ('12', '3', '4', '生物', '2014-03-18', '2014-07-12', '8', '3', '1', '没有简介，想知道去百度google');
INSERT INTO `course_info` VALUES ('13', '2', '3', '物理', '2014-03-18', '2014-07-12', '9', '4', '1', '没有简介，想知道去百度google');
INSERT INTO `course_info` VALUES ('14', '5', '3', '政治', '2014-03-18', '2014-07-12', '0', '5', '1', '没有简介，想知道去百度google');
INSERT INTO `course_info` VALUES ('15', '5', '4', '历史', '2014-03-18', '2014-07-12', '1', '2', '1', '没有简介，想知道去百度google');
INSERT INTO `course_info` VALUES ('16', '5', '5', '地理', '2014-03-18', '2014-07-12', '2', '4', '1', '没有简介，想知道去百度google');

-- ----------------------------
-- Table structure for department_info
-- ----------------------------
DROP TABLE IF EXISTS `department_info`;
CREATE TABLE `department_info` (
  `department_id` int(11) NOT NULL AUTO_INCREMENT,
  `branch_id` int(11) NOT NULL,
  `department_name` varchar(64) DEFAULT NULL,
  `department_founded_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `department_avai` int(11) DEFAULT NULL,
  `department_intr` text,
  PRIMARY KEY (`department_id`),
  KEY `FK_department_branch` (`branch_id`),
  CONSTRAINT `FK_department_branch` FOREIGN KEY (`branch_id`) REFERENCES `branch_info` (`branch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of department_info
-- ----------------------------
INSERT INTO `department_info` VALUES ('1', '1', '人事部', '2014-03-12 12:08:46', '1', '人事部门的备注');
INSERT INTO `department_info` VALUES ('2', '1', '开发部', '2014-03-12 12:08:46', '1', '开发部门的备注');
INSERT INTO `department_info` VALUES ('3', '1', '科研部', '2014-03-12 12:08:46', '1', '科研部门的备注');
INSERT INTO `department_info` VALUES ('4', '2', '人事部', '2014-03-12 12:08:46', '1', '人事部门的备注');
INSERT INTO `department_info` VALUES ('5', '2', '开发部', '2014-03-12 12:08:46', '1', '开发部门的备注');
INSERT INTO `department_info` VALUES ('6', '2', '科研部', '2014-03-12 12:08:46', '1', '科研部门的备注');
INSERT INTO `department_info` VALUES ('7', '3', '人事部', '2014-03-12 12:08:46', '1', '人事部门的备注');
INSERT INTO `department_info` VALUES ('8', '3', '开发部', '2014-03-12 12:08:46', '1', '开发部门的备注');
INSERT INTO `department_info` VALUES ('9', '3', '科研部', '2014-03-12 12:08:46', '1', '科研部门的备注');

-- ----------------------------
-- Table structure for financial_records
-- ----------------------------
DROP TABLE IF EXISTS `financial_records`;
CREATE TABLE `financial_records` (
  `financial_id` int(11) NOT NULL AUTO_INCREMENT,
  `branch_id` int(11) DEFAULT NULL,
  `financial_num` float DEFAULT NULL,
  `financial_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `total_money` double DEFAULT NULL,
  `financial_from` text,
  `financial_remark` text,
  PRIMARY KEY (`financial_id`),
  KEY `FK_branch_company_financial` (`branch_id`),
  CONSTRAINT `FK_branch_company_financial` FOREIGN KEY (`branch_id`) REFERENCES `branch_info` (`branch_id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of financial_records
-- ----------------------------

-- ----------------------------
-- Table structure for grade_info
-- ----------------------------
DROP TABLE IF EXISTS `grade_info`;
CREATE TABLE `grade_info` (
  `grade_id` int(11) NOT NULL AUTO_INCREMENT,
  `branch_id` int(11) DEFAULT NULL,
  `grade_name` varchar(64) DEFAULT NULL,
  `grade_avai` int(11) DEFAULT NULL,
  `grade_remark` text,
  PRIMARY KEY (`grade_id`),
  KEY `FK_grade_branch` (`branch_id`),
  CONSTRAINT `FK_grade_branch` FOREIGN KEY (`branch_id`) REFERENCES `branch_info` (`branch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of grade_info
-- ----------------------------
INSERT INTO `grade_info` VALUES ('1', '1', '1年级', '1', '1年级only');
INSERT INTO `grade_info` VALUES ('2', '1', '2年级', '1', '2年级only');
INSERT INTO `grade_info` VALUES ('3', '1', '3年级', '1', '3年级only');
INSERT INTO `grade_info` VALUES ('4', '2', '1年级', '1', '1年级only');
INSERT INTO `grade_info` VALUES ('5', '2', '2年级', '1', '2年级only');
INSERT INTO `grade_info` VALUES ('6', '2', '3年级', '1', '3年级only');
INSERT INTO `grade_info` VALUES ('7', '3', '1年级', '1', '1年级only');
INSERT INTO `grade_info` VALUES ('8', '3', '2年级', '1', '2年级only');
INSERT INTO `grade_info` VALUES ('9', '3', '3年级', '1', '3年级only');

-- ----------------------------
-- Table structure for group_info
-- ----------------------------
DROP TABLE IF EXISTS `group_info`;
CREATE TABLE `group_info` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(64) DEFAULT NULL,
  `group_avai` int(11) DEFAULT NULL,
  `group_remark` text,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of group_info
-- ----------------------------
INSERT INTO `group_info` VALUES ('1', '管理员组', '1', '管理员');
INSERT INTO `group_info` VALUES ('2', '普通教师', '1', '普通教师');
INSERT INTO `group_info` VALUES ('3', '营销人员组', '1', '营销人员');
INSERT INTO `group_info` VALUES ('4', '学生组', '1', '学生');
INSERT INTO `group_info` VALUES ('5', '主管教师', '1', '主管老师');
INSERT INTO `group_info` VALUES ('6', '待定', '1', '待定');

-- ----------------------------
-- Table structure for group_privilege
-- ----------------------------
DROP TABLE IF EXISTS `group_privilege`;
CREATE TABLE `group_privilege` (
  `group_privilege_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) DEFAULT NULL,
  `privilege_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`group_privilege_id`),
  KEY `FK_gp_privilege` (`privilege_id`),
  KEY `FK_group_gp` (`group_id`),
  CONSTRAINT `FK_gp_privilege` FOREIGN KEY (`privilege_id`) REFERENCES `privilege_info` (`privilege_id`),
  CONSTRAINT `FK_group_gp` FOREIGN KEY (`group_id`) REFERENCES `group_info` (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of group_privilege
-- ----------------------------

-- ----------------------------
-- Table structure for major_info
-- ----------------------------
DROP TABLE IF EXISTS `major_info`;
CREATE TABLE `major_info` (
  `major_id` int(11) NOT NULL AUTO_INCREMENT,
  `major_name` varchar(56) DEFAULT NULL,
  `major_intr` text,
  `major_avai` int(11) DEFAULT NULL,
  PRIMARY KEY (`major_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of major_info
-- ----------------------------
INSERT INTO `major_info` VALUES ('1', '软件工程', '软件工程简介。。。', '1');
INSERT INTO `major_info` VALUES ('2', '量子物理', '量子物理简介。。。', '1');
INSERT INTO `major_info` VALUES ('3', '自然', '自然科学简介。。。', '1');
INSERT INTO `major_info` VALUES ('4', '数学', '数学简介。。。', '1');
INSERT INTO `major_info` VALUES ('5', '艺术', '艺术简介。。。', '1');
INSERT INTO `major_info` VALUES ('6', '英语', '英语简介。。。', '1');

-- ----------------------------
-- Table structure for notice_info
-- ----------------------------
DROP TABLE IF EXISTS `notice_info`;
CREATE TABLE `notice_info` (
  `notice_id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_id` int(11) DEFAULT NULL,
  `notice_type` varchar(64) DEFAULT NULL,
  `notice_title` varchar(64) DEFAULT NULL,
  `notice_content` text,
  `notice_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `notice_avai` int(11) DEFAULT NULL,
  PRIMARY KEY (`notice_id`),
  KEY `FK_public_announcement` (`staff_id`),
  CONSTRAINT `FK_public_announcement` FOREIGN KEY (`staff_id`) REFERENCES `staff_info` (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notice_info
-- ----------------------------

-- ----------------------------
-- Table structure for position_info
-- ----------------------------
DROP TABLE IF EXISTS `position_info`;
CREATE TABLE `position_info` (
  `vocation_id` int(11) NOT NULL AUTO_INCREMENT,
  `department_id` int(11) NOT NULL,
  `vocation_name` varchar(64) DEFAULT NULL,
  `wage_base` float DEFAULT NULL,
  `vocation_avai` int(11) DEFAULT NULL,
  `vocation_remark` text,
  PRIMARY KEY (`vocation_id`),
  KEY `FK_staff_department` (`department_id`),
  CONSTRAINT `FK_staff_department` FOREIGN KEY (`department_id`) REFERENCES `department_info` (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of position_info
-- ----------------------------
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

-- ----------------------------
-- Table structure for privilege_info
-- ----------------------------
DROP TABLE IF EXISTS `privilege_info`;
CREATE TABLE `privilege_info` (
  `privilege_id` int(11) NOT NULL AUTO_INCREMENT,
  `privilege_name` varchar(64) DEFAULT NULL,
  `privilege_desc` text,
  PRIMARY KEY (`privilege_id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of privilege_info
-- ----------------------------
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

-- ----------------------------
-- Table structure for register_info
-- ----------------------------
DROP TABLE IF EXISTS `register_info`;
CREATE TABLE `register_info` (
  `register_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `student_course_score` float DEFAULT NULL,
  PRIMARY KEY (`register_id`),
  KEY `FK_course_register` (`course_id`),
  KEY `FK_student_registercourse` (`student_id`),
  CONSTRAINT `FK_course_register` FOREIGN KEY (`course_id`) REFERENCES `course_info` (`course_id`),
  CONSTRAINT `FK_student_registercourse` FOREIGN KEY (`student_id`) REFERENCES `student_info` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of register_info
-- ----------------------------

-- ----------------------------
-- Table structure for roll_state
-- ----------------------------
DROP TABLE IF EXISTS `roll_state`;
CREATE TABLE `roll_state` (
  `rollstate_id` int(11) NOT NULL AUTO_INCREMENT,
  `rollstate_name` varchar(64) DEFAULT NULL,
  `rollstate_intr` text,
  PRIMARY KEY (`rollstate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of roll_state
-- ----------------------------
INSERT INTO `roll_state` VALUES ('1', '在校学生', 'normal');
INSERT INTO `roll_state` VALUES ('2', '退学', 'unnormal');
INSERT INTO `roll_state` VALUES ('3', '毕业', 'gtaduate');
INSERT INTO `roll_state` VALUES ('4', '其它', 'others');

-- ----------------------------
-- Table structure for salesman_info
-- ----------------------------
DROP TABLE IF EXISTS `salesman_info`;
CREATE TABLE `salesman_info` (
  `staff_id` int(11) NOT NULL,
  `salesman_salary` float DEFAULT NULL,
  `staffsman_remark` text,
  PRIMARY KEY (`staff_id`),
  CONSTRAINT `FK_salesman_staff` FOREIGN KEY (`staff_id`) REFERENCES `staff_info` (`staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of salesman_info
-- ----------------------------
INSERT INTO `salesman_info` VALUES ('6', '0', '销售人员1备注');
INSERT INTO `salesman_info` VALUES ('7', '0', '销售人员2备注');
INSERT INTO `salesman_info` VALUES ('8', '0', '销售人员3备注');

-- ----------------------------
-- Table structure for schedule_info
-- ----------------------------
DROP TABLE IF EXISTS `schedule_info`;
CREATE TABLE `schedule_info` (
  `schedule_id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_id` int(11) DEFAULT NULL,
  `schedule_begin` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `schedule_end` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `schedule_content` text,
  `schedule_avai` int(11) DEFAULT NULL,
  PRIMARY KEY (`schedule_id`),
  KEY `FK_staff_schedule` (`staff_id`),
  CONSTRAINT `FK_staff_schedule` FOREIGN KEY (`staff_id`) REFERENCES `staff_info` (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of schedule_info
-- ----------------------------

-- ----------------------------
-- Table structure for staff_attandant
-- ----------------------------
DROP TABLE IF EXISTS `staff_attandant`;
CREATE TABLE `staff_attandant` (
  `attendant_id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_id` int(11) DEFAULT NULL,
  `attendant_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `attendant_remark` text,
  PRIMARY KEY (`attendant_id`),
  KEY `FK_staff_attendant` (`staff_id`),
  CONSTRAINT `FK_staff_attendant` FOREIGN KEY (`staff_id`) REFERENCES `staff_info` (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of staff_attandant
-- ----------------------------

-- ----------------------------
-- Table structure for staff_fees
-- ----------------------------
DROP TABLE IF EXISTS `staff_fees`;
CREATE TABLE `staff_fees` (
  `sfees_id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_id` int(11) DEFAULT NULL,
  `sfees_num` float DEFAULT NULL,
  `sfees_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `sfees_from` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`sfees_id`),
  KEY `FK_staff_get_fees` (`staff_id`),
  CONSTRAINT `FK_staff_get_fees` FOREIGN KEY (`staff_id`) REFERENCES `staff_info` (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of staff_fees
-- ----------------------------

-- ----------------------------
-- Table structure for staff_info
-- ----------------------------
DROP TABLE IF EXISTS `staff_info`;
CREATE TABLE `staff_info` (
  `staff_id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_no` varchar(16) NOT NULL,
  `staff_pass` varchar(32) DEFAULT NULL,
  `staff_sex` int(11) DEFAULT NULL,
  `vocation_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `staff_name` varchar(64) DEFAULT NULL,
  `staff_phone` varchar(12) DEFAULT NULL,
  `staff_qq` varchar(15) DEFAULT NULL,
  `staff_idcard` varchar(18) DEFAULT NULL,
  `staff_empl_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `staff_avai` int(11) DEFAULT NULL,
  `staff_others` text,
  PRIMARY KEY (`staff_id`),
  UNIQUE KEY `staff_idcard_index` (`staff_idcard`),
  KEY `staff_name_index` (`staff_name`),
  KEY `FK_staff_group` (`group_id`),
  KEY `FK_staff_position` (`vocation_id`),
  CONSTRAINT `FK_staff_group` FOREIGN KEY (`group_id`) REFERENCES `group_info` (`group_id`),
  CONSTRAINT `FK_staff_position` FOREIGN KEY (`vocation_id`) REFERENCES `position_info` (`vocation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of staff_info
-- ----------------------------
INSERT INTO `staff_info` VALUES ('1', 'scu1001', 'e10adc3949ba59abbe56e057f20f883e', '1', '1', '1', 'jane', '18255623489', '147895654', '340825199209151514', '2014-03-12 12:08:46', '1', '没有其他信息');
INSERT INTO `staff_info` VALUES ('2', 'scu1002', 'e10adc3949ba59abbe56e057f20f883e', '1', '9', '5', '令狐冲', '18255658989', '147895654', '340825199209151515', '2014-03-12 12:14:34', '1', '没有其他信息');
INSERT INTO `staff_info` VALUES ('3', 'scu1003', 'e10adc3949ba59abbe56e057f20f883e', '0', '9', '5', '东方不败', '18345658989', '147895654', '340825199209151516', '2014-03-12 12:14:36', '1', '没有其他信息');
INSERT INTO `staff_info` VALUES ('4', 'scu1004', 'e10adc3949ba59abbe56e057f20f883e', '0', '9', '5', '任盈盈', '18255888989', '147895654', '340825199209151517', '2014-03-12 12:14:38', '1', '没有其他信息');
INSERT INTO `staff_info` VALUES ('5', 'scu1005', 'e10adc3949ba59abbe56e057f20f883e', '0', '9', '5', '仪琳', '18255577989', '147895654', '340825199209151518', '2014-03-12 12:14:41', '1', '没有其他信息');
INSERT INTO `staff_info` VALUES ('6', 'scu1006', 'e10adc3949ba59abbe56e057f20f883e', '1', '10', '6', '任我行', '18255658989', '147895654', '340825199209151519', '2014-03-12 12:14:44', '1', '没有其他信息');
INSERT INTO `staff_info` VALUES ('7', 'scu1007', 'e10adc3949ba59abbe56e057f20f883e', '1', '11', '6', '岳不群', '18241448989', '147895654', '340825199209151524', '2014-03-12 12:14:47', '1', '没有其他信息');
INSERT INTO `staff_info` VALUES ('8', 'scu1008', 'e10adc3949ba59abbe56e057f20f883e', '1', '12', '6', '田伯光', '18286668989', '147895654', '340825199209151534', '2014-03-12 12:14:51', '1', '没有其他信息');
INSERT INTO `staff_info` VALUES ('9', 'scu1009', 'e10adc3949ba59abbe56e057f20f883e', '1', '22', '6', '方证大师', '18258778989', '147895654', '340825199209151544', '2014-03-12 12:14:55', '1', '没有其他信息');
INSERT INTO `staff_info` VALUES ('10', 'scu1010', 'e10adc3949ba59abbe56e057f20f883e', '1', '26', '6', '左冷禅', '18258778989', '147895654', '340825199209151554', '2014-03-12 12:14:55', '1', '没有其他信息');

-- ----------------------------
-- Table structure for student_attendant
-- ----------------------------
DROP TABLE IF EXISTS `student_attendant`;
CREATE TABLE `student_attendant` (
  `attendant_id` int(11) NOT NULL AUTO_INCREMENT,
  `register_id` int(11) DEFAULT NULL,
  `attendant_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `attendant_remark` text,
  PRIMARY KEY (`attendant_id`),
  KEY `FK_course_attendant` (`register_id`),
  CONSTRAINT `FK_course_attendant` FOREIGN KEY (`register_id`) REFERENCES `register_info` (`register_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student_attendant
-- ----------------------------

-- ----------------------------
-- Table structure for student_consultway
-- ----------------------------
DROP TABLE IF EXISTS `student_consultway`;
CREATE TABLE `student_consultway` (
  `student_consultway_id` int(11) NOT NULL AUTO_INCREMENT,
  `consultway_id` int(11) DEFAULT NULL,
  `consult_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`student_consultway_id`),
  KEY `FK_consult_way` (`consultway_id`),
  KEY `FK_consultway_info` (`consult_id`),
  CONSTRAINT `FK_consultway_info` FOREIGN KEY (`consult_id`) REFERENCES `consult_info` (`consult_id`),
  CONSTRAINT `FK_consult_way` FOREIGN KEY (`consultway_id`) REFERENCES `consultway_info` (`consultway_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student_consultway
-- ----------------------------

-- ----------------------------
-- Table structure for student_fees
-- ----------------------------
DROP TABLE IF EXISTS `student_fees`;
CREATE TABLE `student_fees` (
  `fees_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) DEFAULT NULL,
  `fees_num` float DEFAULT NULL,
  `fees_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fees_for` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`fees_id`),
  KEY `FK_student_pay_fees` (`student_id`),
  CONSTRAINT `FK_student_pay_fees` FOREIGN KEY (`student_id`) REFERENCES `student_info` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student_fees
-- ----------------------------

-- ----------------------------
-- Table structure for student_info
-- ----------------------------
DROP TABLE IF EXISTS `student_info`;
CREATE TABLE `student_info` (
  `student_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_pass` varchar(32) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `rollstate_id` int(11) DEFAULT NULL,
  `consult_id` int(11) DEFAULT NULL,
  `student_no` varchar(64) DEFAULT NULL,
  `student_name` varchar(64) DEFAULT NULL,
  `student_sex` int(11) DEFAULT NULL,
  `student_age` int(11) DEFAULT NULL,
  `student_addr` varchar(255) DEFAULT NULL,
  `student_phone` varchar(12) DEFAULT NULL,
  `student_balance` float DEFAULT NULL,
  `student_school` varchar(64) DEFAULT NULL,
  `student_major` varchar(64) DEFAULT NULL,
  `attend_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `student_state` int(11) DEFAULT NULL,
  `student_remark` text,
  PRIMARY KEY (`student_id`),
  UNIQUE KEY `student_no_index` (`student_no`),
  KEY `student_name_index` (`student_name`),
  KEY `FK_student_class` (`class_id`),
  KEY `FK_student_consult` (`consult_id`),
  KEY `FK_student_group` (`group_id`),
  KEY `FK_student_tollstate` (`rollstate_id`),
  CONSTRAINT `FK_student_class` FOREIGN KEY (`class_id`) REFERENCES `class_info` (`class_id`) ON DELETE SET NULL,
  CONSTRAINT `FK_student_consult` FOREIGN KEY (`consult_id`) REFERENCES `consult_info` (`consult_id`),
  CONSTRAINT `FK_student_group` FOREIGN KEY (`group_id`) REFERENCES `group_info` (`group_id`),
  CONSTRAINT `FK_student_tollstate` FOREIGN KEY (`rollstate_id`) REFERENCES `roll_state` (`rollstate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student_info
-- ----------------------------
INSERT INTO `student_info` VALUES ('1', 'E10ADC3949BA59ABBE56E057F20F883E', '1', '4', '1', '1', '1143111421', '柯南', '1', '10', '中国 安徽 安庆 太湖', '13365459878', '10000', '川大', '软件工程', '2014-03-19 15:01:12', '1', '这是我的备注。。哈哈');
INSERT INTO `student_info` VALUES ('2', 'E10ADC3949BA59ABBE56E057F20F883E', '2', '4', '1', '2', '1143111422', '小兰', '0', '14', '四川 成都 江安 川大', '13365459877', '255', '川大', '软件工程', '2014-03-19 15:01:12', '1', '再看我就把你喝掉');
INSERT INTO `student_info` VALUES ('3', 'e10adc3949ba59abbe56e057f20f883e', '3', '4', '1', '3', '1143111423', '小哀', '0', '18', '重庆 重庆 沙坪 地中海', '13365459876', '300', '川大', '软件工程', '2014-03-16 00:51:38', '1', '我喜欢喝茶');

-- ----------------------------
-- Table structure for teacher_info
-- ----------------------------
DROP TABLE IF EXISTS `teacher_info`;
CREATE TABLE `teacher_info` (
  `staff_id` int(11) NOT NULL,
  `level_id` int(11) DEFAULT NULL,
  `teacher_no` varchar(64) DEFAULT NULL,
  `teacher_major` varchar(64) DEFAULT NULL,
  `teacher_graduate` varchar(64) DEFAULT NULL,
  `teacher_salary` float DEFAULT NULL,
  `teacher_type` int(11) DEFAULT NULL,
  `teacher_remark` text,
  PRIMARY KEY (`staff_id`),
  KEY `FK_teacher_level` (`level_id`),
  CONSTRAINT `FK_teacher_level` FOREIGN KEY (`level_id`) REFERENCES `teacher_level` (`level_id`),
  CONSTRAINT `FK_teacher_staff` FOREIGN KEY (`staff_id`) REFERENCES `staff_info` (`staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher_info
-- ----------------------------
INSERT INTO `teacher_info` VALUES ('2', '1', '9115692', '艺术', '川大', '0', '1', '主管老师令狐冲');
INSERT INTO `teacher_info` VALUES ('3', '2', '9115693', '英语', '浙大', '0', '0', '普通教师东方不败');
INSERT INTO `teacher_info` VALUES ('4', '3', '9115694', '英语', '北大', '0', '0', '普通教师任盈盈');
INSERT INTO `teacher_info` VALUES ('5', '3', '9115695', '英语', '川师', '0', '0', '普通教师仪琳');

-- ----------------------------
-- Table structure for teacher_level
-- ----------------------------
DROP TABLE IF EXISTS `teacher_level`;
CREATE TABLE `teacher_level` (
  `level_id` int(11) NOT NULL AUTO_INCREMENT,
  `level_name` varchar(64) DEFAULT NULL,
  `base_class_hour` int(11) DEFAULT NULL,
  `class_cost` float DEFAULT NULL,
  `level_avai` int(11) DEFAULT NULL,
  `level_remark` text,
  PRIMARY KEY (`level_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher_level
-- ----------------------------
INSERT INTO `teacher_level` VALUES ('1', '第1教师等级', '30', '500', '1', '第1等级教师的备注');
INSERT INTO `teacher_level` VALUES ('2', '第2教师等级', '20', '400', '1', '第2等级教师的备注');
INSERT INTO `teacher_level` VALUES ('3', '第3教师等级', '10', '300', '1', '第3等级教师的备注');

-- ----------------------------
-- Table structure for teaching_manage_info
-- ----------------------------
DROP TABLE IF EXISTS `teaching_manage_info`;
CREATE TABLE `teaching_manage_info` (
  `teaching_manage_id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) DEFAULT NULL,
  `teach_plan` varchar(255) DEFAULT NULL,
  `lesson_plan` varchar(255) DEFAULT NULL,
  `teacher_summary` varchar(255) DEFAULT NULL,
  `set_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `exam_state` int(11) DEFAULT NULL,
  PRIMARY KEY (`teaching_manage_id`),
  KEY `FK_course_teachinfo` (`course_id`),
  CONSTRAINT `FK_course_teachinfo` FOREIGN KEY (`course_id`) REFERENCES `course_info` (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teaching_manage_info
-- ----------------------------
