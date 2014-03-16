package com.scusw.admin.dao.impl;

import org.hibernate.Query;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.scusw.admin.dao.LoginDao;
import com.scusw.model.AdminInfo;


/**
 * manage privilege
 * @author liu jiahao
 *
 */

public class LoginDaoImpl extends HibernateDaoSupport implements LoginDao{

	/**
	 * query DB if Admin login if exist
	 * return null or Admin info object
	 */
	public AdminInfo checkAdminLogin(AdminInfo adminInfo) {
		Query query = this.getSession().createQuery("from AdminInfo a " + "where a.adminNo=:id " + "and a.adminPass=:pass");
		query.setParameter("id", adminInfo.getAdminNo());
		query.setParameter("pass", adminInfo.getAdminPass());
		AdminInfo admin = (AdminInfo)query.uniqueResult();
		return admin;
	}
	
}
