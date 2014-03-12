package com.scusw.model;

import java.sql.Timestamp;

/**
 * AdminInfo entity. @author MyEclipse Persistence Tools
 */

public class AdminInfo implements java.io.Serializable {

	// Fields

	private Integer adminId;
	private String adminNo;
	private String adminPass;
	private String adminName;
	private String adminTel;
	private String adminEmail;
	private String adminIdcard;
	private Timestamp adminSetTime;
	private Integer adminAvai;

	// Constructors

	/** default constructor */
	public AdminInfo() {
	}

	/** minimal constructor */
	public AdminInfo(String adminNo, String adminPass, Timestamp adminSetTime) {
		this.adminNo = adminNo;
		this.adminPass = adminPass;
		this.adminSetTime = adminSetTime;
	}

	/** full constructor */
	public AdminInfo(String adminNo, String adminPass, String adminName,
			String adminTel, String adminEmail, String adminIdcard,
			Timestamp adminSetTime, Integer adminAvai) {
		this.adminNo = adminNo;
		this.adminPass = adminPass;
		this.adminName = adminName;
		this.adminTel = adminTel;
		this.adminEmail = adminEmail;
		this.adminIdcard = adminIdcard;
		this.adminSetTime = adminSetTime;
		this.adminAvai = adminAvai;
	}

	// Property accessors

	public Integer getAdminId() {
		return this.adminId;
	}

	public void setAdminId(Integer adminId) {
		this.adminId = adminId;
	}

	public String getAdminNo() {
		return this.adminNo;
	}

	public void setAdminNo(String adminNo) {
		this.adminNo = adminNo;
	}

	public String getAdminPass() {
		return this.adminPass;
	}

	public void setAdminPass(String adminPass) {
		this.adminPass = adminPass;
	}

	public String getAdminName() {
		return this.adminName;
	}

	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}

	public String getAdminTel() {
		return this.adminTel;
	}

	public void setAdminTel(String adminTel) {
		this.adminTel = adminTel;
	}

	public String getAdminEmail() {
		return this.adminEmail;
	}

	public void setAdminEmail(String adminEmail) {
		this.adminEmail = adminEmail;
	}

	public String getAdminIdcard() {
		return this.adminIdcard;
	}

	public void setAdminIdcard(String adminIdcard) {
		this.adminIdcard = adminIdcard;
	}

	public Timestamp getAdminSetTime() {
		return this.adminSetTime;
	}

	public void setAdminSetTime(Timestamp adminSetTime) {
		this.adminSetTime = adminSetTime;
	}

	public Integer getAdminAvai() {
		return this.adminAvai;
	}

	public void setAdminAvai(Integer adminAvai) {
		this.adminAvai = adminAvai;
	}

}