package com.scusw.login.service;

import com.scusw.login.dao.LoginDao;
import com.scusw.model.StudentInfo;

public class LoginServiceImpl implements LoginService {
	private LoginDao loginDao;
	
	public LoginDao getLoginDao() {
		return loginDao;
	}

	public void setLoginDao(LoginDao loginDao) {
		this.loginDao = loginDao;
	}

	public boolean checkStuLogin(StudentInfo si) {
		// TODO Auto-generated method stub
		if (loginDao.checkStuLogin(si) != null) {
			return true;
		}
		return false;
	}

	public boolean checkStaLogin() {
		// TODO Auto-generated method stub
		return false;
	}

	public boolean checkAdmLogin() {
		// TODO Auto-generated method stub
		return false;
	}

	

}
