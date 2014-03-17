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
			int pageSize, String staffName,String staffNo) {
		// TODO Auto-generated method stub
		Query query = this.getSession().createQuery(
				"from StaffAttandant sa "
						+ "where sa.staffInfo.staffName like :staffName  and sa.staffInfo.staffNo like :staffNo "
						+ "order by sa.attendantTime desc");
		query.setParameter("staffName", "%" + staffName + "%");
		query.setParameter("staffNo", "%" + staffNo + "%");
		int startRow = (currentPage - 1) * pageSize;
		query.setFirstResult(startRow);
		query.setMaxResults(pageSize);
		List<StaffAttandant> list = query.list();
		return list;
	}

	public List<StaffAttandant> queryStaffAttendantByDepartment(
			int currentPage, int pageSize, int departmentId, String staffName,String staffNo) {
		// TODO Auto-generated method stub
		Query query = this
				.getSession()
				.createQuery(
						"from StaffAttandant sa "
								+ "where sa.staffInfo.positionInfo.departmentInfo.departmentId=:departmentId "
								+ "and sa.staffInfo.staffName like :staffName  and sa.staffInfo.staffNo like :staffNo "
								+ "order by sa.attendantTime desc");
		query.setParameter("departmentId", departmentId);
		query.setParameter("staffName", "%" + staffName + "%");

		query.setParameter("staffNo", "%" + staffNo + "%");
		int startRow = (currentPage - 1) * pageSize;
		query.setFirstResult(startRow);
		query.setMaxResults(pageSize);
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

	public int getTotleStaffAttendant(String staffName,String staffNo) {
		// TODO Auto-generated method stub
		List<StaffAttandant> list = (List<StaffAttandant>) this
				.getSession()
				.createQuery(
						"from StaffAttandant sa where sa.staffInfo.staffName like :staffName and sa.staffInfo.staffNo like :staffNo")
				.setParameter("staffName", "%" + staffName + "%").setParameter("staffNo", "%" + staffNo + "%")
				.setParameter("staffNo", "%" + staffNo + "%").list();

		return list.size();
	}

	public int getTotleStuAttendant() {
		// TODO Auto-generated method stub
		List<StudentAttendant> list = this.getHibernateTemplate().find(
				"from StudentAttendant");

		return list.size();
	}

	public int getTotleStaffAttendant(String staffName, int departmentId ,String staffNo) {
		// TODO Auto-generated method stub
		List<StaffAttandant> list = (List<StaffAttandant>) this
				.getSession()
				.createQuery(
						"from StaffAttandant sa where sa.staffInfo.staffName like :staffName and sa.staffInfo.staffNo like :staffNo and sa.staffInfo.positionInfo.departmentInfo.departmentId=:departmentId")
				.setParameter("staffName", "%" + staffName + "%")
				.setParameter("staffNo", "%" + staffNo + "%")
				.setParameter("departmentId", departmentId).list();

		return list.size();
	}

}
