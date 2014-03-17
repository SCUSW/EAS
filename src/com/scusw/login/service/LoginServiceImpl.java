package com.scusw.login.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.scusw.login.dao.LoginDao;
import com.scusw.model.AdminInfo;
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

	public StudentInfo checkStuLogin(StudentInfo si) {
		// TODO Auto-generated method stub
		return loginDao.checkStuLogin(si);
	}

	public StaffInfo checkStaLogin(StaffInfo si) {
		// TODO Auto-generated method stub
		/*HashMap<String, Object> map = new HashMap<String, Object>();
		if ((si=loginDao.checkStaffLogin(si)) != null) {
			map.put("staffId", si.getStaffId());
			map.put("staffDepartment", checkStaffDepartment(si));
			return map;
		}*/
		return loginDao.checkStaffLogin(si);
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
	
	public int checkStaffDepartment(StaffInfo si) {
		return si.getPositionInfo().getDepartmentInfo().getDepartmentId();
	}

	public List<Integer> checkPrivilege(int groupId) {
		// TODO Auto-generated method stub
		return loginDao.checkPrivilege(groupId);
	}
	public boolean checkAdminInfo(AdminInfo adminInfo) {
		
		if(loginDao.checkAdminLogin(adminInfo) == null){
			return false;
		}
		return true;
	}
	

	

}
