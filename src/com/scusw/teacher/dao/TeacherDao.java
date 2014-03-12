package com.scusw.teacher.dao;

import java.util.List;

import com.scusw.model.StaffInfo;
import com.scusw.model.StudentInfo;
import com.scusw.model.TeacherInfo;

public interface TeacherDao {
	public TeacherInfo queryByTeacehrId(int staffIdS);
	
	public void updateTeacher(StaffInfo staff);

	public List<StudentInfo> searchStudentByNo(String studentNo);

	public List<StudentInfo> searchStudentByName(String studentName);

	public List<StudentInfo> searchStudentAll();

	public StudentInfo queryByStudentNo(String studentNo);
}
