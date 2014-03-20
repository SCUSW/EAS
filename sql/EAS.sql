/*
Navicat MySQL Data Transfer

Source Server         : Localhost
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : eas

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2014-03-21 03:35:30
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

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
