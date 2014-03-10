package com.scusw.login.action;

import java.util.Map;

import org.apache.log4j.Logger;

import com.opensymphony.xwork2.ActionContext;
import com.scusw.login.service.LoginService;
import com.scusw.model.StudentInfo;
import com.scusw.util.MD5Util;

public class LoginAction {
	private StudentInfo studentInfo;
	private LoginService loginService;
	private String loginNo;
	private String loginPass;
	private String role;
	private Map<String, Object> session;
	
	public static Logger logger = Logger.getLogger(LoginAction.class);
	
	public String getLoginNo() {
		return loginNo;
	}
	public void setLoginNo(String loginNo) {
		this.loginNo = loginNo;
	}
	public String getLoginPass() {
		return loginPass;
	}
	public void setLoginPass(String loginPass) {
		this.loginPass = loginPass;
	}
	
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public StudentInfo getStudentInfo() {
		return studentInfo;
	}
	public void setStudentInfo(StudentInfo studentInfo) {
		this.studentInfo = studentInfo;
	}
	
	public LoginService getLoginService() {
		return loginService;
	}
	public void setLoginService(LoginService loginService) {
		this.loginService = loginService;
	}
	public String checkUser() {
		
		session = ActionContext.getContext().getSession();
		if ("student".equals(role)) {
			return checkStuLogin();
		} else if ("staff".equals(role)) {
			return checkStaffLogin();
		}
		return "error";
	}
	public String checkStuLogin() {
		studentInfo = new StudentInfo();
		studentInfo.setStudentNo(loginNo);
		studentInfo.setStudentPass(loginPass);
		String passwordInCode = studentInfo.getStudentPass();
		passwordInCode = MD5Util.MD5(passwordInCode);
		studentInfo.setStudentPass(passwordInCode);
		logger.info("获得加密密码:"+studentInfo.getStudentPass());
		if (loginService.checkStuLogin(studentInfo)) {
			session.put("role", "student");
			session.put("studentNo", studentInfo.getStudentNo());

			logger.info("学生登录成功:"+studentInfo.getStudentNo());
			return "student_success";
		}
		logger.info("学生登录失败:"+studentInfo.getStudentNo());
		return "error";
	}
	public String checkStaffLogin() {
		
		return "error";
	}
}
