package com.scusw.admin.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.scusw.admin.dao.StaffDao;
import com.scusw.model.StaffInfo;


/**
 * 
 * @author liu jiahao
 *
 */

public class StaffDaoImpl extends HibernateDaoSupport implements StaffDao {

	
	/**
	 * query all staff
	 */
	public List<StaffInfo> queryAllStaff(int currentPage,int pageSize) {
		
		Query query = this.getSession().createQuery("from StaffInfo s where s.staffAvai=1 " +
				"order by s.positionInfo.vocationId");
		int startRow = (currentPage-1)*pageSize;
		query.setFirstResult(startRow);
		query.setMaxResults(pageSize);
		List<StaffInfo> list = query.list();
		return list;
		
	}
	
	
	/**
	 * query staff by Id
	 */
	public StaffInfo queryStaffById(int staffId){
		
		return this.getHibernateTemplate().get(StaffInfo.class, staffId);
	}
	
	
	/**
	 * get total number of staff
	 */
	public int getTotalStaff(){
	
		List<StaffInfo> list = this.getHibernateTemplate().find("from StaffInfo s where s.staffAvai=1");
		return list.size();
	
	}

	
	/**
	 * update staff
	 */
	public boolean updateStaff(StaffInfo staff) {

		this.getHibernateTemplate().update(staff);
		return true;
	}
	
	
	
	/**
	 * query staff by branchId
	 */
	public List<StaffInfo> queryStaffByBranchId(int branchId,int currentPage,int pageSize) {

		Query query = this.getSession().createQuery("from StaffInfo s " +
				"where s.staffAvai=1 and s.positionInfo.departmentInfo.branchInfo.branchId=:branchId");
		query.setParameter("branchId", branchId);
		int startRow = (currentPage-1)*pageSize;
		query.setFirstResult(startRow);
		query.setMaxResults(pageSize);
		List<StaffInfo> list = query.list();
		return list;
	}

	
	
	/**
	 * query staff by keyword
	 */
	public List<StaffInfo> queryStaffByKeyword(String keyword,int currentPage,int pageSize) {
		
		StringBuilder hql = new StringBuilder();
		hql.append("from StaffInfo s");
		hql.append(" where s.staffAvai=1");
		hql.append(" and s.staffName like '%" + keyword + "%'");
		hql.append(" order by  s.positionInfo.vocationId");
		Query query = this.getSession().createQuery(hql.toString());
		int startRow = (currentPage-1)*pageSize;
		query.setFirstResult(startRow);
		query.setMaxResults(pageSize);
		List<StaffInfo> list = query.list();
		return list;
	}

	
	/**
	 * query num staff By BranchId
	 */
	public int queryNoStaffByBranchId(int branchId) {
		
		Query query = this.getSession().createQuery("from StaffInfo s " +
				"where s.staffAvai=1 and s.positionInfo.departmentInfo.branchInfo.branchId=:branchId");
		query.setParameter("branchId", branchId);
		List<StaffInfo> list = query.list();
		return list.size();
	}

	
	/**
	 * query num staff By Keyword
	 */
	public int queryNoStaffByKeyword(String keyword) {
		
		StringBuilder hql = new StringBuilder();
		hql.append("from StaffInfo s");
		hql.append(" where s.staffAvai=1");
		hql.append(" and s.staffName like '%" + keyword + "%'");
		hql.append(" order by  s.positionInfo.vocationId");
		Query query = this.getSession().createQuery(hql.toString());
		List<StaffInfo> list = query.list();
		return list.size();
	}

	
	/**
	 * add Staff
	 */
	public boolean addStaff(StaffInfo staff) {
		
		this.getSession().save(staff);
		return true;
	}

}
