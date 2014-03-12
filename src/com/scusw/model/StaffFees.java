package com.scusw.model;

import java.sql.Timestamp;

/**
 * StaffFees entity. @author MyEclipse Persistence Tools
 */

public class StaffFees implements java.io.Serializable {

	// Fields

	private Integer sfeesId;
	private StaffInfo staffInfo;
	private Float sfeesNum;
	private Timestamp sfeesTime;
	private String sfeesFrom;

	// Constructors

	/** default constructor */
	public StaffFees() {
	}

	/** minimal constructor */
	public StaffFees(Timestamp sfeesTime) {
		this.sfeesTime = sfeesTime;
	}

	/** full constructor */
	public StaffFees(StaffInfo staffInfo, Float sfeesNum, Timestamp sfeesTime,
			String sfeesFrom) {
		this.staffInfo = staffInfo;
		this.sfeesNum = sfeesNum;
		this.sfeesTime = sfeesTime;
		this.sfeesFrom = sfeesFrom;
	}

	// Property accessors

	public Integer getSfeesId() {
		return this.sfeesId;
	}

	public void setSfeesId(Integer sfeesId) {
		this.sfeesId = sfeesId;
	}

	public StaffInfo getStaffInfo() {
		return this.staffInfo;
	}

	public void setStaffInfo(StaffInfo staffInfo) {
		this.staffInfo = staffInfo;
	}

	public Float getSfeesNum() {
		return this.sfeesNum;
	}

	public void setSfeesNum(Float sfeesNum) {
		this.sfeesNum = sfeesNum;
	}

	public Timestamp getSfeesTime() {
		return this.sfeesTime;
	}

	public void setSfeesTime(Timestamp sfeesTime) {
		this.sfeesTime = sfeesTime;
	}

	public String getSfeesFrom() {
		return this.sfeesFrom;
	}

	public void setSfeesFrom(String sfeesFrom) {
		this.sfeesFrom = sfeesFrom;
	}

}