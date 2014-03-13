package com.scusw.admin.service.impl;

import java.util.List;

import com.scusw.admin.dao.AttandantDao;
import com.scusw.admin.service.AttandantService;
import com.scusw.model.StaffAttandant;
import com.scusw.model.StudentAttendant;

public class AttandantServiceImpl implements AttandantService {

	AttandantDao attandantDao;
	
	public AttandantDao getAttandantDao() {
		return attandantDao;
	}

	public void setAttandantDao(AttandantDao attandantDao) {
		this.attandantDao = attandantDao;
	}

	public List<StaffAttandant> queryStaffAttendant(int currentPage,int pageSize) {
		// TODO Auto-generated method stub
		
		return attandantDao.queryStaffAttendant(currentPage,pageSize);
	}

	public List<StudentAttendant> queryStuAttendant(int currentPage,int pageSize) {
		// TODO Auto-generated method stub
		return attandantDao.queryStuAttendant(currentPage,pageSize);
	}

	public int getTotalStaffAttendant() {
		// TODO Auto-generated method stub
		return attandantDao.getTotleStaffAttendant();
	}

	public int getTotalStuAttendant() {
		// TODO Auto-generated method stub
		return attandantDao.getTotleStuAttendant();
	}

}
