/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2014-3-10 11:12:14                           */
/*==============================================================*/


drop table if exists branch_info;

drop table if exists check_info;

drop table if exists class_info;

drop table if exists classhour_info;

drop table if exists classroom_info;

drop table if exists consult_info;

drop table if exists consultway_info;

drop table if exists course_classhour;

drop table if exists course_info;

drop table if exists department_info;

drop table if exists grade_info;

drop table if exists group_info;

drop table if exists group_privilege;

drop table if exists major_info;

drop table if exists notice_info;

drop table if exists position_info;

drop table if exists privilege_info;

drop table if exists register_info;

drop table if exists roll_state;

drop table if exists salesman_info;

drop table if exists schedule_info;

drop table if exists staff_attandant;

drop table if exists staff_info;

drop table if exists student_attendant;

drop table if exists student_consultway;

drop table if exists student_info;

drop table if exists teacher_info;

drop table if exists teacher_level;

drop table if exists teaching_manage_info;

/*==============================================================*/
/* Table: branch_info                                           */
/*==============================================================*/
create table branch_info
(
   branch_id            int not null auto_increment,
   branch_founded_time  timestamp,
   branch_name          varchar(64),
   branch_avai          int,
   branch_intr          text,
   primary key (branch_id)
);

/*==============================================================*/
/* Table: check_info                                            */
/*==============================================================*/
create table check_info
(
   check_id             int not null auto_increment,
   class_id             int,
   check_time           timestamp,
   check_file           varchar(255),
   primary key (check_id)
);

/*==============================================================*/
/* Table: class_info                                            */
/*==============================================================*/
create table class_info
(
   class_id             int not null auto_increment,
   grade_id             int,
   class_name           varchar(64),
   class_avai           int,
   primary key (class_id)
);

/*==============================================================*/
/* Table: classhour_info                                        */
/*==============================================================*/
create table classhour_info
(
   classhour_id         int not null auto_increment,
   classhour_start      time,
   classhour_end        time,
   classhour_avai       int,
   primary key (classhour_id)
);

/*==============================================================*/
/* Table: classroom_info                                        */
/*==============================================================*/
create table classroom_info
(
   classroom_id         int not null auto_increment,
   classroom_addr       varchar(64),
   classroom_avai       boolean,
   classroom_type       varchar(64),
   classroom_capacity   int,
   classroom_remark     text,
   primary key (classroom_id)
);

/*==============================================================*/
/* Table: consult_info                                          */
/*==============================================================*/
create table consult_info
(
   consult_id           int not null auto_increment,
   staff_id             int,
   student_name         varchar(64),
   student_sex          int,
   student_age          int,
   student_addr         varchar(255),
   student_phone        varchar(12),
   student_school       varchar(64),
   student_major        varchar(64),
   consult_type         varchar(64),
   consult_time         timestamp,
   student_remark       text,
   primary key (consult_id)
);

/*==============================================================*/
/* Table: consultway_info                                       */
/*==============================================================*/
create table consultway_info
(
   consultway_id        int not null auto_increment,
   consultway_name      varchar(64),
   primary key (consultway_id)
);

/*==============================================================*/
/* Table: course_classhour                                      */
/*==============================================================*/
create table course_classhour
(
   course_classhour_id  int not null auto_increment,
   course_id            int,
   classhour_id         int,
   classroom_id         int,
   primary key (course_classhour_id)
);

/*==============================================================*/
/* Table: course_info                                           */
/*==============================================================*/
create table course_info
(
   course_id            int not null auto_increment,
   major_id             int,
   staff_id             int,
   course_name          varchar(64),
   course_start         date,
   course_end           date,
   course_price         float,
   course_avai          int,
   course_desc          text,
   primary key (course_id)
);

/*==============================================================*/
/* Index: course_name_index                                     */
/*==============================================================*/
create index course_name_index on course_info
(
   course_name
);

/*==============================================================*/
/* Table: department_info                                       */
/*==============================================================*/
create table department_info
(
   department_id        int not null auto_increment,
   branch_id            int not null,
   department_name      varchar(64),
   department_founded_time timestamp,
   department_avai      int,
   department_intr      text,
   primary key (department_id)
);

/*==============================================================*/
/* Table: grade_info                                            */
/*==============================================================*/
create table grade_info
(
   grade_id             int not null auto_increment,
   branch_id            int,
   grade_name           varchar(64),
   grade_avai           int,
   grade_remark         text,
   primary key (grade_id)
);

/*==============================================================*/
/* Table: group_info                                            */
/*==============================================================*/
create table group_info
(
   group_id             int not null auto_increment,
   group_name           varchar(64),
   group_avai           int,
   group_remark         text,
   primary key (group_id)
);

/*==============================================================*/
/* Table: group_privilege                                       */
/*==============================================================*/
create table group_privilege
(
   group_privilege_id   int not null auto_increment,
   group_id             int,
   privilege_id         int,
   primary key (group_privilege_id)
);

