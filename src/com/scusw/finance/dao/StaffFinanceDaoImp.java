/**
 * 
 */
package com.scusw.finance.dao;

import java.util.List;

import org.hibernate.Query;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.scusw.model.ConsultInfo;
import com.scusw.model.SalesmanInfo;
import com.scusw.model.StaffFees;
import com.scusw.model.StaffInfo;
import com.scusw.model.StudentInfo;
import com.scusw.model.TeacherInfo;

/**
 * @author Administrator
 * 
 */
public class StaffFinanceDaoImp extends HibernateDaoSupport implements
		StaffFinanceDao {

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.scusw.finance.dao.StaffFinanceDao#queryAllStaff()
	 */
	public List<StaffInfo> queryAllStaff() {
		// TODO Auto-generated method stub
		List<StaffInfo> staffs = getHibernateTemplate().find("from StaffInfo");

		return staffs;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.scusw.finance.dao.StaffFinanceDao#queryStaff(java.lang.String)
	 */
	public List<StaffInfo> queryStaff(String staffName) {
		List<StaffInfo> staffs = getHibernateTemplate()
				.find(
						"from StaffInfo s where s.staffName like '%"
								+ staffName + "%'");
		return staffs;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.scusw.finance.dao.StaffFinanceDao#addRecord(com.scusw.model.StaffFees
	 * )
	 */
	public void addFeesRecord(StaffFees staffFees) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().save(staffFees);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.scusw.finance.dao.StaffFinanceDao#getRecordById(int)
	 */
	public StaffInfo getRecordById(int staffId) {
		// TODO Auto-generated method stub
		Query q = this.getSession().createQuery(
				"from StaffInfo s where s.staffId=:staffId");
		q.setParameter("staffId", staffId);
		StaffInfo staffInfo = (StaffInfo) q.uniqueResult();
		return staffInfo;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.scusw.finance.dao.StaffFinanceDao#getRecordsById(int)
	 */
	public List<StaffFees> getRecordsById(int staffId) {
		// TODO Auto-generated method stub
		List<StaffFees> s = this.getHibernateTemplate().find(
				"from StaffFees s where s.staffInfo.staffId = " + staffId);
		return s;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.scusw.finance.dao.StaffFinanceDao#getAllFeesRecords()
	 */
	public List<StaffFees> getAllFeesRecords() {
		// TODO Auto-generated method stub

		return this.getHibernateTemplate().find(
				"from StaffFees order by sfeesTime ASC");
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.scusw.finance.dao.StaffFinanceDao#updateRoyaltyOfSalesManById(java
	 * .lang.Integer)
	 */
	public void deleteRoyaltyOfSalesManById(Integer staffId) {
		// TODO Auto-generated method stub
		/*
		 * Query q = this.getSession().createQuery(
		 * "from SalesmanInfo s where s.staffInfo.staffId=:staffId"); //
		 * q.setFirstResult(0); // q.setMaxResults(1); q.setParameter("staffId",
		 * staffId); SalesmanInfo salesmanInfo = (SalesmanInfo)
		 * q.uniqueResult();
		 * 
		 * if (salesmanInfo == null) { return; } else { ConsultInfo consultInfo
		 * = new ConsultInfo(); consultInfo.setSalesmanInfo(salesmanInfo);
		 * 
		 * this.getHibernateTemplate().delete(consultInfo);
		 * 
		 * System.out.println("delete salesman's royalty success"); }
		 */
		List<ConsultInfo> consultInfo = (List<ConsultInfo>) this
				.getHibernateTemplate().find(
						"from ConsultInfo c where c.salesmanInfo.staffInfo.staffId='"
								+ staffId + "'");
		System.out.println(consultInfo.toString());
		for (ConsultInfo c : consultInfo) {
			this.getHibernateTemplate().delete(c);
		}
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.scusw.finance.dao.StaffFinanceDao#updateRoyaltyOfTeacherById(java
	 * .lang.Integer)
	 */
	public void updateRoyaltyOfTeacherById(Integer staffId) {
		// TODO Auto-generated method stub
		Query q = this.getSession().createQuery(
				"from TeacherInfo t where t.staffInfo.staffId=:staffId");
		q.setParameter("staffId", staffId);
		TeacherInfo teacherInfo = (TeacherInfo) q.uniqueResult();

		if (teacherInfo == null) {
			return;
		} else {
			float salary = 0;
			teacherInfo.setTeacherSalary(salary);

			this.getHibernateTemplate().update(teacherInfo);
		}
	}
	
	public void updateRoyaltyOfSalesmanById(Integer staffId) {
		// TODO Auto-generated method stub
		Query q = this.getSession().createQuery(
				"from SalesmanInfo s where s.staffInfo.staffId=:staffId");
		q.setParameter("staffId", staffId);
		SalesmanInfo salesmanInfo = (SalesmanInfo) q.uniqueResult();

		if (salesmanInfo == null) {
			return;
		} else {
			float salary = 0;
			salesmanInfo.setSalesmanSalary(salary);

			this.getHibernateTemplate().update(salesmanInfo);
		}
	}

}
