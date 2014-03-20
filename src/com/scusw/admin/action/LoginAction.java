package com.scusw.admin.action;

import java.util.Map;

import org.apache.log4j.Logger;

import com.opensymphony.xwork2.ActionContext;
import com.scusw.admin.service.LoginService;
import com.scusw.model.AdminInfo;
import com.scusw.util.MD5Util;


/**
 * manage privilege
 * @author liu jiahao
 *
 */

public class LoginAction {
	private AdminInfo adminInfo;
	private LoginService loginService;
	private String loginId;
	private String loginPass;
	private Map<String, Object> session;
	
	public static Logger logger = Logger.getLogger(LoginAction.class);

	public AdminInfo getAdminInfo() {
		return adminInfo;
	}

	public void setAdminInfo(AdminInfo adminInfo) {
		this.adminInfo = adminInfo;
	}

	public LoginService getLoginService() {
		return loginService;
	}

	public void setLoginService(LoginService loginService) {
		this.loginService = loginService;
	}

	public String getLoginId() {
		return loginId;
	}

	public void setLoginNo(String loginId) {
		this.loginId = loginId;
	}

	public String getLoginPass() {
		return loginPass;
	}

	public void setLoginPass(String loginPass) {
		this.loginPass = loginPass;
	}

	

	public static Logger getLogger() {
		return logger;
	}

	public static void setLogger(Logger logger) {
		LoginAction.logger = logger;
	}
	
	/**
	 * check if admin login success
	 * return string
	 * passwordCoded for safe
	 */
	public String checkAdminLogin(){
		session = ActionContext.getContext().getSession();
		AdminInfo adminInfo = new AdminInfo();
		adminInfo.setAdminNo(loginId);
		String passwordCoded = MD5Util.MD5(loginPass);
		adminInfo.setAdminPass(passwordCoded);
		
		logger.info("login no: " + adminInfo.getAdminNo() + "\nlogin password: " + adminInfo.getAdminPass());
		
		if(loginService.checkAdminInfo(adminInfo)){
			session.put("adminId", adminInfo.getAdminNo());
			return "admin_login_success";
		}
		return "admin_login_failed";
	}
}
