package com.scusw.admin.service;

import com.scusw.model.AdminInfo;

/**
 * manage privilege
 * @author liu jiahao
 *
 */

public interface LoginService {
	
	// check admin info 
	public boolean checkAdminInfo(AdminInfo adminInfo);
	
}
