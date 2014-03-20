package com.scusw.educational.service;

import java.util.List;

import com.scusw.educational.dao.EducationalDao;
import com.scusw.model.CourseClasshour;
import com.scusw.model.CourseInfo;
import com.scusw.model.GroupInfo;
import com.scusw.model.PositionInfo;
import com.scusw.model.StudentAttendant;
import com.scusw.model.StudentInfo;
import com.scusw.model.TeacherInfo;
import com.scusw.model.TeacherLevel;


public class EducationalServiceImpl implements EducationalService{
    private EducationalDao educationalDao;

	
	public EducationalDao getEducationalDao() {
		return educationalDao;
	}


	public void setEducationalDao(EducationalDao educationalDao) {
		this.educationalDao = educationalDao;
	}


	public List<StudentInfo> queryStu(StudentInfo stu){
		return educationalDao.queryStu(stu);
	}


	public List<StudentAttendant> checkAttdant(StudentInfo stu) {
		 return educationalDao.checkAttendant(stu);
	}


	public boolean updateAttendant(StudentAttendant att) {
		if(educationalDao.updateAttendant(att))
			return true;
		return false;
	}


	public List<TeacherInfo> queryTeacher(TeacherInfo teacher) {
		return educationalDao.queryTeacher(teacher);
 
	}


	public String addTeacher(TeacherInfo tea) {
		
		return educationalDao.addTeacher(tea);
	}


	public TeacherInfo showAllTeacherInfo(TeacherInfo tea) {
		
		return educationalDao.showAllTeacherInfo( tea);
	}


	public List<CourseClasshour> queryCourse(TeacherInfo tea) {
		
		return educationalDao.queryCourse(tea);
	}


	public TeacherInfo addSalary(TeacherInfo teacher) {
		return educationalDao.addSalary(teacher);
	}


	public String addCourse(CourseInfo course) {
		return educationalDao.addcourse(course);
	}


	public List<CourseInfo> queryCourseInfo(CourseInfo course) {
		// TODO Auto-generated method stub
		return educationalDao.queryCourseInfo(course);
	}


	public List<GroupInfo> listGroupInfo() {
		// TODO Auto-generated method stub
		return educationalDao.listGroupInfo();
	}


	public List<TeacherLevel> listTeacherLevel() {
		// TODO Auto-generated method stub
		return educationalDao.listTeacherLevel();
	}


	public List<PositionInfo> listPosition() {
		// TODO Auto-generated method stub
		return educationalDao.listPosition();
	}


	public List<TeacherInfo> queryTeacherByNo(String teacherNo) {
		// TODO Auto-generated method stub
		return educationalDao.queryTeacherByNo(teacherNo);
	}


	public String updateCourse(CourseInfo course) {
		// TODO Auto-generated method stub
		return educationalDao.updateCourse(course);
	}


	public void deleteCourse(CourseInfo course) {
		// TODO Auto-generated method stub
		educationalDao.deleteCourse(course);
		
	}


	public String addCourseIntoTable() {
		// TODO Auto-generated method stub
	return	educationalDao.addCourseIntoTable();
		
	}


	public List<CourseClasshour> querryCourseClasshour(Integer index) {
	return	educationalDao.querryCourseClasshour(index);
		
	}

}
