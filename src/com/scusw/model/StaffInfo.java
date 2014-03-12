package com.scusw.model;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

/**
 * StaffInfo entity. @author MyEclipse Persistence Tools
 */

public class StaffInfo implements java.io.Serializable {

	// Fields

	private Integer staffId;
	private GroupInfo groupInfo;
	private PositionInfo positionInfo;
	private String staffNo;
	private String staffPass;
	private Integer staffSex;
	private String staffName;
	private String staffPhone;
	private String staffQq;
	private String staffIdcard;
	private Timestamp staffEmplTime;
	private Integer staffAvai;
	private String staffOthers;
	private Set noticeInfos = new HashSet(0);
	private Set staffAttandants = new HashSet(0);
	private Set scheduleInfos = new HashSet(0);
	private Set teacherInfos = new HashSet(0);
	private Set staffFeeses = new HashSet(0);
	private Set salesmanInfos = new HashSet(0);

	// Constructors

	/** default constructor */
	public StaffInfo() {
	}

	/** minimal constructor */
	public StaffInfo(GroupInfo groupInfo, PositionInfo positionInfo,
			String staffNo, Timestamp staffEmplTime) {
		this.groupInfo = groupInfo;
		this.positionInfo = positionInfo;
		this.staffNo = staffNo;
		this.staffEmplTime = staffEmplTime;
	}

	/** full constructor */
	public StaffInfo(GroupInfo groupInfo, PositionInfo positionInfo,
			String staffNo, String staffPass, Integer staffSex,
			String staffName, String staffPhone, String staffQq,
			String staffIdcard, Timestamp staffEmplTime, Integer staffAvai,
			String staffOthers, Set noticeInfos, Set staffAttandants,
			Set scheduleInfos, Set teacherInfos, Set staffFeeses,
			Set salesmanInfos) {
		this.groupInfo = groupInfo;
		this.positionInfo = positionInfo;
		this.staffNo = staffNo;
		this.staffPass = staffPass;
		this.staffSex = staffSex;
		this.staffName = staffName;
		this.staffPhone = staffPhone;
		this.staffQq = staffQq;
		this.staffIdcard = staffIdcard;
		this.staffEmplTime = staffEmplTime;
		this.staffAvai = staffAvai;
		this.staffOthers = staffOthers;
		this.noticeInfos = noticeInfos;
		this.staffAttandants = staffAttandants;
		this.scheduleInfos = scheduleInfos;
		this.teacherInfos = teacherInfos;
		this.staffFeeses = staffFeeses;
		this.salesmanInfos = salesmanInfos;
	}

	// Property accessors

	public Integer getStaffId() {
		return this.staffId;
	}

	public void setStaffId(Integer staffId) {
		this.staffId = staffId;
	}

	public GroupInfo getGroupInfo() {
		return this.groupInfo;
	}

	public void setGroupInfo(GroupInfo groupInfo) {
		this.groupInfo = groupInfo;
	}

	public PositionInfo getPositionInfo() {
		return this.positionInfo;
	}

	public void setPositionInfo(PositionInfo positionInfo) {
		this.positionInfo = positionInfo;
	}

	public String getStaffNo() {
		return this.staffNo;
	}

	public void setStaffNo(String staffNo) {
		this.staffNo = staffNo;
	}

	public String getStaffPass() {
		return this.staffPass;
	}

	public void setStaffPass(String staffPass) {
		this.staffPass = staffPass;
	}

	public Integer getStaffSex() {
		return this.staffSex;
	}

	public void setStaffSex(Integer staffSex) {
		this.staffSex = staffSex;
	}

	public String getStaffName() {
		return this.staffName;
	}

	public void setStaffName(String staffName) {
		this.staffName = staffName;
	}

	public String getStaffPhone() {
		return this.staffPhone;
	}

	public void setStaffPhone(String staffPhone) {
		this.staffPhone = staffPhone;
	}

	public String getStaffQq() {
		return this.staffQq;
	}

	public void setStaffQq(String staffQq) {
		this.staffQq = staffQq;
	}

	public String getStaffIdcard() {
		return this.staffIdcard;
	}

	public void setStaffIdcard(String staffIdcard) {
		this.staffIdcard = staffIdcard;
	}

	public Timestamp getStaffEmplTime() {
		return this.staffEmplTime;
	}

	public void setStaffEmplTime(Timestamp staffEmplTime) {
		this.staffEmplTime = staffEmplTime;
	}

	public Integer getStaffAvai() {
		return this.staffAvai;
	}

	public void setStaffAvai(Integer staffAvai) {
		this.staffAvai = staffAvai;
	}

	public String getStaffOthers() {
		return this.staffOthers;
	}

	public void setStaffOthers(String staffOthers) {
		this.staffOthers = staffOthers;
	}

	public Set getNoticeInfos() {
		return this.noticeInfos;
	}

	public void setNoticeInfos(Set noticeInfos) {
		this.noticeInfos = noticeInfos;
	}

	public Set getStaffAttandants() {
		return this.staffAttandants;
	}

	public void setStaffAttandants(Set staffAttandants) {
		this.staffAttandants = staffAttandants;
	}

	public Set getScheduleInfos() {
		return this.scheduleInfos;
	}

	public void setScheduleInfos(Set scheduleInfos) {
		this.scheduleInfos = scheduleInfos;
	}

	public Set getTeacherInfos() {
		return this.teacherInfos;
	}

	public void setTeacherInfos(Set teacherInfos) {
		this.teacherInfos = teacherInfos;
	}

	public Set getStaffFeeses() {
		return this.staffFeeses;
	}

	public void setStaffFeeses(Set staffFeeses) {
		this.staffFeeses = staffFeeses;
	}

	public Set getSalesmanInfos() {
		return this.salesmanInfos;
	}

	public void setSalesmanInfos(Set salesmanInfos) {
		this.salesmanInfos = salesmanInfos;
	}

}