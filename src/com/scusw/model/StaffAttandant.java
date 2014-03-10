package com.scusw.model;

import java.sql.Timestamp;

/**
 * StaffAttandant entity. @author MyEclipse Persistence Tools
 */

public class StaffAttandant implements java.io.Serializable {

	// Fields

	private Integer attendantId;
	private StaffInfo staffInfo;
	private Timestamp attendantTime;
	private String attendantRemark;

	// Constructors

	/** default constructor */
	public StaffAttandant() {
	}

	/** minimal constructor */
	public StaffAttandant(Timestamp attendantTime) {
		this.attendantTime = attendantTime;
	}

	/** full constructor */
	public StaffAttandant(StaffInfo staffInfo, Timestamp attendantTime,
			String attendantRemark) {
		this.staffInfo = staffInfo;
		this.attendantTime = attendantTime;
		this.attendantRemark = attendantRemark;
	}

	// Property accessors

	public Integer getAttendantId() {
		return this.attendantId;
	}

	public void setAttendantId(Integer attendantId) {
		this.attendantId = attendantId;
	}

	public StaffInfo getStaffInfo() {
		return this.staffInfo;
	}

	public void setStaffInfo(StaffInfo staffInfo) {
		this.staffInfo = staffInfo;
	}

	public Timestamp getAttendantTime() {
		return this.attendantTime;
	}

	public void setAttendantTime(Timestamp attendantTime) {
		this.attendantTime = attendantTime;
	}

	public String getAttendantRemark() {
		return this.attendantRemark;
	}

	public void setAttendantRemark(String attendantRemark) {
		this.attendantRemark = attendantRemark;
	}

}