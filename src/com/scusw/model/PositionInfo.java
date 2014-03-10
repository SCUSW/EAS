package com.scusw.model;

import java.util.HashSet;
import java.util.Set;

/**
 * PositionInfo entity. @author MyEclipse Persistence Tools
 */

public class PositionInfo implements java.io.Serializable {

	// Fields

	private Integer vocationId;
	private DepartmentInfo departmentInfo;
	private String vocationName;
	private Float wageBase;
	private Integer vocationAvai;
	private String vocationRemark;
	private Set staffInfos = new HashSet(0);

	// Constructors

	/** default constructor */
	public PositionInfo() {
	}

	/** minimal constructor */
	public PositionInfo(DepartmentInfo departmentInfo) {
		this.departmentInfo = departmentInfo;
	}

	/** full constructor */
	public PositionInfo(DepartmentInfo departmentInfo, String vocationName,
			Float wageBase, Integer vocationAvai, String vocationRemark,
			Set staffInfos) {
		this.departmentInfo = departmentInfo;
		this.vocationName = vocationName;
		this.wageBase = wageBase;
		this.vocationAvai = vocationAvai;
		this.vocationRemark = vocationRemark;
		this.staffInfos = staffInfos;
	}

	// Property accessors

	public Integer getVocationId() {
		return this.vocationId;
	}

	public void setVocationId(Integer vocationId) {
		this.vocationId = vocationId;
	}

	public DepartmentInfo getDepartmentInfo() {
		return this.departmentInfo;
	}

	public void setDepartmentInfo(DepartmentInfo departmentInfo) {
		this.departmentInfo = departmentInfo;
	}

	public String getVocationName() {
		return this.vocationName;
	}

	public void setVocationName(String vocationName) {
		this.vocationName = vocationName;
	}

	public Float getWageBase() {
		return this.wageBase;
	}

	public void setWageBase(Float wageBase) {
		this.wageBase = wageBase;
	}

	public Integer getVocationAvai() {
		return this.vocationAvai;
	}

	public void setVocationAvai(Integer vocationAvai) {
		this.vocationAvai = vocationAvai;
	}

	public String getVocationRemark() {
		return this.vocationRemark;
	}

	public void setVocationRemark(String vocationRemark) {
		this.vocationRemark = vocationRemark;
	}

	public Set getStaffInfos() {
		return this.staffInfos;
	}

	public void setStaffInfos(Set staffInfos) {
		this.staffInfos = staffInfos;
	}

}