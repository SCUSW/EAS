package com.scusw.login.action;

import java.util.Map;

import org.apache.log4j.Logger;

import com.opensymphony.xwork2.ActionContext;
import com.scusw.login.service.AccountService;

public class AccountAction {
	private AccountService accountService;
	private Map<String, Object> session;
	private Map<String, Object> request;
	private String oldPassword;
	private String newPassword;
	private String loginNo;
	
	
	
	public String getLoginNo() {
		return loginNo;
	}
	public void setLoginNo(String loginNo) {
		this.loginNo = loginNo;
	}
	public String getOldPassword() {
		return oldPassword;
	}
	public void setOldPassword(String oldPassword) {
		this.oldPassword = oldPassword;
	}
	public String getNewPassword() {
		return newPassword;
	}
	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}
	
	public static Logger logger = Logger.getLogger(AccountAction.class);
	public AccountService getAccountService() {
		return accountService;
	}

	public void setAccountService(AccountService accountService) {
		this.accountService = accountService;
	}
	public String changePass() {
		session = ActionContext.getContext().getSession();
		request = (Map<String, Object>) ActionContext.getContext().get("request");
		request.clear();
		String role = (String) session.get("role");
		logger.info("帐号"+loginNo + " 旧密码 :"+ oldPassword + " 新密码 :"+newPassword + " role :"+role);
		if (!accountService.updatePassword(loginNo, newPassword, oldPassword, role)) {
			request.put("state", "修改失败");
			return "default";
		}
		request.put("state", "修改成功");
		return "default";
	}
	
}
