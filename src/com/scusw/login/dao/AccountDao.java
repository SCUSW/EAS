package com.scusw.login.dao;

import org.springframework.orm.hibernate3.HibernateTemplate;

import com.scusw.model.StudentInfo;

public class AccountDao extends HibernateTemplate {
	public StudentInfo checkStudent(int studentId) {
		return (StudentInfo) this.find("from StudentInfo si where si.studentId=", studentId);
	}
	public void updatePassForStudent(StudentInfo si) {
		this.getSession().update(si);
	}
}
