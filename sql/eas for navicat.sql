/*
Navicat MySQL Data Transfer

Source Server         : Localhost
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : eas

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2014-03-19 13:38:58
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
INSERT INTO `admin_info` VALUES ('1', 'admin', 'E10ADC3949BA59ABBE56E057F20F883E', 'Tom', '12345678900', 'cceasy@hotmail.com', '987654345678909876', '2014-03-12 12:08:46', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of classhour_info
-- ----------------------------
INSERT INTO `classhour_info` VALUES ('1', '12:08:46', '12:08:46', '1', '周一第一节');
INSERT INTO `classhour_info` VALUES ('2', '12:18:25', '14:18:28', '1', '232222');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of classroom_info
-- ----------------------------
INSERT INTO `classroom_info` VALUES ('1', '江安一觉A603', '1', '普通教室', '120', '没有备注');
INSERT INTO `classroom_info` VALUES ('2', '耳机楼B303', '1', '多媒体教室', '100', '没有备注');
INSERT INTO `classroom_info` VALUES ('3', '综合楼B707', '1', '大教室', '300', '没有备注');

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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of class_info
-- ----------------------------
INSERT INTO `class_info` VALUES ('9', null, '3班', '1');
INSERT INTO `class_info` VALUES ('10', '4', '1班', '1');
INSERT INTO `class_info` VALUES ('11', '4', '2班', '1');
INSERT INTO `class_info` VALUES ('12', '4', '3班', '1');
INSERT INTO `class_info` VALUES ('13', '5', '1班', '1');
INSERT INTO `class_info` VALUES ('14', '5', '2班', '1');
INSERT INTO `class_info` VALUES ('15', '5', '3班', '1');
INSERT INTO `class_info` VALUES ('16', '6', '1班', '1');
INSERT INTO `class_info` VALUES ('17', '6', '2班', '1');
INSERT INTO `class_info` VALUES ('18', '6', '3班', '1');
INSERT INTO `class_info` VALUES ('19', null, '我靠', null);
INSERT INTO `class_info` VALUES ('20', null, '你妹啊', null);

-- ----------------------------
-- Table structure for consultway_info
-- ----------------------------
DROP TABLE IF EXISTS `consultway_info`;
CREATE TABLE `consultway_info` (
  `consultway_id` int(11) NOT NULL AUTO_INCREMENT,
  `consultway_name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`consultway_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of consultway_info
-- ----------------------------
INSERT INTO `consultway_info` VALUES ('1', '报纸了解');
INSERT INTO `consultway_info` VALUES ('2', '亲友了解');
INSERT INTO `consultway_info` VALUES ('3', '同学了解');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of consult_info
-- ----------------------------
INSERT INTO `consult_info` VALUES ('1', '5', 'jack1', '1', '18', 'jack1 addr', '4589651', '川大', '软件工程', '咨询方式1', '2014-03-12 12:08:46', 'jack1 remark');
INSERT INTO `consult_info` VALUES ('2', '6', 'jack2', '0', '18', 'jack2 addr', '4589652', '川大', '软件工程', '咨询方式2', '2014-03-12 12:08:46', 'jack2 remark');
INSERT INTO `consult_info` VALUES ('3', '7', 'jack3', '1', '18', 'jack3 addr', '4589653', '川大', '软件工程', '咨询方式3', '2014-03-12 12:08:46', 'jack3 remark');

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course_classhour
-- ----------------------------
INSERT INTO `course_classhour` VALUES ('1', '1', '1', '1');
INSERT INTO `course_classhour` VALUES ('2', '2', '1', '2');
INSERT INTO `course_classhour` VALUES ('3', '3', '1', '3');
INSERT INTO `course_classhour` VALUES ('7', '1', '2', '2');

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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course_info
-- ----------------------------
INSERT INTO `course_info` VALUES ('1', '1', '2', '线性代数', '2014-03-12', '2014-03-12', '20', '2', '1', '线性代数简介');
INSERT INTO `course_info` VALUES ('2', '2', '3', '广义相对论', '2014-03-12', '2014-03-12', '20', null, '1', '广义相对论简介');
INSERT INTO `course_info` VALUES ('3', '3', '4', '大学英语', '2014-03-12', '2014-03-12', '20', null, '1', '大学英语简介');
INSERT INTO `course_info` VALUES ('4', '1', '2', '狭义相对论', '2014-03-18', '2014-03-12', '1', null, '1', null);
INSERT INTO `course_info` VALUES ('5', '2', '3', '量子物理', '2014-03-18', '2014-03-12', '2', null, '1', null);
INSERT INTO `course_info` VALUES ('6', '3', '4', '原子力学', '2014-03-18', '2014-03-12', '3', null, '1', null);
INSERT INTO `course_info` VALUES ('7', '2', '2', '语文', '2014-03-18', '2014-03-12', '4', null, '1', null);
INSERT INTO `course_info` VALUES ('8', '3', '3', '数学', '2014-03-18', '2014-03-12', '5', null, '1', null);
INSERT INTO `course_info` VALUES ('10', '1', '4', '英语', '2014-03-18', '2014-03-12', '3', null, '1', null);
INSERT INTO `course_info` VALUES ('11', '2', '2', '化学', '2014-03-18', '2014-03-12', '7', null, '1', null);
INSERT INTO `course_info` VALUES ('12', '3', '2', '生物', '2014-03-18', '2014-03-12', '8', null, '1', null);
INSERT INTO `course_info` VALUES ('13', '1', '3', '物理', '2014-03-18', '2014-03-12', '9', null, '1', null);
INSERT INTO `course_info` VALUES ('14', '2', '4', '政治', '2014-03-18', '2014-03-12', '0', null, '1', null);
INSERT INTO `course_info` VALUES ('15', '3', '3', '历史', '2014-03-18', '2014-03-12', '1', null, '1', null);
INSERT INTO `course_info` VALUES ('16', '2', '2', '地理', '2014-03-18', '2014-03-12', '2', null, '1', null);

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of financial_records
-- ----------------------------
INSERT INTO `financial_records` VALUES ('1', '1', '1', '2014-03-17 11:21:43', '1', '1', '1');
INSERT INTO `financial_records` VALUES ('2', null, '7678', '2014-03-17 11:24:14', '7679', 'yzy sb', '');

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of grade_info
-- ----------------------------
INSERT INTO `grade_info` VALUES ('4', '2', '1年级', '1', '1年级only');
INSERT INTO `grade_info` VALUES ('5', '2', '2年级', '1', '2年级only');
INSERT INTO `grade_info` VALUES ('6', '2', '3年级', '1', '3年级only');
INSERT INTO `grade_info` VALUES ('7', null, '刘家豪你妹', null, null);
INSERT INTO `grade_info` VALUES ('8', null, '刘家豪你妹', null, null);
INSERT INTO `grade_info` VALUES ('9', null, '刘家豪你妹', null, null);
INSERT INTO `grade_info` VALUES ('10', '1', '刘家豪你妹', null, null);
INSERT INTO `grade_info` VALUES ('12', '1', '你好', null, null);

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of group_info
-- ----------------------------
INSERT INTO `group_info` VALUES ('1', '第一组', '1', '最厉害的组');
INSERT INTO `group_info` VALUES ('2', '第二组', '1', '第二厉害的组');
INSERT INTO `group_info` VALUES ('3', '第三组', '1', '最不厉害的组');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of group_privilege
-- ----------------------------
INSERT INTO `group_privilege` VALUES ('1', '1', '1');
INSERT INTO `group_privilege` VALUES ('2', '2', '2');
INSERT INTO `group_privilege` VALUES ('3', '3', '3');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of major_info
-- ----------------------------
INSERT INTO `major_info` VALUES ('1', '软件工程', '软件工程简介。。。', '1');
INSERT INTO `major_info` VALUES ('2', '量子物理', '量子物理简介。。。', '1');
INSERT INTO `major_info` VALUES ('3', '土木工程', '土木工程简介。。。', '1');

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
INSERT INTO `notice_info` VALUES ('1', '1', '公告类型1', '第1个公告', '第1公告内容', '2014-03-12 12:08:46', '1');
INSERT INTO `notice_info` VALUES ('2', '1', '公告类型2', '第2个公告', '第2个公告内容', '2014-03-12 12:08:46', '1');
INSERT INTO `notice_info` VALUES ('3', '1', '公告类型3', '第3个公告', '第3个公告内容', '2014-03-12 12:08:46', '1');

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
INSERT INTO `position_info` VALUES ('1', '1', '扫地的职位', '2000', '1', '扫地的备注');
INSERT INTO `position_info` VALUES ('2', '1', '部门主管的职位', '3000', '1', '部门主管的备注');
INSERT INTO `position_info` VALUES ('3', '1', '普通员工的职位', '4000', '1', '普通员工的备注');
INSERT INTO `position_info` VALUES ('4', '2', '扫地的职位', '2000', '1', '扫地的备注');
INSERT INTO `position_info` VALUES ('5', '2', '部门主管的职位', '3000', '1', '部门主管的备注');
INSERT INTO `position_info` VALUES ('6', '2', '普通员工的职位', '4000', '1', '普通员工的备注');
INSERT INTO `position_info` VALUES ('7', '3', '扫地的职位', '2000', '1', '扫地的备注');
INSERT INTO `position_info` VALUES ('8', '3', '部门主管的职位', '3000', '1', '部门主管的备注');
INSERT INTO `position_info` VALUES ('9', '3', '普通员工的职位', '4000', '1', '普通员工的备注');
INSERT INTO `position_info` VALUES ('10', '4', '扫地的职位', '2000', '1', '扫地的备注');
INSERT INTO `position_info` VALUES ('11', '4', '部门主管的职位', '3000', '1', '部门主管的备注');
INSERT INTO `position_info` VALUES ('12', '4', '普通员工的职位', '4000', '1', '普通员工的备注');
INSERT INTO `position_info` VALUES ('13', '5', '扫地的职位', '2000', '1', '扫地的备注');
INSERT INTO `position_info` VALUES ('14', '5', '部门主管的职位', '3000', '1', '部门主管的备注');
INSERT INTO `position_info` VALUES ('15', '5', '普通员工的职位', '4000', '1', '普通员工的备注');
INSERT INTO `position_info` VALUES ('16', '6', '扫地的职位', '2000', '1', '扫地的备注');
INSERT INTO `position_info` VALUES ('17', '6', '部门主管的职位', '3000', '1', '部门主管的备注');
INSERT INTO `position_info` VALUES ('18', '6', '普通员工的职位', '4000', '1', '普通员工的备注');
INSERT INTO `position_info` VALUES ('19', '7', '扫地的职位', '2000', '1', '扫地的备注');
INSERT INTO `position_info` VALUES ('20', '7', '部门主管的职位', '3000', '1', '部门主管的备注');
INSERT INTO `position_info` VALUES ('21', '7', '普通员工的职位', '4000', '1', '普通员工的备注');
INSERT INTO `position_info` VALUES ('22', '8', '扫地的职位', '2000', '1', '扫地的备注');
INSERT INTO `position_info` VALUES ('23', '8', '部门主管的职位', '3000', '1', '部门主管的备注');
INSERT INTO `position_info` VALUES ('24', '8', '普通员工的职位', '4000', '1', '普通员工的备注');
INSERT INTO `position_info` VALUES ('25', '9', '扫地的职位', '2000', '1', '扫地的备注');
INSERT INTO `position_info` VALUES ('26', '9', '部门主管的职位', '3000', '1', '部门主管的备注');
INSERT INTO `position_info` VALUES ('27', '9', '普通员工的职位', '4000', '1', '普通员工的备注');

-- ----------------------------
-- Table structure for privilege_info
-- ----------------------------
DROP TABLE IF EXISTS `privilege_info`;
CREATE TABLE `privilege_info` (
  `privilege_id` int(11) NOT NULL AUTO_INCREMENT,
  `privilege_name` varchar(64) DEFAULT NULL,
  `privilege_desc` text,
  PRIMARY KEY (`privilege_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

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
INSERT INTO `privilege_info` VALUES ('36', '添加咨询信息', '财务');
INSERT INTO `privilege_info` VALUES ('37', '查询营销人员信息', '财务');
INSERT INTO `privilege_info` VALUES ('38', '查看营销人员绩效', '财务');

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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of register_info
-- ----------------------------
INSERT INTO `register_info` VALUES ('1', '1', '1', '100');
INSERT INTO `register_info` VALUES ('2', '2', '2', '100');
INSERT INTO `register_info` VALUES ('3', '3', '3', '100');
INSERT INTO `register_info` VALUES ('4', '1', '2', '0');
INSERT INTO `register_info` VALUES ('5', '1', '3', '0');
INSERT INTO `register_info` VALUES ('6', '1', '4', '0');
INSERT INTO `register_info` VALUES ('7', '1', '5', '0');
INSERT INTO `register_info` VALUES ('8', '1', '6', '0');
INSERT INTO `register_info` VALUES ('9', '1', '7', '0');
INSERT INTO `register_info` VALUES ('10', '1', '8', '0');
INSERT INTO `register_info` VALUES ('11', '1', '10', '0');
INSERT INTO `register_info` VALUES ('12', '1', '11', '0');
INSERT INTO `register_info` VALUES ('13', '1', '12', '0');
INSERT INTO `register_info` VALUES ('14', '1', '13', '0');
INSERT INTO `register_info` VALUES ('15', '1', '16', '0');

-- ----------------------------
-- Table structure for roll_state
-- ----------------------------
DROP TABLE IF EXISTS `roll_state`;
CREATE TABLE `roll_state` (
  `rollstate_id` int(11) NOT NULL AUTO_INCREMENT,
  `rollstate_name` varchar(64) DEFAULT NULL,
  `rollstate_intr` text,
  PRIMARY KEY (`rollstate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of roll_state
-- ----------------------------
INSERT INTO `roll_state` VALUES ('1', '在校学生', 'normal');
INSERT INTO `roll_state` VALUES ('2', '退学', 'unnormal');
INSERT INTO `roll_state` VALUES ('3', '毕业', 'gtaduate');

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
INSERT INTO `salesman_info` VALUES ('5', '0', '销售人员1备注');
INSERT INTO `salesman_info` VALUES ('6', '0', '销售人员2备注');
INSERT INTO `salesman_info` VALUES ('7', '0', '销售人员3备注');

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
INSERT INTO `schedule_info` VALUES ('1', '1', '2014-03-12 12:08:46', '2014-03-12 12:08:46', '我的工作日程信息哈哈哈1', '1');
INSERT INTO `schedule_info` VALUES ('2', '2', '2014-03-12 12:08:46', '2014-03-12 12:08:46', '我的工作日程信息哈哈哈2', '1');
INSERT INTO `schedule_info` VALUES ('3', '3', '2014-03-12 12:08:46', '2014-03-12 12:08:46', '我的工作日程信息哈哈哈3', '1');

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
INSERT INTO `staff_attandant` VALUES ('1', '1', '2014-03-12 17:33:43', null);
INSERT INTO `staff_attandant` VALUES ('2', '2', '2014-03-12 18:59:43', null);
INSERT INTO `staff_attandant` VALUES ('3', '4', '2014-03-12 16:59:59', null);
INSERT INTO `staff_attandant` VALUES ('4', '4', '2014-03-12 16:59:59', '');
INSERT INTO `staff_attandant` VALUES ('5', '1', '2014-03-13 15:15:52', null);
INSERT INTO `staff_attandant` VALUES ('6', '2', '2014-03-13 15:15:53', null);
INSERT INTO `staff_attandant` VALUES ('7', '3', '2014-03-13 15:15:53', null);
INSERT INTO `staff_attandant` VALUES ('8', '4', '2014-03-13 15:15:54', null);
INSERT INTO `staff_attandant` VALUES ('9', '5', '2014-03-13 15:15:56', null);
INSERT INTO `staff_attandant` VALUES ('10', '6', '2014-03-13 15:16:01', null);
INSERT INTO `staff_attandant` VALUES ('11', '7', '2014-03-13 15:16:02', null);
INSERT INTO `staff_attandant` VALUES ('12', '8', '2014-03-13 15:16:14', null);
INSERT INTO `staff_attandant` VALUES ('13', '9', '2014-03-13 15:16:14', null);
INSERT INTO `staff_attandant` VALUES ('14', '1', '2014-03-13 15:16:20', null);
INSERT INTO `staff_attandant` VALUES ('15', '2', '2014-03-13 15:16:21', null);
INSERT INTO `staff_attandant` VALUES ('16', '3', '2014-03-13 15:16:21', null);
INSERT INTO `staff_attandant` VALUES ('17', '4', '2014-03-13 15:16:23', null);
INSERT INTO `staff_attandant` VALUES ('18', '5', '2014-03-13 15:18:26', null);
INSERT INTO `staff_attandant` VALUES ('19', '6', '2014-03-13 15:18:26', null);
INSERT INTO `staff_attandant` VALUES ('20', '7', '2014-03-13 15:18:27', null);
INSERT INTO `staff_attandant` VALUES ('21', '8', '2014-03-13 15:18:27', null);
INSERT INTO `staff_attandant` VALUES ('22', '9', '2014-03-13 15:18:28', null);
INSERT INTO `staff_attandant` VALUES ('23', '1', '2014-03-13 15:18:30', null);
INSERT INTO `staff_attandant` VALUES ('24', '2', '2014-03-13 15:18:31', null);
INSERT INTO `staff_attandant` VALUES ('25', '3', '2014-03-13 15:18:33', null);
INSERT INTO `staff_attandant` VALUES ('26', '4', '2014-03-13 15:18:34', null);
INSERT INTO `staff_attandant` VALUES ('27', '5', '2014-03-13 15:18:37', null);
INSERT INTO `staff_attandant` VALUES ('28', '6', '2014-03-13 15:18:35', null);
INSERT INTO `staff_attandant` VALUES ('29', '7', '2014-03-13 15:18:36', null);
INSERT INTO `staff_attandant` VALUES ('30', '8', '2014-03-13 15:18:40', null);
INSERT INTO `staff_attandant` VALUES ('31', '9', '2014-03-13 16:28:38', null);
INSERT INTO `staff_attandant` VALUES ('32', '1', '2014-03-13 16:28:40', null);
INSERT INTO `staff_attandant` VALUES ('33', '2', '2014-03-13 16:28:40', null);
INSERT INTO `staff_attandant` VALUES ('34', '3', '2014-03-13 16:28:41', null);
INSERT INTO `staff_attandant` VALUES ('35', '4', '2014-03-13 16:28:41', null);
INSERT INTO `staff_attandant` VALUES ('36', '5', '2014-03-13 16:28:42', null);
INSERT INTO `staff_attandant` VALUES ('37', '6', '2014-03-13 16:28:42', null);
INSERT INTO `staff_attandant` VALUES ('38', '7', '2014-03-13 16:28:43', null);
INSERT INTO `staff_attandant` VALUES ('39', '8', '2014-03-13 16:28:43', null);
INSERT INTO `staff_attandant` VALUES ('40', '9', '2014-03-13 16:28:44', null);
INSERT INTO `staff_attandant` VALUES ('41', '1', '2014-03-13 16:28:45', null);
INSERT INTO `staff_attandant` VALUES ('42', '2', '2014-03-13 16:28:45', null);
INSERT INTO `staff_attandant` VALUES ('43', '3', '2014-03-13 16:28:45', null);
INSERT INTO `staff_attandant` VALUES ('44', '4', '2014-03-13 16:28:46', null);
INSERT INTO `staff_attandant` VALUES ('45', '5', '2014-03-13 16:28:46', null);
INSERT INTO `staff_attandant` VALUES ('46', '6', '2014-03-13 16:28:47', null);
INSERT INTO `staff_attandant` VALUES ('47', '7', '2014-03-13 16:28:47', null);
INSERT INTO `staff_attandant` VALUES ('48', '8', '2014-03-13 16:28:48', null);
INSERT INTO `staff_attandant` VALUES ('49', '9', '2014-03-13 16:28:48', null);
INSERT INTO `staff_attandant` VALUES ('50', '1', '2014-03-13 16:28:51', null);
INSERT INTO `staff_attandant` VALUES ('51', '2', '2014-03-13 16:28:52', null);
INSERT INTO `staff_attandant` VALUES ('52', '3', '2014-03-13 16:28:53', null);
INSERT INTO `staff_attandant` VALUES ('53', '4', '2014-03-13 16:28:53', null);
INSERT INTO `staff_attandant` VALUES ('54', '5', '2014-03-13 16:28:53', null);
INSERT INTO `staff_attandant` VALUES ('55', '6', '2014-03-13 16:28:54', null);
INSERT INTO `staff_attandant` VALUES ('56', '7', '2014-03-13 16:28:54', null);
INSERT INTO `staff_attandant` VALUES ('57', '8', '2014-03-13 16:28:55', null);
INSERT INTO `staff_attandant` VALUES ('58', '9', '2014-03-13 16:28:57', null);
INSERT INTO `staff_attandant` VALUES ('59', '1', '2014-03-13 16:40:17', null);
INSERT INTO `staff_attandant` VALUES ('60', '2', '2014-03-13 16:40:17', null);
INSERT INTO `staff_attandant` VALUES ('61', '3', '2014-03-13 16:40:18', null);
INSERT INTO `staff_attandant` VALUES ('62', '4', '2014-03-13 16:40:18', null);
INSERT INTO `staff_attandant` VALUES ('63', '5', '2014-03-13 16:40:18', null);
INSERT INTO `staff_attandant` VALUES ('64', '6', '2014-03-13 16:40:19', null);
INSERT INTO `staff_attandant` VALUES ('65', '7', '2014-03-13 16:40:19', null);
INSERT INTO `staff_attandant` VALUES ('66', '8', '2014-03-13 16:40:20', null);
INSERT INTO `staff_attandant` VALUES ('67', '9', '2014-03-13 16:40:22', null);
INSERT INTO `staff_attandant` VALUES ('68', '1', '2014-03-13 16:40:23', null);
INSERT INTO `staff_attandant` VALUES ('69', '2', '2014-03-13 16:40:23', null);
INSERT INTO `staff_attandant` VALUES ('70', '3', '2014-03-13 16:40:23', null);
INSERT INTO `staff_attandant` VALUES ('71', '4', '2014-03-13 16:40:24', null);
INSERT INTO `staff_attandant` VALUES ('72', '5', '2014-03-13 16:40:24', null);
INSERT INTO `staff_attandant` VALUES ('73', '6', '2014-03-13 16:40:24', null);
INSERT INTO `staff_attandant` VALUES ('74', '7', '2014-03-13 16:40:25', null);
INSERT INTO `staff_attandant` VALUES ('75', '8', '2014-03-13 16:40:25', null);
INSERT INTO `staff_attandant` VALUES ('76', '9', '2014-03-13 16:40:28', null);
INSERT INTO `staff_attandant` VALUES ('77', '1', '2014-03-17 21:09:51', null);
INSERT INTO `staff_attandant` VALUES ('78', '1', '2014-03-17 21:09:51', null);
INSERT INTO `staff_attandant` VALUES ('79', '1', '2014-03-17 21:09:52', null);
INSERT INTO `staff_attandant` VALUES ('80', '1', '2014-03-17 21:09:52', null);
INSERT INTO `staff_attandant` VALUES ('81', '1', '2014-03-17 21:09:52', null);
INSERT INTO `staff_attandant` VALUES ('82', '1', '2014-03-17 21:09:53', null);
INSERT INTO `staff_attandant` VALUES ('83', '1', '2014-03-17 21:09:53', null);
INSERT INTO `staff_attandant` VALUES ('84', '1', '2014-03-17 21:09:53', null);
INSERT INTO `staff_attandant` VALUES ('85', '1', '2014-03-17 21:09:54', null);
INSERT INTO `staff_attandant` VALUES ('86', '1', '2014-03-17 21:09:54', null);
INSERT INTO `staff_attandant` VALUES ('87', '1', '2014-03-17 21:09:54', null);
INSERT INTO `staff_attandant` VALUES ('88', '1', '2014-03-17 21:09:55', null);
INSERT INTO `staff_attandant` VALUES ('89', '1', '2014-03-17 21:09:55', null);
INSERT INTO `staff_attandant` VALUES ('90', '1', '2014-03-17 21:09:56', null);
INSERT INTO `staff_attandant` VALUES ('91', '1', '2014-03-17 21:09:56', null);
INSERT INTO `staff_attandant` VALUES ('92', '1', '2014-03-17 21:09:56', null);
INSERT INTO `staff_attandant` VALUES ('93', '1', '2014-03-17 21:09:56', null);
INSERT INTO `staff_attandant` VALUES ('94', '1', '2014-03-17 21:09:57', null);
INSERT INTO `staff_attandant` VALUES ('95', '1', '2014-03-17 21:09:58', null);
INSERT INTO `staff_attandant` VALUES ('96', '1', '2014-03-17 21:09:58', null);
INSERT INTO `staff_attandant` VALUES ('97', '1', '2014-03-17 21:09:58', null);
INSERT INTO `staff_attandant` VALUES ('98', '1', '2014-03-17 21:09:59', null);
INSERT INTO `staff_attandant` VALUES ('99', '1', '2014-03-17 21:09:59', null);
INSERT INTO `staff_attandant` VALUES ('100', '1', '2014-03-17 21:10:00', null);
INSERT INTO `staff_attandant` VALUES ('101', '1', '2014-03-17 21:10:00', null);
INSERT INTO `staff_attandant` VALUES ('102', '1', '2014-03-17 21:10:00', null);
INSERT INTO `staff_attandant` VALUES ('103', '1', '2014-03-17 21:10:01', null);
INSERT INTO `staff_attandant` VALUES ('104', '1', '2014-03-17 21:10:01', null);
INSERT INTO `staff_attandant` VALUES ('105', '1', '2014-03-17 21:10:02', null);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of staff_info
-- ----------------------------
INSERT INTO `staff_info` VALUES ('1', 's1001', 'e10adc3949ba59abbe56e057f20f883e', '1', '1', '1', '张三1', '18255623489', '147895654', '354895214478596548', '2014-03-12 12:08:46', '1', '没有其他信息');
INSERT INTO `staff_info` VALUES ('2', 's1002', 'E10ADC3949BA59ABBE56E057F20F883E', '1', '2', '2', '张三2', '18255658989', '147895654', '353895214478596548', '2014-03-12 12:14:34', '1', '没有其他信息');
INSERT INTO `staff_info` VALUES ('3', 's1003', 'e10adc3949ba59abbe56e057f20f883e', '1', '3', '3', '张三3', '18345658989', '147895654', '356895214478596548', '2014-03-12 12:14:36', '1', '没有其他信息');
INSERT INTO `staff_info` VALUES ('4', 's1004', 'e10adc3949ba59abbe56e057f20f883e', '1', '4', '1', '张三4', '18255888989', '147895654', '354885214478596548', '2014-03-12 12:14:38', '1', '没有其他信息');
INSERT INTO `staff_info` VALUES ('5', 's1005', 'e10adc3949ba59abbe56e057f20f883e', '1', '5', '2', '张三5', '18255577989', '147895654', '350005214478596548', '2014-03-12 12:14:41', '1', '没有其他信息');
INSERT INTO `staff_info` VALUES ('6', 's1006', 'e10adc3949ba59abbe56e057f20f883e', '1', '6', '3', '张三6', '18255658989', '147895654', '354847214478596548', '2014-03-12 12:14:44', '1', '没有其他信息');
INSERT INTO `staff_info` VALUES ('7', 's1007', 'e10adc3949ba59abbe56e057f20f883e', '1', '7', '1', '张三7', '18241448989', '147895654', '354145217478596548', '2014-03-12 12:14:47', '1', '没有其他信息');
INSERT INTO `staff_info` VALUES ('8', 's1008', 'e10adc3949ba59abbe56e057f20f883e', '1', '8', '2', '张三8', '18286668989', '147895654', '354895227785962548', '2014-03-12 12:14:51', '1', '没有其他信息');
INSERT INTO `staff_info` VALUES ('9', 's1009', 'e10adc3949ba59abbe56e057f20f883e', '1', '9', '3', '张三9', '18258778989', '147895654', '354895296668596548', '2014-03-12 12:14:55', '1', '没有其他信息');

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
INSERT INTO `student_attendant` VALUES ('1', '1', '2014-03-12 20:36:55', '');
INSERT INTO `student_attendant` VALUES ('2', '1', '2014-03-12 20:36:55', '');
INSERT INTO `student_attendant` VALUES ('3', '1', '2014-03-12 20:36:55', '');
INSERT INTO `student_attendant` VALUES ('4', '1', '2014-03-12 20:36:55', '');
INSERT INTO `student_attendant` VALUES ('5', '1', '2014-03-12 20:36:55', '');
INSERT INTO `student_attendant` VALUES ('6', '1', '2014-03-12 20:36:55', '');
INSERT INTO `student_attendant` VALUES ('7', '1', '2014-03-12 20:36:55', '');
INSERT INTO `student_attendant` VALUES ('8', '1', '2014-03-12 20:36:55', '');
INSERT INTO `student_attendant` VALUES ('9', '1', '2014-03-12 20:36:55', '');
INSERT INTO `student_attendant` VALUES ('10', '3', '2014-03-17 23:53:44', null);
INSERT INTO `student_attendant` VALUES ('11', '1', '2014-03-12 20:36:55', '');
INSERT INTO `student_attendant` VALUES ('12', '2', '2014-03-17 23:53:08', null);
INSERT INTO `student_attendant` VALUES ('13', '3', '2014-03-17 23:53:08', null);
INSERT INTO `student_attendant` VALUES ('16', '3', '2014-03-17 23:53:15', null);
INSERT INTO `student_attendant` VALUES ('17', '2', '2014-03-17 23:53:16', null);
INSERT INTO `student_attendant` VALUES ('18', '1', '2014-03-17 23:53:16', null);
INSERT INTO `student_attendant` VALUES ('19', '2', '2014-03-17 23:53:17', null);
INSERT INTO `student_attendant` VALUES ('20', '3', '2014-03-17 23:53:17', null);
INSERT INTO `student_attendant` VALUES ('23', '3', '2014-03-17 23:53:36', null);
INSERT INTO `student_attendant` VALUES ('24', '1', '2014-03-18 10:28:54', null);
INSERT INTO `student_attendant` VALUES ('25', '2', '2014-03-18 10:28:57', null);
INSERT INTO `student_attendant` VALUES ('26', '3', '2014-03-18 10:28:58', null);
INSERT INTO `student_attendant` VALUES ('28', '3', '2014-03-18 10:29:02', null);
INSERT INTO `student_attendant` VALUES ('29', '2', '2014-03-18 10:29:03', null);
INSERT INTO `student_attendant` VALUES ('30', '1', '2014-03-18 10:29:04', null);

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
INSERT INTO `student_consultway` VALUES ('1', '1', '1');
INSERT INTO `student_consultway` VALUES ('2', '2', '2');
INSERT INTO `student_consultway` VALUES ('3', '3', '3');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
INSERT INTO `student_info` VALUES ('1', 'E10ADC3949BA59ABBE56E057F20F883E', null, '2', '1', '1', '1143111121', '傻逼', '1', '18', 'jack1 addr', '4589651', '10000', '川大', '软件工程', '2014-03-17 23:50:38', '1', 'jack1 remark');
INSERT INTO `student_info` VALUES ('2', 'e10adc3949ba59abbe56e057f20f883e', null, '2', '1', '1', '1143111122', 'jack2', '0', '18', 'jack2 addr', '4589652', '10000', '川大', '软件工程', '2014-03-16 00:51:34', '1', 'jack2 remark');
INSERT INTO `student_info` VALUES ('3', 'e10adc3949ba59abbe56e057f20f883e', null, '2', '1', '1', '1143111123', 'jack3', '1', '18', 'jack3 addr', '4589653', '10000', '川大', '软件工程', '2014-03-16 00:51:38', '1', 'jack3 remark');

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
INSERT INTO `teacher_info` VALUES ('2', '1', '911111', '数学', '川大', '0', '1', '备注1');
INSERT INTO `teacher_info` VALUES ('3', '2', '932111', '语文', '浙大', '0', '1', '备注2');
INSERT INTO `teacher_info` VALUES ('4', '3', '911351', '英语', '北大', '0', '1', '备注3');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher_level
-- ----------------------------
INSERT INTO `teacher_level` VALUES ('1', '第1教师等级', '30', '500', '1', '第1等级教师的备注');
INSERT INTO `teacher_level` VALUES ('2', '第2教师等级', '20', '400', '1', '第2等级教师的备注');
INSERT INTO `teacher_level` VALUES ('3', '第3教师等级', '40', '300', '1', '第3等级教师的备注');

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
INSERT INTO `teaching_manage_info` VALUES ('1', '1', '1教学计划的URL', 'upload/upload_39fc3f3a_7e3d_4a99_bf4e_3153e29b05e5_00000002.tmp', '1总结的URL', '2014-03-12 12:08:46', '1');
INSERT INTO `teaching_manage_info` VALUES ('2', '2', '2教学计划的URL', '2教案的URL', '2总结的URL', '2014-03-12 12:08:46', '1');
INSERT INTO `teaching_manage_info` VALUES ('3', '3', '3教学计划的URL', '3教案的URL', '3总结的URL', '2014-03-12 12:08:46', '1');
