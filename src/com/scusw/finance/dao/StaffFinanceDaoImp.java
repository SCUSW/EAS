/**
 * 
 */
package com.scusw.finance.dao;

import java.util.List;

import org.hibernate.Query;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.scusw.model.StaffFees;
import com.scusw.model.StaffInfo;
import com.scusw.model.StudentInfo;

/**
 * @author Administrator
 *
 */
public class StaffFinanceDaoImp extends HibernateDaoSupport implements StaffFinanceDao{

	/* (non-Javadoc)
	 * @see com.scusw.finance.dao.StaffFinanceDao#queryAllStaff()
	 */
	public List<StaffInfo> queryAllStaff() {
		// TODO Auto-generated method stub
		List<StaffInfo> staffs = getHibernateTemplate().find("from StaffInfo");
		
		return staffs;
	}

	/* (non-Javadoc)
	 * @see com.scusw.finance.dao.StaffFinanceDao#queryStaff(java.lang.String)
	 */
	public List<StaffInfo> queryStaff(String staffName) {
		List<StaffInfo> staffs = getHibernateTemplate().find("from StaffInfo s where s.staffName like '%" + staffName + "%'");
		return staffs;
	}

	/* (non-Javadoc)
	 * @see com.scusw.finance.dao.StaffFinanceDao#addRecord(com.scusw.model.StaffFees)
	 */
	public void addRecord(StaffFees staffFees) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().save(staffFees);
	}

	/* (non-Javadoc)
	 * @see com.scusw.finance.dao.StaffFinanceDao#getRecordById(int)
	 */
	public StaffInfo getRecordById(int staffId) {
		// TODO Auto-generated method stub
		Query q = this.getSession().createQuery("from StaffInfo s where s.staffId=:staffId");
		q.setParameter("staffId", staffId);
		StaffInfo staffInfo = (StaffInfo) q.uniqueResult();
		return staffInfo;
	}


	/* (non-Javadoc)
	 * @see com.scusw.finance.dao.StaffFinanceDao#getRecordsById(int)
	 */
	public List<StaffFees> getRecordsById(int staffId) {
		// TODO Auto-generated method stub
		List<StaffFees> s = this.getHibernateTemplate().find("from StaffFees s where s.staffInfo.staffId = " + staffId);
		return s;
	}
	
}