/*==============================================================*/
/* Table: major_info                                            */
/*==============================================================*/
create table major_info
(
   major_id             int not null auto_increment,
   major_name           varchar(56),
   major_intr           text,
   major_avai           int,
   primary key (major_id)
);

/*==============================================================*/
/* Table: notice_info                                           */
/*==============================================================*/
create table notice_info
(
   notice_id            int not null auto_increment,
   staff_id             int,
   notice_type          varchar(64),
   notice_title         varchar(64),
   notice_content       text,
   notice_time          timestamp,
   notice_avai          int,
   primary key (notice_id)
);

/*==============================================================*/
/* Table: position_info                                         */
/*==============================================================*/
create table position_info
(
   vocation_id          int not null auto_increment,
   department_id        int not null,
   vocation_name        varchar(64),
   wage_base            float,
   vocation_avai        int,
   vocation_remark      text,
   primary key (vocation_id)
);

/*==============================================================*/
/* Table: privilege_info                                        */
/*==============================================================*/
create table privilege_info
(
   privilege_id         int not null auto_increment,
   privilege_name       varchar(64),
   privilege_desc       text,
   primary key (privilege_id)
);

/*==============================================================*/
/* Table: register_info                                         */
/*==============================================================*/
create table register_info
(
   register_id          int not null auto_increment,
   student_id           int,
   course_id            int,
   student_course_score float,
   primary key (register_id)
);

/*==============================================================*/
/* Table: roll_state                                            */
/*==============================================================*/
create table roll_state
(
   rollstate_id         int not null auto_increment,
   rollstate_name       varchar(64),
   rollstate_intr       text,
   primary key (rollstate_id)
);

/*==============================================================*/
/* Table: salesman_info                                         */
/*==============================================================*/
create table salesman_info
(
   staff_id             int not null,
   salesman_salary      float,
   staffsman_remark     text,
   primary key (staff_id)
);

/*==============================================================*/
/* Table: schedule_info                                         */
/*==============================================================*/
create table schedule_info
(
   schedule_id          int not null auto_increment,
   staff_id             int,
   schedule_begin       timestamp,
   schedule_end         timestamp,
   schedule_content     text,
   schedule_avai        int,
   primary key (schedule_id)
);

/*==============================================================*/
/* Table: staff_attandant                                       */
/*==============================================================*/
create table staff_attandant
(
   attendant_id         int not null auto_increment,
   staff_id             int,
   attendant_time       timestamp,
   attendant_remark     text,
   primary key (attendant_id)
);

/*==============================================================*/
/* Table: staff_info                                            */
/*==============================================================*/
create table staff_info
(
   staff_id             int not null auto_increment,
   staff_pass           varchar(16),
   vocation_id          int not null,
   group_id             int not null,
   staff_name           varchar(64),
   staff_phone          varchar(12),
   staff_qq             varchar(15),
   staff_idcard         varchar(18),
   staff_empl_time      timestamp,
   staff_avai           int,
   staff_others         text,
   primary key (staff_id)
);

/*==============================================================*/
/* Index: staff_idcard_index                                    */
/*==============================================================*/
create unique index staff_idcard_index on staff_info
(
   staff_idcard
);

/*==============================================================*/
/* Index: staff_name_index                                      */
/*==============================================================*/
create index staff_name_index on staff_info
(
   staff_name
);

/*==============================================================*/
/* Table: student_attendant                                     */
/*==============================================================*/
create table student_attendant
(
   attendant_id         int not null auto_increment,
   register_id          int,
   attendant_time       timestamp,
   attendant_remark     text,
   primary key (attendant_id)
);

/*==============================================================*/
/* Table: student_consultway                                    */
/*==============================================================*/
create table student_consultway
(
   student_consultway_id int not null auto_increment,
   consultway_id        int,
   consult_id           int,
   primary key (student_consultway_id)
);

/*==============================================================*/
/* Table: student_info                                          */
/*==============================================================*/
create table student_info
(
   student_id           int not null auto_increment,
   student_pass         varchar(32),
   class_id             int,
   group_id             int,
   rollstate_id         int,
   consult_id           int,
   student_no           varchar(64),
   student_name         varchar(64),
   student_sex          int,
   student_age          int,
   student_addr         varchar(255),
   student_phone        varchar(12),
   student_balance      float,
   student_school       varchar(64),
   student_major        varchar(64),
   attend_time          timestamp,
   student_state        int,
   student_remark       text,
   primary key (student_id)
);

/*==============================================================*/
/* Index: student_no_index                                      */
/*==============================================================*/
create unique index student_no_index on student_info
(
   student_no
);

/*==============================================================*/
/* Index: student_name_index                                    */
/*==============================================================*/
create index student_name_index on student_info
(
   student_name
);

/*==============================================================*/
/* Table: teacher_info                                          */
/*==============================================================*/
create table teacher_info
(
   staff_id             int not null,
   level_id             int,
   teacher_no           varchar(64),
   teacher_major        varchar(64),
   teacher_graduate     varchar(64),
   teacher_salary       float,
   teacher_type         int,
   teacher_remark       text,
   primary key (staff_id)
);

