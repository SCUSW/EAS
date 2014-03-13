package com.scusw.teacher.service;

import java.util.List;

import com.scusw.model.CourseInfo;
import com.scusw.model.GroupInfo;
import com.scusw.model.PositionInfo;
import com.scusw.model.RegisterInfo;
import com.scusw.model.StaffInfo;
import com.scusw.model.StudentAttendant;
import com.scusw.model.StudentInfo;
import com.scusw.model.TeacherInfo;
import com.scusw.model.TeacherLevel;

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

	public RegisterInfo getRegisterByStudentIdCourseId(int studentId, int courseId);

	public void updateStudentCourseScore(int registerId, float studentCourseScore);

	public List getStudentAttendant(int registerId);

	public boolean addStudentAttendant(StudentAttendant studentAttendantInfo);

	public RegisterInfo getRegisterByStudentAttendantId(int studentAttendantId);

	public RegisterInfo getRegisterById(int registerId);

	public List getOwnCommonTeacher(int staffId);

	public List getOwnCommonTeacherByStaffNo(int staffId, String staffNo);

	public List getOwnCommonTeacherByStaffName(int staffId, String staffName);

	public List searchteacherLevel();

	public PositionInfo getPositionById(int vocationId);

	public GroupInfo getGroupInfoById(int groupId);

	public boolean addCommonTeacher(TeacherInfo teacher, int levelId, StaffInfo staff);
	
	public TeacherLevel getTeacherLevelById(int levelId); 

}
