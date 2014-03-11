package com.scusw.login.service;

import com.scusw.model.StaffInfo;
import com.scusw.model.StudentInfo;

public interface LoginService {
	public boolean checkStuLogin(StudentInfo si);
	public boolean checkStaLogin(StaffInfo si);
	public boolean checkAdmLogin();
	public int checkIfTeacher(int staffId);
}
