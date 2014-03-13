package com.scusw.admin.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.scusw.admin.dao.AttandantDao;
import com.scusw.model.StaffAttandant;
import com.scusw.model.StudentAttendant;

public class AttandantDaoImpl extends HibernateDaoSupport implements
		AttandantDao {

	public List<StaffAttandant> queryStaffAttendant(int currentPage,
			int pageSize) {
		// TODO Auto-generated method stub
		Query query = this.getSession().createQuery(
						"from StaffAttandant sa " +
						"where sa.staffInfo.positionInfo.departmentInfo.departmentName like :department " +
						"and sa.staffInfo.staffName like :name " +
						/*"and sa.attendantTime like :date " +*/
						"order by sa.attendantTime desc");
		int startRow = (currentPage - 1) * pageSize;
		query.setFirstResult(startRow);
		query.setMaxResults(pageSize);
		query.setParameter("department", "%");
		query.setParameter("name", "%");
		//query.setParameter("date", "%2014%");
		List<StaffAttandant> list = query.list();
		return list;
	}

	public List<StudentAttendant> queryStuAttendant(int currentPage,
			int pageSize) {
		// TODO Auto-generated method stub
		Query query = this.getSession().createQuery(
				"from StudentAttendant sa order by sa.attendantTime desc");
		int startRow = (currentPage - 1) * pageSize;
		query.setFirstResult(startRow);
		query.setMaxResults(pageSize);
		List<StudentAttendant> list = query.list();
		return list;
	}

	public int getTotleStaffAttendant() {
		// TODO Auto-generated method stub
		List<StaffAttandant> list = this.getHibernateTemplate().find(
				"from StaffAttandant");

		return list.size();
	}

	public int getTotleStuAttendant() {
		// TODO Auto-generated method stub
		List<StudentAttendant> list = this.getHibernateTemplate().find(
				"from StudentAttendant");

		return list.size();
	}

}
