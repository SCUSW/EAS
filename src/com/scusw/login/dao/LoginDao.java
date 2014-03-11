package com.scusw.login.dao;

import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.scusw.login.action.LoginAction;
import com.scusw.model.StaffInfo;
import com.scusw.model.StudentInfo;

public class LoginDao extends HibernateDaoSupport {
	public StudentInfo checkStuLogin(StudentInfo si) {
		Query q = this.getSession().createQuery("from StudentInfo s " +
				"where s.studentNo=:username and " +
				"s.studentPass=:userpass");
		q.setParameter("username", si.getStudentNo());
		q.setParameter("userpass", si.getStudentPass());
		StudentInfo siTemp = (StudentInfo) q.uniqueResult();
		return siTemp;
	}
	public StaffInfo checkStaffLogin(StaffInfo si) {
		Query q = this.getSession().createQuery("from StaffInfo s " +
				"where s.staffId=:username and " +
				"s.staffPass=:userpass");
		q.setParameter("username", si.getStaffId());
		q.setParameter("userpass", si.getStaffPass());
		StaffInfo siTemp = (StaffInfo) q.uniqueResult();
		return siTemp;
	}
}
