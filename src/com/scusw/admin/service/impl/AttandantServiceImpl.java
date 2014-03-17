package com.scusw.admin.service.impl;

import java.util.List;

import com.scusw.admin.dao.AttandantDao;
import com.scusw.admin.service.AttandantService;
import com.scusw.admin.service.DepartmentService;
import com.scusw.model.DepartmentInfo;
import com.scusw.model.StaffAttandant;
import com.scusw.model.StudentAttendant;

public class AttandantServiceImpl implements AttandantService {

	AttandantDao attandantDao;
	DepartmentService departmentService;
	
	
	public DepartmentService getDepartmentService() {
		return departmentService;
	}

	public void setDepartmentService(DepartmentService departmentService) {
		this.departmentService = departmentService;
	}

	public AttandantDao getAttandantDao() {
		return attandantDao;
	}

	public void setAttandantDao(AttandantDao attandantDao) {
		this.attandantDao = attandantDao;
	}

	public List<StaffAttandant> queryStaffAttendant(int currentPage,int pageSize,String staffName,String staffNo) {
		// TODO Auto-generated method stub
		
		return attandantDao.queryStaffAttendant(currentPage,pageSize, staffName,staffNo);
	}

	public List<StudentAttendant> queryStuAttendant(int currentPage,int pageSize) {
		// TODO Auto-generated method stub
		return attandantDao.queryStuAttendant(currentPage,pageSize);
	}

	public int getTotalStaffAttendant(int departmentId, String staffName,String staffNo) {
		// TODO Auto-generated method stub
		if(staffName==null)
			staffName="";
		if (departmentId == 0) {
			return attandantDao.getTotleStaffAttendant(staffName,staffNo);
		} else
			return attandantDao.getTotleStaffAttendant(staffName, departmentId,staffNo);
		
	}

	public int getTotalStuAttendant() {
		// TODO Auto-generated method stub
		return attandantDao.getTotleStuAttendant();
	}

	public List<StaffAttandant> queryStaffAttendantByDepartment(
			int currentPage, int pageSize, int departmentId,String staffName,String staffNo) {
		// TODO Auto-generated method stub
		if (staffName == null)
			staffName="";
		if (staffNo == null)
			staffNo="";
		if(departmentId!=0)
			return attandantDao.queryStaffAttendantByDepartment(currentPage, pageSize, departmentId, staffName,staffNo);
		else
			return this.queryStaffAttendant(currentPage, pageSize,staffName,staffNo);
	}

	public List<DepartmentInfo> queryDepartmentInfo() {
		// TODO Auto-generated method stub
		return departmentService.queryAllDepartment(1, 100);
	}

}
