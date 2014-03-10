package com.scusw.model;

import java.sql.Timestamp;

/**
 * NoticeInfo entity. @author MyEclipse Persistence Tools
 */

public class NoticeInfo implements java.io.Serializable {

	// Fields

	private Integer noticeId;
	private StaffInfo staffInfo;
	private String noticeType;
	private String noticeTitle;
	private String noticeContent;
	private Timestamp noticeTime;
	private Integer noticeAvai;

	// Constructors

	/** default constructor */
	public NoticeInfo() {
	}

	/** minimal constructor */
	public NoticeInfo(Timestamp noticeTime) {
		this.noticeTime = noticeTime;
	}

	/** full constructor */
	public NoticeInfo(StaffInfo staffInfo, String noticeType,
			String noticeTitle, String noticeContent, Timestamp noticeTime,
			Integer noticeAvai) {
		this.staffInfo = staffInfo;
		this.noticeType = noticeType;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.noticeTime = noticeTime;
		this.noticeAvai = noticeAvai;
	}

	// Property accessors

	public Integer getNoticeId() {
		return this.noticeId;
	}

	public void setNoticeId(Integer noticeId) {
		this.noticeId = noticeId;
	}

	public StaffInfo getStaffInfo() {
		return this.staffInfo;
	}

	public void setStaffInfo(StaffInfo staffInfo) {
		this.staffInfo = staffInfo;
	}

	public String getNoticeType() {
		return this.noticeType;
	}

	public void setNoticeType(String noticeType) {
		this.noticeType = noticeType;
	}

	public String getNoticeTitle() {
		return this.noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public String getNoticeContent() {
		return this.noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	public Timestamp getNoticeTime() {
		return this.noticeTime;
	}

	public void setNoticeTime(Timestamp noticeTime) {
		this.noticeTime = noticeTime;
	}

	public Integer getNoticeAvai() {
		return this.noticeAvai;
	}

	public void setNoticeAvai(Integer noticeAvai) {
		this.noticeAvai = noticeAvai;
	}

}