/*==============================================================*/
/* Table: teacher_level                                         */
/*==============================================================*/
create table teacher_level
(
   level_id             int not null auto_increment,
   level_name           varchar(64),
   base_class_hour      int,
   class_cost           float,
   level_avai           int,
   level_remark         text,
   primary key (level_id)
);

/*==============================================================*/
/* Table: teaching_manage_info                                  */
/*==============================================================*/
create table teaching_manage_info
(
   teaching_manage_id   int not null auto_increment,
   course_id            int,
   teach_plan           varchar(255),
   lesson_plan          varchar(255),
   teacher_summary      varchar(255),
   set_time             timestamp,
   primary key (teaching_manage_id)
);

alter table check_info add constraint FK_class_checkin foreign key (class_id)
      references class_info (class_id) on delete restrict on update restrict;

alter table class_info add constraint FK_class_grade foreign key (grade_id)
      references grade_info (grade_id) on delete restrict on update restrict;

alter table consult_info add constraint FK_consult_salesman foreign key (staff_id)
      references salesman_info (staff_id) on delete restrict on update restrict;

alter table course_classhour add constraint FK_course_classroom foreign key (classroom_id)
      references classroom_info (classroom_id) on delete restrict on update restrict;

alter table course_classhour add constraint FK_course_etc foreign key (course_id)
      references course_info (course_id) on delete restrict on update restrict;

alter table course_classhour add constraint FK_course_time foreign key (classhour_id)
      references classhour_info (classhour_id) on delete restrict on update restrict;

alter table course_info add constraint FK_course_major foreign key (major_id)
      references major_info (major_id) on delete restrict on update restrict;

alter table course_info add constraint FK_teacher_course foreign key (staff_id)
      references teacher_info (staff_id) on delete restrict on update restrict;

alter table department_info add constraint FK_department_branch foreign key (branch_id)
      references branch_info (branch_id) on delete restrict on update restrict;

alter table grade_info add constraint FK_grade_branch foreign key (branch_id)
      references branch_info (branch_id) on delete restrict on update restrict;

alter table group_privilege add constraint FK_gp_privilege foreign key (privilege_id)
      references privilege_info (privilege_id) on delete restrict on update restrict;

alter table group_privilege add constraint FK_group_gp foreign key (group_id)
      references group_info (group_id) on delete restrict on update restrict;

alter table notice_info add constraint FK_public_announcement foreign key (staff_id)
      references staff_info (staff_id) on delete restrict on update restrict;

alter table position_info add constraint FK_staff_department foreign key (department_id)
      references department_info (department_id) on delete restrict on update restrict;

alter table register_info add constraint FK_course_register foreign key (course_id)
      references course_info (course_id) on delete restrict on update restrict;

alter table register_info add constraint FK_student_registercourse foreign key (student_id)
      references student_info (student_id) on delete restrict on update restrict;

alter table salesman_info add constraint FK_salesman_staff foreign key (staff_id)
      references staff_info (staff_id) on delete restrict on update restrict;

alter table schedule_info add constraint FK_staff_schedule foreign key (staff_id)
      references staff_info (staff_id) on delete restrict on update restrict;

alter table staff_attandant add constraint FK_staff_attendant foreign key (staff_id)
      references staff_info (staff_id) on delete restrict on update restrict;

alter table staff_info add constraint FK_staff_group foreign key (group_id)
      references group_info (group_id) on delete restrict on update restrict;

alter table staff_info add constraint FK_staff_position foreign key (vocation_id)
      references position_info (vocation_id) on delete restrict on update restrict;

alter table student_attendant add constraint FK_course_attendant foreign key (register_id)
      references register_info (register_id) on delete restrict on update restrict;

alter table student_consultway add constraint FK_consult_way foreign key (consultway_id)
      references consultway_info (consultway_id) on delete restrict on update restrict;

alter table student_consultway add constraint FK_consultway_info foreign key (consult_id)
      references consult_info (consult_id) on delete restrict on update restrict;

alter table student_info add constraint FK_student_class foreign key (class_id)
      references class_info (class_id) on delete restrict on update restrict;

alter table student_info add constraint FK_student_consult foreign key (consult_id)
      references consult_info (consult_id) on delete restrict on update restrict;

alter table student_info add constraint FK_student_group foreign key (group_id)
      references group_info (group_id) on delete restrict on update restrict;

alter table student_info add constraint FK_student_tollstate foreign key (rollstate_id)
      references roll_state (rollstate_id) on delete restrict on update restrict;

alter table teacher_info add constraint FK_teacher_level foreign key (level_id)
      references teacher_level (level_id) on delete restrict on update restrict;

alter table teacher_info add constraint FK_teacher_staff foreign key (staff_id)
      references staff_info (staff_id) on delete restrict on update restrict;

alter table teaching_manage_info add constraint FK_course_teachinfo foreign key (course_id)
      references course_info (course_id) on delete restrict on update restrict;

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