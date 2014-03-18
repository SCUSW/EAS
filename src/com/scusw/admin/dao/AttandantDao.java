package com.scusw.admin.dao;

import java.util.List;

import com.scusw.model.CourseInfo;
import com.scusw.model.StaffAttandant;
import com.scusw.model.StudentAttendant;

public interface AttandantDao {
	public List<StaffAttandant> queryStaffAttendant(int currentPage,int pageSize,String staffName,String staffNo);
	public List<StaffAttandant> queryStaffAttendantByDepartment(int currentPage,int pageSize, int departmentId,String staffName,String staffNo);
	public int getTotleStaffAttendant(String staffName,String staffNo);
	public int getTotleStaffAttendant(String staffName, int departmentId,String staffNo);
	
	public int getTotleStuAttendant(String studentName,String studentNo);
	//public int getTotleStuAttendantByClass(String studentName,String studentNo,int classId);
	public int getTotleStuAttendantByGrade(String studentName,String studentNo,int gradeId);
	public int getTotleStuAttendantByCourse(String studentName,String studentNo,int courseId);
	public int getTotleStuAttendant(String studentName,String studentNo,int gradeId,int courseId);
	public List<StudentAttendant> queryStuAttendant(int currentPage,int pageSize,String studentName,String studentNo);
	public List<StudentAttendant> queryStuAttendantByGrade(int currentPage,int pageSize,String studentName,String studentNo,int gradeId);
	public List<StudentAttendant> queryStuAttendantByCourse(int currentPage,int pageSize,String studentName,String studentNo,int courseId);
	public List<StudentAttendant> queryStuAttendant(int currentPage,int pageSize,String studentName,String studentNo,int gradeId,int courseId);
	public List<CourseInfo> queryCourseInfo();
	
}
