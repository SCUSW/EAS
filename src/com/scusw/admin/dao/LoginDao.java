package com.scusw.admin.dao;

import com.scusw.model.AdminInfo;

public interface LoginDao {
	
	// check admin login info 
	public AdminInfo checkAdminLogin(AdminInfo adminInfo);
}
