package com.scusw.admin.service.impl;

import com.scusw.admin.dao.LoginDao;
import com.scusw.admin.service.LoginService;
import com.scusw.model.AdminInfo;

public class LoginServiceImpl implements LoginService {
	
	private LoginDao loginDao;
	
	public LoginDao getLoginDao() {
		return loginDao;
	}

	public void setLoginDao(LoginDao loginDao) {
		this.loginDao = loginDao;
	}

	/**
	 * implement the interface check admin info
	 * return true if admin login info is correct or false default
	 */
	public boolean checkAdminInfo(AdminInfo adminInfo) {
		
		if(loginDao.checkAdminLogin(adminInfo) == null){
			return false;
		}
		return true;
	}

}
