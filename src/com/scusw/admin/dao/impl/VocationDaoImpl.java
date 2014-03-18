package com.scusw.admin.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.scusw.admin.dao.VocationDao;
import com.scusw.model.BranchInfo;
import com.scusw.model.DepartmentInfo;
import com.scusw.model.PositionInfo;


/**
 * manage privilege
 * @author liu jiahao
 *
 */

public class VocationDaoImpl extends HibernateDaoSupport implements VocationDao {

	
	/**
	 * query all position/vocation
	 */
	public List<PositionInfo> queryAllVocation(int currentPage,int pageSize) {
		
		Query query = this.getSession().createQuery("from PositionInfo v where v.vocationAvai=1 " +
				"order by v.departmentInfo.departmentId");
		int startRow = (currentPage-1)*pageSize;
		query.setFirstResult(startRow);
		query.setMaxResults(pageSize);
		List<PositionInfo> list = query.list();
		return list;
	}
	
	
	/**
	 * query vocatin by Id
	 */
	public PositionInfo queryVocationById(int vocationId){
		
		return this.getHibernateTemplate().get(PositionInfo.class, vocationId);
	}
	
	
	/**
	 * get total number of vocations
	 */
	public int getTotalVocation(){
	
		List<PositionInfo> list = this.getHibernateTemplate().find("from PositionInfo v where v.vocationAvai=1");
		return list.size();
	
	}

	
	/**
	 * update vocation
	 */
	public boolean updateVocation(PositionInfo vocation) {

		this.getHibernateTemplate().update(vocation);
		return true;
	}
	

	
	/**
	 * query vocation by branchId
	 */
	public List<PositionInfo> queryVocationByBranchId(int branchId,int currentPage,int pageSize) {

		Query query = this.getSession().createQuery("from PositionInfo v " +
				"where v.vocationAvai=1 and v.departmentInfo.branchInfo.branchId=:branchId");
		query.setParameter("branchId", branchId);
		int startRow = (currentPage-1)*pageSize;
		query.setFirstResult(startRow);
		query.setMaxResults(pageSize);
		List<PositionInfo> list = query.list();
		return list;
	}

	
	
	/**
	 * query vocation by keyword
	 */
	public List<PositionInfo> queryVocatinByKeyword(String keyword,int currentPage,int pageSize) {
		
		StringBuilder hql = new StringBuilder();
		hql.append("from PositionInfo v");
		hql.append(" where v.vocationAvai=1");
		hql.append(" and v.vocationName like '%" + keyword + "%'");
		hql.append(" order by  v.departmentInfo.departmentId");
		Query query = this.getSession().createQuery(hql.toString());
		int startRow = (currentPage-1)*pageSize;
		query.setFirstResult(startRow);
		query.setMaxResults(pageSize);
		List<PositionInfo> list = query.list();
		return list;
	}

	
	/**
	 * query num Vocation By BranchId
	 */
	public int queryNoVocationByBranchId(int branchId) {
		
		Query query = this.getSession().createQuery("from PositionInfo v " +
				"where v.vocationAvai=1 and v.departmentInfo.branchInfo.branchId=:branchId");
		query.setParameter("branchId", branchId);
		List<PositionInfo> list = query.list();
		return list.size();
	}

	
	/**
	 * query num Vocatin By Keyword
	 */
	public int queryNoVocatinByKeyword(String keyword) {
		
		StringBuilder hql = new StringBuilder();
		hql.append("from PositionInfo v");
		hql.append(" where v.vocationAvai=1");
		hql.append(" and v.vocationName like '%" + keyword + "%'");
		hql.append(" order by  v.departmentInfo.departmentId");
		Query query = this.getSession().createQuery(hql.toString());
		List<PositionInfo> list = query.list();
		return list.size();
	}

	
	/**
	 * addVocation
	 */
	public boolean addVocation(PositionInfo vocation) {
		
		this.getSession().save(vocation);
		return true;
	}

}
