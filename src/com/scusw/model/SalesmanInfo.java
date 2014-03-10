package com.scusw.model;

import java.util.HashSet;
import java.util.Set;

/**
 * SalesmanInfo entity. @author MyEclipse Persistence Tools
 */

public class SalesmanInfo implements java.io.Serializable {

	// Fields

	private Integer staffId;
	private StaffInfo staffInfo;
	private Float salesmanSalary;
	private String staffsmanRemark;
	private Set consultInfos = new HashSet(0);

	// Constructors

	/** default constructor */
	public SalesmanInfo() {
	}

	/** minimal constructor */
	public SalesmanInfo(Integer staffId, StaffInfo staffInfo) {
		this.staffId = staffId;
		this.staffInfo = staffInfo;
	}

	/** full constructor */
	public SalesmanInfo(Integer staffId, StaffInfo staffInfo,
			Float salesmanSalary, String staffsmanRemark, Set consultInfos) {
		this.staffId = staffId;
		this.staffInfo = staffInfo;
		this.salesmanSalary = salesmanSalary;
		this.staffsmanRemark = staffsmanRemark;
		this.consultInfos = consultInfos;
	}

	// Property accessors

	public Integer getStaffId() {
		return this.staffId;
	}

	public void setStaffId(Integer staffId) {
		this.staffId = staffId;
	}

	public StaffInfo getStaffInfo() {
		return this.staffInfo;
	}

	public void setStaffInfo(StaffInfo staffInfo) {
		this.staffInfo = staffInfo;
	}

	public Float getSalesmanSalary() {
		return this.salesmanSalary;
	}

	public void setSalesmanSalary(Float salesmanSalary) {
		this.salesmanSalary = salesmanSalary;
	}

	public String getStaffsmanRemark() {
		return this.staffsmanRemark;
	}

	public void setStaffsmanRemark(String staffsmanRemark) {
		this.staffsmanRemark = staffsmanRemark;
	}

	public Set getConsultInfos() {
		return this.consultInfos;
	}

	public void setConsultInfos(Set consultInfos) {
		this.consultInfos = consultInfos;
	}

}