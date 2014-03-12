package com.scusw.teacher.service.impl;

import java.util.List;

import com.scusw.model.CourseInfo;
import com.scusw.model.StaffInfo;
import com.scusw.model.StudentInfo;
import com.scusw.model.TeacherInfo;
import com.scusw.teacher.dao.TeacherDao;
import com.scusw.teacher.service.TeacherService;
import com.scusw.util.MD5Util;


public class TeacherServiceImpl implements TeacherService{

	private TeacherDao teacherDao;
	

	
	public TeacherDao getTeacherDao() {
		return teacherDao;
	}

	public void setTeacherDao(TeacherDao teacherDao) {
		this.teacherDao = teacherDao;
	}

	/**
	 * 获取老师个人信息
	 */
	public TeacherInfo getOwnTeacherInfo(int staffId){
		return teacherDao.queryByTeacehrId(staffId);
	}

	/**
	 * 更新老师个人信息
	 */
	public void updateTeacher(StaffInfo staff) {
		StaffInfo ss=this.getOwnTeacherInfo(staff.getStaffId()).getStaffInfo();
		ss.setStaffPhone(staff.getStaffPhone());
		ss.setStaffQq(staff.getStaffQq());
		ss.setStaffPass(MD5Util.MD5(staff.getStaffPass()));
		teacherDao.updateTeacher(ss);
	}

	/**
	 * 按学号查找学生
	 */
	public List<StudentInfo> searchStudentByNo(String studentNo){
		return teacherDao.searchStudentByNo(studentNo);
	}
	
	public List<StudentInfo> searchStudentByName(String studentName){
		return teacherDao.searchStudentByName(studentName);
	}
	
	public List<StudentInfo> searchStudentAll(){
		return teacherDao.searchStudentAll();
	}
	
	public StudentInfo getStudentInfo(String studentNo){
		return teacherDao.queryByStudentNo(studentNo);
	}
	
	public List searchStudentOwn(int staffId){
		return teacherDao.queryStudentByTeacherId(staffId);
	}
	
	public List getTeacherOwnCourse(int staffId){
		return teacherDao.queryTeacherOenCourse(staffId);
	}
	
	public List searchStudentByCourseId(int courseId){
		return teacherDao.queryStudentByCourseId(courseId);
	}
	
	public CourseInfo getCourseById(int courseId){
		return teacherDao.queryCourseById(courseId);
	}
}
