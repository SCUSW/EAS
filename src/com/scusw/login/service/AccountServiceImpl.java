package com.scusw.login.service;

import com.scusw.login.dao.AccountDao;

public class AccountServiceImpl implements AccountService {
	private AccountDao accountDao;
	

	public AccountDao getAccountDao() {
		return accountDao;
	}

	public void setAccountDao(AccountDao accountDao) {
		this.accountDao = accountDao;
	}

	public void updateStudentPassword(int studentId, String newPassword) {
		// TODO Auto-generated method stub

	}

	public void updateStaffPassword(int staffId, String newPassword) {
		// TODO Auto-generated method stub

	}

	public void updatePassword(int id, String newPassword, String role) {
		// TODO Auto-generated method stub
		if ("student".equals(role)) {
			this.updateStudentPassword(studentId, newPassword);
		}
	}

}
