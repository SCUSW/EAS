package com.scusw.admin.dao;

import java.util.List;

import com.scusw.model.StaffAttandant;
import com.scusw.model.StudentAttendant;

public interface AttandantDao {
	public List<StaffAttandant> queryStaffAttendant(int currentPage,int pageSize,String staffName,String staffNo);
	public List<StudentAttendant> queryStuAttendant(int currentPage,int pageSize);
	public int getTotleStaffAttendant(String staffName,String staffNo);
	public int getTotleStaffAttendant(String staffName, int departmentId,String staffNo);
	public int getTotleStuAttendant();
	public List<StaffAttandant> queryStaffAttendantByDepartment(int currentPage,int pageSize, int departmentId,String staffName,String staffNo);
}
