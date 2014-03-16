package com.scusw.admin.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.scusw.admin.dao.DepartmentDao;
import com.scusw.model.BranchInfo;
import com.scusw.model.DepartmentInfo;


/**
 * manage privilege
 * @author liu jiahao
 *
 */

public class DepartmentDaoImpl extends HibernateDaoSupport implements DepartmentDao {

	// query all department
	public List<DepartmentInfo> queryAllDepartment(int currentPage,int pageSize) {
		Query query = this.getSession().createQuery("from DepartmentInfo di where di.departmentAvai=1 order by di.branchInfo.branchId");
		int startRow = (currentPage-1)*pageSize;
		query.setFirstResult(startRow);
		query.setMaxResults(pageSize);
		List<DepartmentInfo> list = query.list();
		return list;
	}

	// query department by key word
	public List<DepartmentInfo> queryDepartmentByKeyword(String keyword,int currentPage,int pageSize) {
		StringBuilder hql = new StringBuilder();
		hql.append("from DepartmentInfo di");
		hql.append(" where di.departmentAvai=1");
		hql.append(" and (di.departmentName like '%" + keyword + "%'");
		hql.append(" or di.departmentIntr like '%" + keyword + "%')");
		hql.append(" order by  di.branchInfo.branchId");
		Query query = this.getSession().createQuery(hql.toString());
		int startRow = (currentPage-1)*pageSize;
		query.setFirstResult(startRow);
		query.setMaxResults(pageSize);
		
		List<DepartmentInfo> list = query.list();
		return list;
		
	}
	
	public int queryTotalDepartment() {
		Query query = this.getSession().createQuery("from DepartmentInfo di where di.departmentAvai=1 order by di.branchInfo.branchId");
		List<DepartmentInfo> list = query.list();
		return list.size();
	}

	public int queryNoDepartmentByKeyword(String keyword) {
		StringBuilder hql = new StringBuilder();
		hql.append("from DepartmentInfo di");
		hql.append(" where di.departmentAvai=1");
		hql.append(" and (di.departmentName like '%" + keyword + "%'");
		hql.append(" or di.departmentIntr like '%" + keyword + "%')");
		hql.append(" order by  di.branchInfo.branchId");
		Query query = this.getSession().createQuery(hql.toString());
		List<DepartmentInfo> list = query.list();
		return list.size();
	}

	// delete department by id
	public boolean delDepartmentById(int departmentId) {
		DepartmentInfo departmentInfo = this.getHibernateTemplate().get(DepartmentInfo.class, departmentId);
		this.getHibernateTemplate().delete(departmentInfo);
		return true;
	}

	public boolean addDepartment(DepartmentInfo departmentInfo) {
		this.getSession().save(departmentInfo);
		return true;
	}

	public DepartmentInfo queryDepartmentById(int departmentId) {
		return this.getHibernateTemplate().get(DepartmentInfo.class, departmentId);
	}

	public boolean updateDepartment(DepartmentInfo departmentInfo) {
		this.getSession().update(departmentInfo);
		return true;
	}

	// query all branchs
	public List<BranchInfo> queryAllBranch() {
		Query query = this.getSession().createQuery("from BranchInfo bi");
		List<BranchInfo> list = query.list();
		return list;
	}

	public List<DepartmentInfo> queryDepartmentByBranchId(int branchId,
			int currentPage, int pageSize) {
		Query query = this.getSession().createQuery("from DepartmentInfo di" +
				" where di.departmentAvai=1 " +
				" and di.branchInfo.branchId=:branchId");
		query.setParameter("branchId", branchId);
		int startRow = (currentPage-1)*pageSize;
		query.setFirstResult(startRow);
		query.setMaxResults(pageSize);
		List<DepartmentInfo> list = query.list();
		return list;
	}

	public List<DepartmentInfo> queryDepartmentByBranchId(int branchId) {
		Query query = this.getSession().createQuery("from DepartmentInfo di" +
				" where di.departmentAvai=1 " +
				" and di.branchInfo.branchId=:branchId");
		query.setParameter("branchId", branchId);
		List<DepartmentInfo> list = query.list();
		return list;
	}
	
	public int queryNoDepartmentByBranchId(int branchId) {
		Query query = this.getSession().createQuery("from DepartmentInfo di" +
				" where di.departmentAvai=1 " +
				" and di.branchInfo.branchId=:branchId");
		query.setParameter("branchId", branchId);
		List<DepartmentInfo> list = query.list();
		return list.size();
	}

}
