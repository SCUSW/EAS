package com.scusw.admin.dao;

import com.scusw.model.AdminInfo;


/**
 * manage privilege
 * @author liu jiahao
 *
 */

public interface LoginDao {
	
	// check admin login info 
	public AdminInfo checkAdminLogin(AdminInfo adminInfo);
}
