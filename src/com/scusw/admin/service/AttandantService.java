package com.scusw.admin.service;

import java.util.List;

import com.scusw.model.CourseInfo;
import com.scusw.model.DepartmentInfo;
import com.scusw.model.GradeInfo;
import com.scusw.model.StaffAttandant;
import com.scusw.model.StudentAttendant;

public interface AttandantService {
	public List<StaffAttandant> queryStaffAttendant(int currentPage,int pageSize,String staffName,String staffNo);
	public List<StaffAttandant> queryStaffAttendantByDepartment(int currentPage,int pageSize,int departmentId,String staffName,String staffNo);
	public int getTotalStaffAttendant(int departmentId, String staffName,String staffNo);
	public List<DepartmentInfo> queryDepartmentInfo();
	
	public List<StudentAttendant> queryStuAttendant(int currentPage,int pageSize,String studentName,String studentNo);
	public List<StudentAttendant> queryStuAttendantByGrade(int currentPage,int pageSize,String studentName,String studentNo,int gradeId);
	public List<StudentAttendant> queryStuAttendantByCourse(int currentPage,int pageSize,String studentName,String studentNo,int courseId);
	public List<StudentAttendant> queryStuAttendant(int currentPage,int pageSize,String studentName,String studentNo,int gradeId,int courseId);
	public int getTotalStuAttendant(String studentName,String studentNo);
	public int getTotalStuAttendantByGrade(String studentName,String studentNo,int gradeId);
	public int getTotalStuAttendantByCourse(String studentName,String studentNo,int courseId);
	public int getTotalStuAttendant(String studentName,String studentNo,int gradeId,int courseId);
	public List<GradeInfo> queryGradeInfo();
	public List<CourseInfo> queryCourseInfo();
}
