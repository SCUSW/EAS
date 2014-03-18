package com.scusw.login.service;

import com.scusw.login.dao.AccountDao;
import com.scusw.model.AdminInfo;
import com.scusw.model.StaffInfo;
import com.scusw.model.StudentInfo;
import com.scusw.util.MD5Util;

public class AccountServiceImpl implements AccountService {
	
	private LoginService loginService;
	private AccountDao accountDao;
	

	

	public LoginService getLoginService() {
		return loginService;
	}

	public void setLoginService(LoginService loginService) {
		this.loginService = loginService;
	}

	public AccountDao getAccountDao() {
		return accountDao;
	}

	public void setAccountDao(AccountDao accountDao) {
		this.accountDao = accountDao;
	}

	

	public boolean updatePassword(String loginNo, String newPassword,String oldPassword, String role) {
		// TODO Auto-generated method stub
		if (loginNo==null||newPassword==null||oldPassword==null||role==null||loginNo.equals("")||newPassword.equals("")||oldPassword.equals("")||role.equals("")) {
			return false;
		}
		newPassword = MD5Util.MD5(newPassword);
		oldPassword = MD5Util.MD5(oldPassword);
		if ("student".equals(role)) {
			StudentInfo si = new StudentInfo();
			si.setStudentNo(loginNo);
			si.setStudentPass(oldPassword);
			if((si = loginService.checkStuLogin(si)) == null) {
				return false;
			}
			si.setStudentPass(newPassword);
			accountDao.updatePassForStudent(si);
		} else if ("staff".equals(role)||"teacher".equals(role)) {
			StaffInfo si = new StaffInfo();
			si.setStaffNo(loginNo);
			si.setStaffPass(oldPassword);
			if((si = loginService.checkStaLogin(si)) == null)
				return false;
			si.setStaffPass(newPassword);
			accountDao.updatePassForStaff(si);
		} else if ("admin".equals(role)) {
			AdminInfo ai = new AdminInfo();
			ai.setAdminNo(loginNo);
			ai.setAdminPass(oldPassword);
			if((ai = loginService.checkAdminInfo2(ai)) == null)
				return false;
			ai.setAdminPass(newPassword);
			accountDao.updatePassForAdmin(ai);
		}
		return true;
	}

	

}
