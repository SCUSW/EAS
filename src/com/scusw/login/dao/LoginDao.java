package com.scusw.login.dao;

import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.scusw.login.action.LoginAction;
import com.scusw.model.AdminInfo;
import com.scusw.model.StaffInfo;
import com.scusw.model.StudentInfo;
import com.scusw.model.TeacherInfo;

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
				"where s.staffNo=:username and " +
				"s.staffPass=:userpass");
		q.setParameter("username", si.getStaffNo());
		q.setParameter("userpass", si.getStaffPass());
		StaffInfo siTemp = (StaffInfo) q.uniqueResult();
		return siTemp;
	}
	public TeacherInfo checkIfTeacher(int staffId) {
		Query q = this.getSession().createQuery("from TeacherInfo t " +
				"where t.staffId=:staffId");
		q.setParameter("staffId", staffId);
		TeacherInfo tiTemp = (TeacherInfo) q.uniqueResult();
		return tiTemp;
	}
	public List<Integer> checkPrivilege(int groupId) {
		Query q = this.getSession().createQuery("select gp.groupPrivilegeId from GroupPrivilege gp " +
				"where gp.groupInfo.groupId=:groupId");
		q.setParameter("groupId", groupId);
		List<Integer> list = q.list();
		//System.out.println("权限："+list.get(0));
		return list;
	}
	public AdminInfo checkAdminLogin(AdminInfo adminInfo) {
		Query query = this.getSession().createQuery("from AdminInfo a " + "where a.adminNo=:id " + "and a.adminPass=:pass");
		query.setParameter("id", adminInfo.getAdminNo());
		query.setParameter("pass", adminInfo.getAdminPass());
		AdminInfo admin = (AdminInfo)query.uniqueResult();
		return admin;
	}
}
