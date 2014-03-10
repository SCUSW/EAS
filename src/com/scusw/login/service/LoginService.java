package com.scusw.login.service;

import com.scusw.model.StudentInfo;

public interface LoginService {
	public boolean checkStuLogin(StudentInfo si);
	public boolean checkStaLogin();
	public boolean checkAdmLogin();
}
