/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2014/3/12 10:52:58                           */
/*==============================================================*/


drop table if exists admin_info;

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

drop table if exists financial_records;

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

drop table if exists staff_fees;

drop table if exists staff_info;

drop table if exists student_attendant;

drop table if exists student_consultway;

drop table if exists student_fees;

drop table if exists student_info;

drop table if exists teacher_info;

drop table if exists teacher_level;

drop table if exists teaching_manage_info;

/*==============================================================*/
/* Table: admin_info                                            */
/*==============================================================*/
create table admin_info
(
   admin_id             int not null auto_increment,
   admin_no             varchar(16) not null,
   admin_pass           varchar(32) not null,
   admin_name           varchar(64),
   admin_tel            varchar(16),
   admin_email          varchar(64),
   admin_idcard         varchar(18),
   admin_set_time       timestamp,
   admin_avai           int,
   primary key (admin_id)
);

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
   classroom_avai       int,
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
/* Table: financial_records                                     */
/*==============================================================*/
create table financial_records
(
   financial_id         int not null auto_increment,
   branch_id            int,
   financial_num        float,
   financial_time       timestamp,
   total_money          double,
   financial_from       text,
   financial_remark     text,
   primary key (financial_id)
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
/* Table: staff_fees                                            */
/*==============================================================*/
create table staff_fees
(
   sfees_id             int not null auto_increment,
   staff_id             int,
   sfees_num            float,
   sfees_time           timestamp,
   sfees_from           varchar(255),
   primary key (sfees_id)
);

/*==============================================================*/
/* Table: staff_info                                            */
/*==============================================================*/
create table staff_info
(
   staff_id             int not null auto_increment,
   staff_no             varchar(16) not null,
   staff_pass           varchar(32),
   staff_sex            int,
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
/* Table: student_fees                                          */
/*==============================================================*/
create table student_fees
(
   fees_id              int not null auto_increment,
   student_id           int,
   fees_num             float,
   fees_time            timestamp,
   fees_for             varchar(255),
   primary key (fees_id)
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
   exam_state           int,
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

alter table financial_records add constraint FK_branch_company_financial foreign key (branch_id)
      references branch_info (branch_id) on delete set null on update set null;

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

alter table staff_fees add constraint FK_staff_get_fees foreign key (staff_id)
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

alter table student_fees add constraint FK_student_pay_fees foreign key (student_id)
      references student_info (student_id) on delete restrict on update restrict;

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

