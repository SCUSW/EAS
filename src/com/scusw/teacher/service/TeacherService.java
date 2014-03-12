package com.scusw.teacher.service;

import java.util.List;

import com.scusw.model.CourseInfo;
import com.scusw.model.RegisterInfo;
import com.scusw.model.StaffInfo;
import com.scusw.model.StudentInfo;
import com.scusw.model.TeacherInfo;

public interface TeacherService {

	public TeacherInfo getOwnTeacherInfo(int staffId);
	
	public void updateTeacher(StaffInfo staff);

	public List<StudentInfo> searchStudentByNo(String studentNo);

	public List<StudentInfo> searchStudentByName(String studentName);

	public List<StudentInfo> searchStudentAll();

	public StudentInfo getStudentInfo(String studentNo);

	public List searchStudentOwn(int staffId);

	public List getTeacherOwnCourse(int staffId);

	public List searchStudentByCourseId(int courseId);

	public CourseInfo getCourseById(int courseId);

	public RegisterInfo getRegisterById(int studentId, int courseId);


		
}
