package com.scusw.admin.service.impl;

import java.util.List;

import com.scusw.admin.dao.AttandantDao;
import com.scusw.admin.service.AttandantService;
import com.scusw.model.StaffAttandant;

public class AttandantServiceImpl implements AttandantService {

	AttandantDao attandantDao;
	
	public AttandantDao getAttandantDao() {
		return attandantDao;
	}

	public void setAttandantDao(AttandantDao attandantDao) {
		this.attandantDao = attandantDao;
	}

	public List<StaffAttandant> queryStaffAttdant() {
		// TODO Auto-generated method stub
		
		return attandantDao.queryStaffAttdant();
	}

}
