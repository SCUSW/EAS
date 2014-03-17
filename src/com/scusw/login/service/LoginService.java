package com.scusw.login.service;

import java.util.List;
import java.util.Map;

import com.scusw.model.AdminInfo;
import com.scusw.model.StaffInfo;
import com.scusw.model.StudentInfo;

public interface LoginService {
	public StudentInfo checkStuLogin(StudentInfo si);
	public StaffInfo checkStaLogin(StaffInfo si);
	public boolean checkAdmLogin();
	public int checkIfTeacher(int staffId);
	public List<Integer> checkPrivilege(int groupId);
	public boolean checkAdminInfo(AdminInfo adminInfo);
}
