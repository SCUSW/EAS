package com.scusw.model;

import java.sql.Timestamp;

/**
 * ScheduleInfo entity. @author MyEclipse Persistence Tools
 */

public class ScheduleInfo implements java.io.Serializable {

	// Fields

	private Integer scheduleId;
	private StaffInfo staffInfo;
	private Timestamp scheduleBegin;
	private Timestamp scheduleEnd;
	private String scheduleContent;
	private Integer scheduleAvai;

	// Constructors

	/** default constructor */
	public ScheduleInfo() {
	}

	/** minimal constructor */
	public ScheduleInfo(Timestamp scheduleBegin, Timestamp scheduleEnd) {
		this.scheduleBegin = scheduleBegin;
		this.scheduleEnd = scheduleEnd;
	}

	/** full constructor */
	public ScheduleInfo(StaffInfo staffInfo, Timestamp scheduleBegin,
			Timestamp scheduleEnd, String scheduleContent, Integer scheduleAvai) {
		this.staffInfo = staffInfo;
		this.scheduleBegin = scheduleBegin;
		this.scheduleEnd = scheduleEnd;
		this.scheduleContent = scheduleContent;
		this.scheduleAvai = scheduleAvai;
	}

	// Property accessors

	public Integer getScheduleId() {
		return this.scheduleId;
	}

	public void setScheduleId(Integer scheduleId) {
		this.scheduleId = scheduleId;
	}

	public StaffInfo getStaffInfo() {
		return this.staffInfo;
	}

	public void setStaffInfo(StaffInfo staffInfo) {
		this.staffInfo = staffInfo;
	}

	public Timestamp getScheduleBegin() {
		return this.scheduleBegin;
	}

	public void setScheduleBegin(Timestamp scheduleBegin) {
		this.scheduleBegin = scheduleBegin;
	}

	public Timestamp getScheduleEnd() {
		return this.scheduleEnd;
	}

	public void setScheduleEnd(Timestamp scheduleEnd) {
		this.scheduleEnd = scheduleEnd;
	}

	public String getScheduleContent() {
		return this.scheduleContent;
	}

	public void setScheduleContent(String scheduleContent) {
		this.scheduleContent = scheduleContent;
	}

	public Integer getScheduleAvai() {
		return this.scheduleAvai;
	}

	public void setScheduleAvai(Integer scheduleAvai) {
		this.scheduleAvai = scheduleAvai;
	}

}