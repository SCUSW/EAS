package com.scusw.model;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

/**
 * DepartmentInfo entity. @author MyEclipse Persistence Tools
 */

public class DepartmentInfo implements java.io.Serializable {

	// Fields

	private Integer departmentId;
	private BranchInfo branchInfo;
	private String departmentName;
	private Timestamp departmentFoundedTime;
	private Integer departmentAvai;
	private String departmentIntr;
	private Set positionInfos = new HashSet(0);

	// Constructors

	/** default constructor */
	public DepartmentInfo() {
	}

	/** minimal constructor */
	public DepartmentInfo(BranchInfo branchInfo, Timestamp departmentFoundedTime) {
		this.branchInfo = branchInfo;
		this.departmentFoundedTime = departmentFoundedTime;
	}

	/** full constructor */
	public DepartmentInfo(BranchInfo branchInfo, String departmentName,
			Timestamp departmentFoundedTime, Integer departmentAvai,
			String departmentIntr, Set positionInfos) {
		this.branchInfo = branchInfo;
		this.departmentName = departmentName;
		this.departmentFoundedTime = departmentFoundedTime;
		this.departmentAvai = departmentAvai;
		this.departmentIntr = departmentIntr;
		this.positionInfos = positionInfos;
	}

	// Property accessors

	public Integer getDepartmentId() {
		return this.departmentId;
	}

	public void setDepartmentId(Integer departmentId) {
		this.departmentId = departmentId;
	}

	public BranchInfo getBranchInfo() {
		return this.branchInfo;
	}

	public void setBranchInfo(BranchInfo branchInfo) {
		this.branchInfo = branchInfo;
	}

	public String getDepartmentName() {
		return this.departmentName;
	}

	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}

	public Timestamp getDepartmentFoundedTime() {
		return this.departmentFoundedTime;
	}

	public void setDepartmentFoundedTime(Timestamp departmentFoundedTime) {
		this.departmentFoundedTime = departmentFoundedTime;
	}

	public Integer getDepartmentAvai() {
		return this.departmentAvai;
	}

	public void setDepartmentAvai(Integer departmentAvai) {
		this.departmentAvai = departmentAvai;
	}

	public String getDepartmentIntr() {
		return this.departmentIntr;
	}

	public void setDepartmentIntr(String departmentIntr) {
		this.departmentIntr = departmentIntr;
	}

	public Set getPositionInfos() {
		return this.positionInfos;
	}

	public void setPositionInfos(Set positionInfos) {
		this.positionInfos = positionInfos;
	}

}