package com.scusw.admin.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.scusw.admin.dao.BranchDao;
import com.scusw.model.BranchInfo;


/**
 * 
 * @author liu jiahao
 *
 */

public class BranchDaoImpl extends HibernateDaoSupport implements BranchDao {

	/**
	 * query all branchs
	 */
	public List<BranchInfo> queryAllBranch() {
		
		Query query = this.getSession().createQuery("from BranchInfo bi where bi.branchAvai=1");
		List<BranchInfo> list = query.list();
		return list;
		
	}

	/**
	 * query branch by key word
	 */
	public List<BranchInfo> queryBranchByKeyword(String keyword) {
		
		StringBuilder hql = new StringBuilder();
		hql.append("from BranchInfo bi");
		hql.append(" where bi.branchAvai=1");
		hql.append(" and (bi.branchName like '%" + keyword + "%'");
		hql.append(" or bi.branchIntr like '%" + keyword + "%')");
		
		List<BranchInfo> list = this.getHibernateTemplate().find(hql.toString());
		return list;
		
	}

	
	/**
	 * delete branch by id
	 */
	public boolean delBranchById(int branchId) {
		
		BranchInfo branchInfo = this.getHibernateTemplate().get(BranchInfo.class, branchId);
		this.getHibernateTemplate().delete(branchInfo);
		return true;
		
	}

	
	/**
	 * add a record of branchIndo
	 */
	public boolean addBranch(BranchInfo branchInfo) {
		
		this.getSession().save(branchInfo);
		return true;
	}

	
	/**
	 * query branch by branchId
	 */
	public BranchInfo queryBranchById(int branchId) {
		
		return this.getHibernateTemplate().get(BranchInfo.class, branchId);
	}

	
	/**
	 * update branchInfo
	 */
	public boolean updateBranch(BranchInfo branchInfo) {
		
		this.getSession().update(branchInfo);
		return true;
	}

}
