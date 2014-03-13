package com.scusw.teacher.dao;

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

public interface TeacherDao {
	public TeacherInfo queryByTeacehrId(int staffIdS);
	
	public void updateTeacher(StaffInfo staff);

	public List<StudentInfo> searchStudentByNo(String studentNo);

	public List<StudentInfo> searchStudentByName(String studentName);

	public List<StudentInfo> searchStudentAll();

	public StudentInfo queryByStudentNo(String studentNo);

	public List queryStudentByTeacherId(int staffId);

	public List queryTeacherOenCourse(int staffId);

	public List queryStudentByCourseId(int courseId);

	public CourseInfo queryCourseById(int courseId);

	public RegisterInfo queryRegisterByStudentIdCourseId(int studentId,int courseId);

	public RegisterInfo queryRegisterByRegisterId(int registerId);

	public void updateStudentCourseScore(RegisterInfo rr);

	public List queryStudentAttendantByRegisterId(int registerId);

	public StudentAttendant queryStudentAttendantByStudentAttendantId(int studentAttendantId);

	public RegisterInfo queryRegisterByStudentAttendantId(int studentAttendantId);

	public void addStudentAttendant(StudentAttendant studentAttendantInfo);

	public List queryOwnCommonTeacher(int branchId);

	public List queryOwnCommonTeacherByStaffNo(int branchId, String staffNo);

	public List queryOwnCommonTeacherByStaffName(int branchId, String staffName);

	public List queryAllTeacherLevel();

	public PositionInfo queryPositionById(int vocationId);

	public GroupInfo queryGroupById(int groupId);

	public void addCommonTeacehr(TeacherInfo teacher);

	public TeacherLevel queryTeacherLevelById(int levelId);

	public void addStaff(StaffInfo staff);

	public StaffInfo queryStaffByNo(String staffNo);
}
