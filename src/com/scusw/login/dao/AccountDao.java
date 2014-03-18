package com.scusw.login.dao;

import org.springframework.orm.hibernate3.HibernateTemplate;

import com.scusw.model.AdminInfo;
import com.scusw.model.StaffInfo;
import com.scusw.model.StudentInfo;

public class AccountDao extends HibernateTemplate {
	public void updatePassForStudent(StudentInfo si) {
		this.getSession().update(si);
	}
	public void updatePassForStaff(StaffInfo si) {
		this.getSession().update(si);
	}
	public void updatePassForAdmin(AdminInfo ai) {
		this.getSession().update(ai);
	}
}
