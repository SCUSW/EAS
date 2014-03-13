package com.scusw.admin.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.scusw.admin.dao.AttandantDao;
import com.scusw.model.StaffAttandant;
import com.scusw.model.StudentAttendant;

public class AttandantDaoImpl extends HibernateDaoSupport implements AttandantDao {

	public List<StaffAttandant> queryStaffAttendant() {
		// TODO Auto-generated method stub
		Query query = this.getSession().createQuery("from StaffAttandant sa order by sa.attendantTime desc");
		List<StaffAttandant> list = query.list();
		return list;
	}

	public List<StudentAttendant> queryStuAttendant() {
		// TODO Auto-generated method stub
		Query query = this.getSession().createQuery("from StudentAttendant sa order by sa.attendantTime desc");
		List<StudentAttendant> list = query.list();		
		System.out.println(list.get(0).getAttendantTime());
		return list;
	}

}

