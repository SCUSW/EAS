package com.scusw.admin.service;

import java.util.List;

import com.scusw.model.DepartmentInfo;
import com.scusw.model.StaffAttandant;
import com.scusw.model.StudentAttendant;

public interface AttandantService {
	public List<StaffAttandant> queryStaffAttendant(int currentPage,int pageSize,String staffName,String staffNo);
	public List<StaffAttandant> queryStaffAttendantByDepartment(int currentPage,int pageSize,int departmentId,String staffName,String staffNo);
	public List<StudentAttendant> queryStuAttendant(int currentPage,int pageSize);
	public int getTotalStaffAttendant(int departmentId, String staffName,String staffNo);
	public int getTotalStuAttendant();
	public List<DepartmentInfo> queryDepartmentInfo();
}
