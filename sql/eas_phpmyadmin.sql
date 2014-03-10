-- phpMyAdmin SQL Dump
-- version 4.1.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 2014-03-10 18:29:37
-- 服务器版本： 5.5.28-log
-- PHP Version: 5.4.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `eas`
--

-- --------------------------------------------------------

--
-- 表的结构 `branch_info`
--

CREATE TABLE IF NOT EXISTS `branch_info` (
  `branch_id` int(11) NOT NULL AUTO_INCREMENT,
  `branch_founded_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `branch_name` varchar(64) DEFAULT NULL,
  `branch_avai` int(11) DEFAULT NULL,
  `branch_intr` text,
  PRIMARY KEY (`branch_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `branch_info`
--

INSERT INTO `branch_info` (`branch_id`, `branch_founded_time`, `branch_name`, `branch_avai`, `branch_intr`) VALUES
(1, '2014-03-10 05:35:07', '上海分公司', 1, '上海分公司的简介哦~'),
(2, '2014-03-10 05:35:07', '成都分公司', 1, '成都分公司的简介哦~'),
(3, '2014-03-10 05:35:07', '重庆分公司', 1, '重庆分公司的简介哦~');

-- --------------------------------------------------------

--
-- 表的结构 `check_info`
--

CREATE TABLE IF NOT EXISTS `check_info` (
  `check_id` int(11) NOT NULL AUTO_INCREMENT,
  `class_id` int(11) DEFAULT NULL,
  `check_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `check_file` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`check_id`),
  KEY `FK_class_checkin` (`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `classhour_info`
--

CREATE TABLE IF NOT EXISTS `classhour_info` (
  `classhour_id` int(11) NOT NULL AUTO_INCREMENT,
  `classhour_start` time DEFAULT NULL,
  `classhour_end` time DEFAULT NULL,
  `classhour_avai` int(11) DEFAULT NULL,
  PRIMARY KEY (`classhour_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `classhour_info`
--

INSERT INTO `classhour_info` (`classhour_id`, `classhour_start`, `classhour_end`, `classhour_avai`) VALUES
(1, '13:35:07', '13:35:07', 1);

-- --------------------------------------------------------

--
-- 表的结构 `classroom_info`
--

CREATE TABLE IF NOT EXISTS `classroom_info` (
  `classroom_id` int(11) NOT NULL AUTO_INCREMENT,
  `classroom_addr` varchar(64) DEFAULT NULL,
  `classroom_avai` int(11) DEFAULT NULL,
  `classroom_type` varchar(64) DEFAULT NULL,
  `classroom_capacity` int(11) DEFAULT NULL,
  `classroom_remark` text,
  PRIMARY KEY (`classroom_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `classroom_info`
--

INSERT INTO `classroom_info` (`classroom_id`, `classroom_addr`, `classroom_avai`, `classroom_type`, `classroom_capacity`, `classroom_remark`) VALUES
(1, '江安一觉A603', 1, '普通教室', 120, '没有备注'),
(2, '耳机楼B303', 1, '多媒体教室', 100, '没有备注'),
(3, '综合楼B707', 1, '大教室', 300, '没有备注');

-- --------------------------------------------------------

--
-- 表的结构 `class_info`
--

CREATE TABLE IF NOT EXISTS `class_info` (
  `class_id` int(11) NOT NULL AUTO_INCREMENT,
  `grade_id` int(11) DEFAULT NULL,
  `class_name` varchar(64) DEFAULT NULL,
  `class_avai` int(11) DEFAULT NULL,
  PRIMARY KEY (`class_id`),
  KEY `FK_class_grade` (`grade_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

--
-- 转存表中的数据 `class_info`
--

INSERT INTO `class_info` (`class_id`, `grade_id`, `class_name`, `class_avai`) VALUES
(1, 1, '1班', 1),
(2, 1, '2班', 1),
(3, 1, '3班', 1),
(4, 2, '1班', 1),
(5, 2, '2班', 1),
(6, 2, '3班', 1),
(7, 3, '1班', 1),
(8, 3, '2班', 1),
(9, 3, '3班', 1),
(10, 4, '1班', 1),
(11, 4, '2班', 1),
(12, 4, '3班', 1),
(13, 5, '1班', 1),
(14, 5, '2班', 1),
(15, 5, '3班', 1),
(16, 6, '1班', 1),
(17, 6, '2班', 1),
(18, 6, '3班', 1);

-- --------------------------------------------------------

--
-- 表的结构 `consultway_info`
--

CREATE TABLE IF NOT EXISTS `consultway_info` (
  `consultway_id` int(11) NOT NULL AUTO_INCREMENT,
  `consultway_name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`consultway_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `consultway_info`
--

INSERT INTO `consultway_info` (`consultway_id`, `consultway_name`) VALUES
(1, '报纸了解'),
(2, '亲友了解'),
(3, '同学了解');

-- --------------------------------------------------------

--
-- 表的结构 `consult_info`
--

CREATE TABLE IF NOT EXISTS `consult_info` (
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
  KEY `FK_consult_salesman` (`staff_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `consult_info`
--

INSERT INTO `consult_info` (`consult_id`, `staff_id`, `student_name`, `student_sex`, `student_age`, `student_addr`, `student_phone`, `student_school`, `student_major`, `consult_type`, `consult_time`, `student_remark`) VALUES
(1, 5, 'jack1', 1, 18, 'jack1 addr', '4589651', '川大', '软件工程', '咨询方式1', '2014-03-10 05:35:07', 'jack1 remark'),
(2, 6, 'jack2', 0, 18, 'jack2 addr', '4589652', '川大', '软件工程', '咨询方式2', '2014-03-10 05:35:07', 'jack2 remark'),
(3, 7, 'jack3', 1, 18, 'jack3 addr', '4589653', '川大', '软件工程', '咨询方式3', '2014-03-10 05:35:07', 'jack3 remark');

-- --------------------------------------------------------

--
-- 表的结构 `course_classhour`
--

CREATE TABLE IF NOT EXISTS `course_classhour` (
  `course_classhour_id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) DEFAULT NULL,
  `classhour_id` int(11) DEFAULT NULL,
  `classroom_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`course_classhour_id`),
  KEY `FK_course_classroom` (`classroom_id`),
  KEY `FK_course_etc` (`course_id`),
  KEY `FK_course_time` (`classhour_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `course_classhour`
--

INSERT INTO `course_classhour` (`course_classhour_id`, `course_id`, `classhour_id`, `classroom_id`) VALUES
(1, 1, 1, 1),
(2, 2, 1, 2),
(3, 3, 1, 3);

-- --------------------------------------------------------

--
-- 表的结构 `course_info`
--

CREATE TABLE IF NOT EXISTS `course_info` (
  `course_id` int(11) NOT NULL AUTO_INCREMENT,
  `major_id` int(11) DEFAULT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `course_name` varchar(64) DEFAULT NULL,
  `course_start` date DEFAULT NULL,
  `course_end` date DEFAULT NULL,
  `course_price` float DEFAULT NULL,
  `course_avai` int(11) DEFAULT NULL,
  `course_desc` text,
  PRIMARY KEY (`course_id`),
  KEY `course_name_index` (`course_name`),
  KEY `FK_course_major` (`major_id`),
  KEY `FK_teacher_course` (`staff_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `course_info`
--

INSERT INTO `course_info` (`course_id`, `major_id`, `staff_id`, `course_name`, `course_start`, `course_end`, `course_price`, `course_avai`, `course_desc`) VALUES
(1, 1, 2, '线性代数', '2014-03-10', '2014-03-10', 20, 1, '线性代数简介'),
(2, 2, 3, '广义相对论', '2014-03-10', '2014-03-10', 20, 1, '广义相对论简介'),
(3, 3, 4, '大学英语', '2014-03-10', '2014-03-10', 20, 1, '大学英语简介');

-- --------------------------------------------------------

--
-- 表的结构 `department_info`
--

CREATE TABLE IF NOT EXISTS `department_info` (
  `department_id` int(11) NOT NULL AUTO_INCREMENT,
  `branch_id` int(11) NOT NULL,
  `department_name` varchar(64) DEFAULT NULL,
  `department_founded_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `department_avai` int(11) DEFAULT NULL,
  `department_intr` text,
  PRIMARY KEY (`department_id`),
  KEY `FK_department_branch` (`branch_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- 转存表中的数据 `department_info`
--

INSERT INTO `department_info` (`department_id`, `branch_id`, `department_name`, `department_founded_time`, `department_avai`, `department_intr`) VALUES
(1, 1, '人事部', '2014-03-10 05:35:07', 1, '人事部门的备注'),
(2, 1, '开发部', '2014-03-10 05:35:07', 1, '开发部门的备注'),
(3, 1, '科研部', '2014-03-10 05:35:07', 1, '科研部门的备注'),
(4, 2, '人事部', '2014-03-10 05:35:07', 1, '人事部门的备注'),
(5, 2, '开发部', '2014-03-10 05:35:07', 1, '开发部门的备注'),
(6, 2, '科研部', '2014-03-10 05:35:07', 1, '科研部门的备注'),
(7, 3, '人事部', '2014-03-10 05:35:07', 1, '人事部门的备注'),
(8, 3, '开发部', '2014-03-10 05:35:07', 1, '开发部门的备注'),
(9, 3, '科研部', '2014-03-10 05:35:07', 1, '科研部门的备注');

-- --------------------------------------------------------

--
-- 表的结构 `grade_info`
--

CREATE TABLE IF NOT EXISTS `grade_info` (
  `grade_id` int(11) NOT NULL AUTO_INCREMENT,
  `branch_id` int(11) DEFAULT NULL,
  `grade_name` varchar(64) DEFAULT NULL,
  `grade_avai` int(11) DEFAULT NULL,
  `grade_remark` text,
  PRIMARY KEY (`grade_id`),
  KEY `FK_grade_branch` (`branch_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `grade_info`
--

INSERT INTO `grade_info` (`grade_id`, `branch_id`, `grade_name`, `grade_avai`, `grade_remark`) VALUES
(1, 1, '1年级', 1, '1年级only'),
(2, 1, '2年级', 1, '2年级only'),
(3, 1, '3年级', 1, '3年级only'),
(4, 2, '1年级', 1, '1年级only'),
(5, 2, '2年级', 1, '2年级only'),
(6, 2, '3年级', 1, '3年级only');

-- --------------------------------------------------------

--
-- 表的结构 `group_info`
--

CREATE TABLE IF NOT EXISTS `group_info` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(64) DEFAULT NULL,
  `group_avai` int(11) DEFAULT NULL,
  `group_remark` text,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `group_info`
--

INSERT INTO `group_info` (`group_id`, `group_name`, `group_avai`, `group_remark`) VALUES
(1, '第一组', 1, '最厉害的组'),
(2, '第二组', 1, '第二厉害的组'),
(3, '第三组', 1, '最不厉害的组');

-- --------------------------------------------------------

--
-- 表的结构 `group_privilege`
--

CREATE TABLE IF NOT EXISTS `group_privilege` (
  `group_privilege_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) DEFAULT NULL,
  `privilege_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`group_privilege_id`),
  KEY `FK_gp_privilege` (`privilege_id`),
  KEY `FK_group_gp` (`group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `group_privilege`
--

INSERT INTO `group_privilege` (`group_privilege_id`, `group_id`, `privilege_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3);

-- --------------------------------------------------------

--
-- 表的结构 `major_info`
--

CREATE TABLE IF NOT EXISTS `major_info` (
  `major_id` int(11) NOT NULL AUTO_INCREMENT,
  `major_name` varchar(56) DEFAULT NULL,
  `major_intr` text,
  `major_avai` int(11) DEFAULT NULL,
  PRIMARY KEY (`major_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `major_info`
--

INSERT INTO `major_info` (`major_id`, `major_name`, `major_intr`, `major_avai`) VALUES
(1, '软件工程', '软件工程简介。。。', 1),
(2, '量子物理', '量子物理简介。。。', 1),
(3, '土木工程', '土木工程简介。。。', 1);

-- --------------------------------------------------------

--
-- 表的结构 `notice_info`
--

CREATE TABLE IF NOT EXISTS `notice_info` (
  `notice_id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_id` int(11) DEFAULT NULL,
  `notice_type` varchar(64) DEFAULT NULL,
  `notice_title` varchar(64) DEFAULT NULL,
  `notice_content` text,
  `notice_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `notice_avai` int(11) DEFAULT NULL,
  PRIMARY KEY (`notice_id`),
  KEY `FK_public_announcement` (`staff_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `notice_info`
--

INSERT INTO `notice_info` (`notice_id`, `staff_id`, `notice_type`, `notice_title`, `notice_content`, `notice_time`, `notice_avai`) VALUES
(1, 1, '公告类型1', '第1个公告', '第1公告内容', '2014-03-10 05:35:07', 1),
(2, 1, '公告类型2', '第2个公告', '第2个公告内容', '2014-03-10 05:35:07', 1),
(3, 1, '公告类型3', '第3个公告', '第3个公告内容', '2014-03-10 05:35:07', 1);

-- --------------------------------------------------------

--
-- 表的结构 `position_info`
--

CREATE TABLE IF NOT EXISTS `position_info` (
  `vocation_id` int(11) NOT NULL AUTO_INCREMENT,
  `department_id` int(11) NOT NULL,
  `vocation_name` varchar(64) DEFAULT NULL,
  `wage_base` float DEFAULT NULL,
  `vocation_avai` int(11) DEFAULT NULL,
  `vocation_remark` text,
  PRIMARY KEY (`vocation_id`),
  KEY `FK_staff_department` (`department_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=28 ;

--
-- 转存表中的数据 `position_info`
--

INSERT INTO `position_info` (`vocation_id`, `department_id`, `vocation_name`, `wage_base`, `vocation_avai`, `vocation_remark`) VALUES
(1, 1, '扫地的职位', 2000, 1, '扫地的备注'),
(2, 1, '部门主管的职位', 3000, 1, '部门主管的备注'),
(3, 1, '普通员工的职位', 4000, 1, '普通员工的备注'),
(4, 2, '扫地的职位', 2000, 1, '扫地的备注'),
(5, 2, '部门主管的职位', 3000, 1, '部门主管的备注'),
(6, 2, '普通员工的职位', 4000, 1, '普通员工的备注'),
(7, 3, '扫地的职位', 2000, 1, '扫地的备注'),
(8, 3, '部门主管的职位', 3000, 1, '部门主管的备注'),
(9, 3, '普通员工的职位', 4000, 1, '普通员工的备注'),
(10, 4, '扫地的职位', 2000, 1, '扫地的备注'),
(11, 4, '部门主管的职位', 3000, 1, '部门主管的备注'),
(12, 4, '普通员工的职位', 4000, 1, '普通员工的备注'),
(13, 5, '扫地的职位', 2000, 1, '扫地的备注'),
(14, 5, '部门主管的职位', 3000, 1, '部门主管的备注'),
(15, 5, '普通员工的职位', 4000, 1, '普通员工的备注'),
(16, 6, '扫地的职位', 2000, 1, '扫地的备注'),
(17, 6, '部门主管的职位', 3000, 1, '部门主管的备注'),
(18, 6, '普通员工的职位', 4000, 1, '普通员工的备注'),
(19, 7, '扫地的职位', 2000, 1, '扫地的备注'),
(20, 7, '部门主管的职位', 3000, 1, '部门主管的备注'),
(21, 7, '普通员工的职位', 4000, 1, '普通员工的备注'),
(22, 8, '扫地的职位', 2000, 1, '扫地的备注'),
(23, 8, '部门主管的职位', 3000, 1, '部门主管的备注'),
(24, 8, '普通员工的职位', 4000, 1, '普通员工的备注'),
(25, 9, '扫地的职位', 2000, 1, '扫地的备注'),
(26, 9, '部门主管的职位', 3000, 1, '部门主管的备注'),
(27, 9, '普通员工的职位', 4000, 1, '普通员工的备注');

-- --------------------------------------------------------

--
-- 表的结构 `privilege_info`
--

CREATE TABLE IF NOT EXISTS `privilege_info` (
  `privilege_id` int(11) NOT NULL AUTO_INCREMENT,
  `privilege_name` varchar(64) DEFAULT NULL,
  `privilege_desc` text,
  PRIMARY KEY (`privilege_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `privilege_info`
--

INSERT INTO `privilege_info` (`privilege_id`, `privilege_name`, `privilege_desc`) VALUES
(1, '系统管理员', '管理系统'),
(2, '学生', '学生权限'),
(3, '教务老师', '教务老师权限');

-- --------------------------------------------------------

--
-- 表的结构 `register_info`
--

CREATE TABLE IF NOT EXISTS `register_info` (
  `register_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `student_course_score` float DEFAULT NULL,
  PRIMARY KEY (`register_id`),
  KEY `FK_course_register` (`course_id`),
  KEY `FK_student_registercourse` (`student_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `register_info`
--

INSERT INTO `register_info` (`register_id`, `student_id`, `course_id`, `student_course_score`) VALUES
(1, 1, 1, 100),
(2, 2, 2, 100),
(3, 3, 3, 100);

-- --------------------------------------------------------

--
-- 表的结构 `roll_state`
--

CREATE TABLE IF NOT EXISTS `roll_state` (
  `rollstate_id` int(11) NOT NULL AUTO_INCREMENT,
  `rollstate_name` varchar(64) DEFAULT NULL,
  `rollstate_intr` text,
  PRIMARY KEY (`rollstate_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `roll_state`
--

INSERT INTO `roll_state` (`rollstate_id`, `rollstate_name`, `rollstate_intr`) VALUES
(1, '在校学生', 'normal'),
(2, '退学', 'unnormal'),
(3, '毕业', 'gtaduate');

-- --------------------------------------------------------

--
-- 表的结构 `salesman_info`
--

CREATE TABLE IF NOT EXISTS `salesman_info` (
  `staff_id` int(11) NOT NULL,
  `salesman_salary` float DEFAULT NULL,
  `staffsman_remark` text,
  PRIMARY KEY (`staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `salesman_info`
--

INSERT INTO `salesman_info` (`staff_id`, `salesman_salary`, `staffsman_remark`) VALUES
(5, 0, '销售人员1备注'),
(6, 0, '销售人员2备注'),
(7, 0, '销售人员3备注');

-- --------------------------------------------------------

--
-- 表的结构 `schedule_info`
--

CREATE TABLE IF NOT EXISTS `schedule_info` (
  `schedule_id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_id` int(11) DEFAULT NULL,
  `schedule_begin` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `schedule_end` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `schedule_content` text,
  `schedule_avai` int(11) DEFAULT NULL,
  PRIMARY KEY (`schedule_id`),
  KEY `FK_staff_schedule` (`staff_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `schedule_info`
--

INSERT INTO `schedule_info` (`schedule_id`, `staff_id`, `schedule_begin`, `schedule_end`, `schedule_content`, `schedule_avai`) VALUES
(1, 1, '2014-03-10 05:35:07', '2014-03-10 05:35:07', '我的工作日程信息哈哈哈1', 1),
(2, 2, '2014-03-10 05:35:07', '2014-03-10 05:35:07', '我的工作日程信息哈哈哈2', 1),
(3, 3, '2014-03-10 05:35:07', '2014-03-10 05:35:07', '我的工作日程信息哈哈哈3', 1);

-- --------------------------------------------------------

--
-- 表的结构 `staff_attandant`
--

CREATE TABLE IF NOT EXISTS `staff_attandant` (
  `attendant_id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_id` int(11) DEFAULT NULL,
  `attendant_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `attendant_remark` text,
  PRIMARY KEY (`attendant_id`),
  KEY `FK_staff_attendant` (`staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `staff_info`
--

CREATE TABLE IF NOT EXISTS `staff_info` (
  `staff_id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_pass` varchar(16) DEFAULT NULL,
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
  KEY `FK_staff_position` (`vocation_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- 转存表中的数据 `staff_info`
--

INSERT INTO `staff_info` (`staff_id`, `staff_pass`, `vocation_id`, `group_id`, `staff_name`, `staff_phone`, `staff_qq`, `staff_idcard`, `staff_empl_time`, `staff_avai`, `staff_others`) VALUES
(1, '123456', 1, 1, '张三1', '18255623489', '147895654', '354895214478596548', '2014-03-10 05:35:07', 1, '没有其他信息'),
(2, '123456', 2, 2, '张三2', '18255658989', '147895654', '353895214478596548', '2014-03-10 05:35:07', 1, '没有其他信息'),
(3, '123456', 3, 3, '张三3', '18345658989', '147895654', '356895214478596548', '2014-03-10 05:35:07', 1, '没有其他信息'),
(4, '123456', 4, 1, '张三4', '18255888989', '147895654', '354885214478596548', '2014-03-10 05:35:07', 1, '没有其他信息'),
(5, '123456', 5, 2, '张三5', '18255577989', '147895654', '350005214478596548', '2014-03-10 05:35:07', 1, '没有其他信息'),
(6, '123456', 6, 3, '张三6', '18255658989', '147895654', '354847214478596548', '2014-03-10 05:35:07', 1, '没有其他信息'),
(7, '123456', 7, 1, '张三7', '18241448989', '147895654', '354145217478596548', '2014-03-10 05:35:07', 1, '没有其他信息'),
(8, '123456', 8, 2, '张三8', '18286668989', '147895654', '354895227785962548', '2014-03-10 05:35:07', 1, '没有其他信息'),
(9, '123456', 9, 3, '张三9', '18258778989', '147895654', '354895296668596548', '2014-03-10 05:35:07', 1, '没有其他信息');

-- --------------------------------------------------------

--
-- 表的结构 `student_attendant`
--

CREATE TABLE IF NOT EXISTS `student_attendant` (
  `attendant_id` int(11) NOT NULL AUTO_INCREMENT,
  `register_id` int(11) DEFAULT NULL,
  `attendant_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `attendant_remark` text,
  PRIMARY KEY (`attendant_id`),
  KEY `FK_course_attendant` (`register_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `student_consultway`
--

CREATE TABLE IF NOT EXISTS `student_consultway` (
  `student_consultway_id` int(11) NOT NULL AUTO_INCREMENT,
  `consultway_id` int(11) DEFAULT NULL,
  `consult_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`student_consultway_id`),
  KEY `FK_consult_way` (`consultway_id`),
  KEY `FK_consultway_info` (`consult_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `student_consultway`
--

INSERT INTO `student_consultway` (`student_consultway_id`, `consultway_id`, `consult_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3);

-- --------------------------------------------------------

--
-- 表的结构 `student_info`
--

CREATE TABLE IF NOT EXISTS `student_info` (
  `student_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_pass` varchar(32) NOT NULL,
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
  KEY `FK_student_tollstate` (`rollstate_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `student_info`
--

INSERT INTO `student_info` (`student_id`, `student_pass`, `class_id`, `group_id`, `rollstate_id`, `consult_id`, `student_no`, `student_name`, `student_sex`, `student_age`, `student_addr`, `student_phone`, `student_balance`, `student_school`, `student_major`, `attend_time`, `student_state`, `student_remark`) VALUES
(1, 'E10ADC3949BA59ABBE56E057F20F883E', 1, 2, 1, 1, '1143111065', 'jack1', 1, 18, 'jack1 addr', '4589651', 10000, '川大', '软件工程', '2014-03-10 05:56:46', 1, 'jack1 remark'),
(2, 'E10ADC3949BA59ABBE56E057F20F883E', 2, 2, 1, 1, '1143111122', 'jack2', 0, 18, 'jack2 addr', '4589652', 10000, '川大', '软件工程', '2014-03-10 05:37:38', 1, 'jack2 remark'),
(3, 'E10ADC3949BA59ABBE56E057F20F883E', 3, 2, 1, 1, '1143111123', 'jack3', 1, 18, 'jack3 addr', '4589653', 10000, '川大', '软件工程', '2014-03-10 05:37:41', 1, 'jack3 remark');

-- --------------------------------------------------------

--
-- 表的结构 `teacher_info`
--

CREATE TABLE IF NOT EXISTS `teacher_info` (
  `staff_id` int(11) NOT NULL,
  `level_id` int(11) DEFAULT NULL,
  `teacher_no` varchar(64) DEFAULT NULL,
  `teacher_major` varchar(64) DEFAULT NULL,
  `teacher_graduate` varchar(64) DEFAULT NULL,
  `teacher_salary` float DEFAULT NULL,
  `teacher_type` int(11) DEFAULT NULL,
  `teacher_remark` text,
  PRIMARY KEY (`staff_id`),
  KEY `FK_teacher_level` (`level_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `teacher_info`
--

INSERT INTO `teacher_info` (`staff_id`, `level_id`, `teacher_no`, `teacher_major`, `teacher_graduate`, `teacher_salary`, `teacher_type`, `teacher_remark`) VALUES
(2, 1, '911111', '数学', '川大', 0, 1, '备注1'),
(3, 2, '932111', '语文', '浙大', 0, 1, '备注2'),
(4, 3, '911351', '英语', '北大', 0, 1, '备注3');

-- --------------------------------------------------------

--
-- 表的结构 `teacher_level`
--

CREATE TABLE IF NOT EXISTS `teacher_level` (
  `level_id` int(11) NOT NULL AUTO_INCREMENT,
  `level_name` varchar(64) DEFAULT NULL,
  `base_class_hour` int(11) DEFAULT NULL,
  `class_cost` float DEFAULT NULL,
  `level_avai` int(11) DEFAULT NULL,
  `level_remark` text,
  PRIMARY KEY (`level_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `teacher_level`
--

INSERT INTO `teacher_level` (`level_id`, `level_name`, `base_class_hour`, `class_cost`, `level_avai`, `level_remark`) VALUES
(1, '第1教师等级', 30, 500, 1, '第1等级教师的备注'),
(2, '第2教师等级', 20, 400, 1, '第2等级教师的备注'),
(3, '第3教师等级', 40, 300, 1, '第3等级教师的备注');

-- --------------------------------------------------------

--
-- 表的结构 `teaching_manage_info`
--

CREATE TABLE IF NOT EXISTS `teaching_manage_info` (
  `teaching_manage_id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) DEFAULT NULL,
  `teach_plan` varchar(255) DEFAULT NULL,
  `lesson_plan` varchar(255) DEFAULT NULL,
  `teacher_summary` varchar(255) DEFAULT NULL,
  `exam_state` int(11) DEFAULT NULL,
  `set_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`teaching_manage_id`),
  KEY `FK_course_teachinfo` (`course_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `teaching_manage_info`
--

INSERT INTO `teaching_manage_info` (`teaching_manage_id`, `course_id`, `teach_plan`, `lesson_plan`, `teacher_summary`, `exam_state`, `set_time`) VALUES
(1, 1, '1教学计划的URL', '1教案的URL', '1总结的URL', 1, '2014-03-10 10:28:55'),
(2, 2, '2教学计划的URL', '2教案的URL', '2总结的URL', 1, '2014-03-10 10:28:56'),
(3, 3, '3教学计划的URL', '3教案的URL', '3总结的URL', 1, '2014-03-10 10:28:59');

-- --------------------------------------------------------

--
-- 表的结构 `testssh_table`
--

CREATE TABLE IF NOT EXISTS `testssh_table` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) NOT NULL,
  `user_pass` varchar(50) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `testssh_table`
--

INSERT INTO `testssh_table` (`user_id`, `user_name`, `user_pass`) VALUES
(1, 'admin', '123');

--
-- 限制导出的表
--

--
-- 限制表 `check_info`
--
ALTER TABLE `check_info`
  ADD CONSTRAINT `FK_class_checkin` FOREIGN KEY (`class_id`) REFERENCES `class_info` (`class_id`);

--
-- 限制表 `class_info`
--
ALTER TABLE `class_info`
  ADD CONSTRAINT `FK_class_grade` FOREIGN KEY (`grade_id`) REFERENCES `grade_info` (`grade_id`);

--
-- 限制表 `consult_info`
--
ALTER TABLE `consult_info`
  ADD CONSTRAINT `FK_consult_salesman` FOREIGN KEY (`staff_id`) REFERENCES `salesman_info` (`staff_id`);

--
-- 限制表 `course_classhour`
--
ALTER TABLE `course_classhour`
  ADD CONSTRAINT `FK_course_time` FOREIGN KEY (`classhour_id`) REFERENCES `classhour_info` (`classhour_id`),
  ADD CONSTRAINT `FK_course_classroom` FOREIGN KEY (`classroom_id`) REFERENCES `classroom_info` (`classroom_id`),
  ADD CONSTRAINT `FK_course_etc` FOREIGN KEY (`course_id`) REFERENCES `course_info` (`course_id`);

--
-- 限制表 `course_info`
--
ALTER TABLE `course_info`
  ADD CONSTRAINT `FK_teacher_course` FOREIGN KEY (`staff_id`) REFERENCES `teacher_info` (`staff_id`),
  ADD CONSTRAINT `FK_course_major` FOREIGN KEY (`major_id`) REFERENCES `major_info` (`major_id`);

--
-- 限制表 `department_info`
--
ALTER TABLE `department_info`
  ADD CONSTRAINT `FK_department_branch` FOREIGN KEY (`branch_id`) REFERENCES `branch_info` (`branch_id`);

--
-- 限制表 `grade_info`
--
ALTER TABLE `grade_info`
  ADD CONSTRAINT `FK_grade_branch` FOREIGN KEY (`branch_id`) REFERENCES `branch_info` (`branch_id`);

--
-- 限制表 `group_privilege`
--
ALTER TABLE `group_privilege`
  ADD CONSTRAINT `FK_group_gp` FOREIGN KEY (`group_id`) REFERENCES `group_info` (`group_id`),
  ADD CONSTRAINT `FK_gp_privilege` FOREIGN KEY (`privilege_id`) REFERENCES `privilege_info` (`privilege_id`);

--
-- 限制表 `notice_info`
--
ALTER TABLE `notice_info`
  ADD CONSTRAINT `FK_public_announcement` FOREIGN KEY (`staff_id`) REFERENCES `staff_info` (`staff_id`);

--
-- 限制表 `position_info`
--
ALTER TABLE `position_info`
  ADD CONSTRAINT `FK_staff_department` FOREIGN KEY (`department_id`) REFERENCES `department_info` (`department_id`);

--
-- 限制表 `register_info`
--
ALTER TABLE `register_info`
  ADD CONSTRAINT `FK_student_registercourse` FOREIGN KEY (`student_id`) REFERENCES `student_info` (`student_id`),
  ADD CONSTRAINT `FK_course_register` FOREIGN KEY (`course_id`) REFERENCES `course_info` (`course_id`);

--
-- 限制表 `salesman_info`
--
ALTER TABLE `salesman_info`
  ADD CONSTRAINT `FK_salesman_staff` FOREIGN KEY (`staff_id`) REFERENCES `staff_info` (`staff_id`);

--
-- 限制表 `schedule_info`
--
ALTER TABLE `schedule_info`
  ADD CONSTRAINT `FK_staff_schedule` FOREIGN KEY (`staff_id`) REFERENCES `staff_info` (`staff_id`);

--
-- 限制表 `staff_attandant`
--
ALTER TABLE `staff_attandant`
  ADD CONSTRAINT `FK_staff_attendant` FOREIGN KEY (`staff_id`) REFERENCES `staff_info` (`staff_id`);

--
-- 限制表 `staff_info`
--
ALTER TABLE `staff_info`
  ADD CONSTRAINT `FK_staff_position` FOREIGN KEY (`vocation_id`) REFERENCES `position_info` (`vocation_id`),
  ADD CONSTRAINT `FK_staff_group` FOREIGN KEY (`group_id`) REFERENCES `group_info` (`group_id`);

--
-- 限制表 `student_attendant`
--
ALTER TABLE `student_attendant`
  ADD CONSTRAINT `FK_course_attendant` FOREIGN KEY (`register_id`) REFERENCES `register_info` (`register_id`);

--
-- 限制表 `student_consultway`
--
ALTER TABLE `student_consultway`
  ADD CONSTRAINT `FK_consultway_info` FOREIGN KEY (`consult_id`) REFERENCES `consult_info` (`consult_id`),
  ADD CONSTRAINT `FK_consult_way` FOREIGN KEY (`consultway_id`) REFERENCES `consultway_info` (`consultway_id`);

--
-- 限制表 `student_info`
--
ALTER TABLE `student_info`
  ADD CONSTRAINT `FK_student_class` FOREIGN KEY (`class_id`) REFERENCES `class_info` (`class_id`),
  ADD CONSTRAINT `FK_student_consult` FOREIGN KEY (`consult_id`) REFERENCES `consult_info` (`consult_id`),
  ADD CONSTRAINT `FK_student_group` FOREIGN KEY (`group_id`) REFERENCES `group_info` (`group_id`),
  ADD CONSTRAINT `FK_student_tollstate` FOREIGN KEY (`rollstate_id`) REFERENCES `roll_state` (`rollstate_id`);

--
-- 限制表 `teacher_info`
--
ALTER TABLE `teacher_info`
  ADD CONSTRAINT `FK_teacher_staff` FOREIGN KEY (`staff_id`) REFERENCES `staff_info` (`staff_id`),
  ADD CONSTRAINT `FK_teacher_level` FOREIGN KEY (`level_id`) REFERENCES `teacher_level` (`level_id`);

--
-- 限制表 `teaching_manage_info`
--
ALTER TABLE `teaching_manage_info`
  ADD CONSTRAINT `FK_course_teachinfo` FOREIGN KEY (`course_id`) REFERENCES `course_info` (`course_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
