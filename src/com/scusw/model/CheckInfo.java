package com.scusw.model;

import java.sql.Timestamp;

/**
 * CheckInfo entity. @author MyEclipse Persistence Tools
 */

public class CheckInfo implements java.io.Serializable {

	// Fields

	private Integer checkId;
	private ClassInfo classInfo;
	private Timestamp checkTime;
	private String checkFile;

	// Constructors

	/** default constructor */
	public CheckInfo() {
	}

	/** minimal constructor */
	public CheckInfo(Timestamp checkTime) {
		this.checkTime = checkTime;
	}

	/** full constructor */
	public CheckInfo(ClassInfo classInfo, Timestamp checkTime, String checkFile) {
		this.classInfo = classInfo;
		this.checkTime = checkTime;
		this.checkFile = checkFile;
	}

	// Property accessors

	public Integer getCheckId() {
		return this.checkId;
	}

	public void setCheckId(Integer checkId) {
		this.checkId = checkId;
	}

	public ClassInfo getClassInfo() {
		return this.classInfo;
	}

	public void setClassInfo(ClassInfo classInfo) {
		this.classInfo = classInfo;
	}

	public Timestamp getCheckTime() {
		return this.checkTime;
	}

	public void setCheckTime(Timestamp checkTime) {
		this.checkTime = checkTime;
	}

	public String getCheckFile() {
		return this.checkFile;
	}

	public void setCheckFile(String checkFile) {
		this.checkFile = checkFile;
	}

}