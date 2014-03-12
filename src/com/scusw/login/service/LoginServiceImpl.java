package com.scusw.login.service;

import com.scusw.login.dao.LoginDao;
import com.scusw.model.StaffInfo;
import com.scusw.model.StudentInfo;
import com.scusw.model.TeacherInfo;

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

	public int checkStaLogin(StaffInfo si) {
		// TODO Auto-generated method stub
		if (loginDao.checkStaffLogin(si) != null) {
			return si.getStaffId();
		}
		return -1;
	}

	public boolean checkAdmLogin() {
		// TODO Auto-generated method stub
		return false;
	}

	public int checkIfTeacher(int staffId) {
		// TODO Auto-generated method stub
		TeacherInfo teacherInfo = loginDao.checkIfTeacher(staffId);
		if (teacherInfo != null) {
			return teacherInfo.getTeacherType();
		}
		return -1;
	}

	

	

}
