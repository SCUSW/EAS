package com.scusw.educational.service;

import java.util.List;

import com.scusw.model.CourseClasshour;
import com.scusw.model.CourseInfo;
import com.scusw.model.GroupInfo;
import com.scusw.model.PositionInfo;
import com.scusw.model.StudentAttendant;
import com.scusw.model.StudentInfo;
import com.scusw.model.TeacherInfo;
import com.scusw.model.TeacherLevel;

public interface EducationalService {
	public List<StudentInfo> queryStu(StudentInfo stu);
	public List<StudentAttendant>  checkAttdant(StudentInfo stu);
	public boolean updateAttendant(StudentAttendant att);
	public List<TeacherInfo> queryTeacher(TeacherInfo teacher);
	public String addTeacher(TeacherInfo tea);
	public TeacherInfo showAllTeacherInfo(TeacherInfo tea);
	public List<CourseClasshour>  queryCourse(TeacherInfo tea);
	public TeacherInfo addSalary(TeacherInfo teacher);
	public String addCourse(CourseInfo course);
	public List<CourseInfo> queryCourseInfo(CourseInfo course);
	public List<GroupInfo> listGroupInfo();
	public List<TeacherLevel> listTeacherLevel();
	public List<PositionInfo> listPosition();
	public String updateCourse(CourseInfo course);	
	public void deleteCourse(CourseInfo course);
	public String addCourseIntoTable();
	public 	List<CourseClasshour> querryCourseClasshour(Integer index);
}
