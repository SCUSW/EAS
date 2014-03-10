package com.scusw.model;

import java.sql.Timestamp;

/**
 * StudentAttendant entity. @author MyEclipse Persistence Tools
 */

public class StudentAttendant implements java.io.Serializable {

	// Fields

	private Integer attendantId;
	private RegisterInfo registerInfo;
	private Timestamp attendantTime;
	private String attendantRemark;

	// Constructors

	/** default constructor */
	public StudentAttendant() {
	}

	/** minimal constructor */
	public StudentAttendant(Timestamp attendantTime) {
		this.attendantTime = attendantTime;
	}

	/** full constructor */
	public StudentAttendant(RegisterInfo registerInfo, Timestamp attendantTime,
			String attendantRemark) {
		this.registerInfo = registerInfo;
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

	public RegisterInfo getRegisterInfo() {
		return this.registerInfo;
	}

	public void setRegisterInfo(RegisterInfo registerInfo) {
		this.registerInfo = registerInfo;
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