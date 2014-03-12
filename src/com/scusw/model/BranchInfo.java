package com.scusw.model;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

/**
 * BranchInfo entity. @author MyEclipse Persistence Tools
 */

public class BranchInfo implements java.io.Serializable {

	// Fields

	private Integer branchId;
	private Timestamp branchFoundedTime;
	private String branchName;
	private Integer branchAvai;
	private String branchIntr;
	private Set gradeInfos = new HashSet(0);
	private Set financialRecordses = new HashSet(0);
	private Set departmentInfos = new HashSet(0);

	// Constructors

	/** default constructor */
	public BranchInfo() {
	}

	/** minimal constructor */
	public BranchInfo(Timestamp branchFoundedTime) {
		this.branchFoundedTime = branchFoundedTime;
	}

	/** full constructor */
	public BranchInfo(Timestamp branchFoundedTime, String branchName,
			Integer branchAvai, String branchIntr, Set gradeInfos,
			Set financialRecordses, Set departmentInfos) {
		this.branchFoundedTime = branchFoundedTime;
		this.branchName = branchName;
		this.branchAvai = branchAvai;
		this.branchIntr = branchIntr;
		this.gradeInfos = gradeInfos;
		this.financialRecordses = financialRecordses;
		this.departmentInfos = departmentInfos;
	}

	// Property accessors

	public Integer getBranchId() {
		return this.branchId;
	}

	public void setBranchId(Integer branchId) {
		this.branchId = branchId;
	}

	public Timestamp getBranchFoundedTime() {
		return this.branchFoundedTime;
	}

	public void setBranchFoundedTime(Timestamp branchFoundedTime) {
		this.branchFoundedTime = branchFoundedTime;
	}

	public String getBranchName() {
		return this.branchName;
	}

	public void setBranchName(String branchName) {
		this.branchName = branchName;
	}

	public Integer getBranchAvai() {
		return this.branchAvai;
	}

	public void setBranchAvai(Integer branchAvai) {
		this.branchAvai = branchAvai;
	}

	public String getBranchIntr() {
		return this.branchIntr;
	}

	public void setBranchIntr(String branchIntr) {
		this.branchIntr = branchIntr;
	}

	public Set getGradeInfos() {
		return this.gradeInfos;
	}

	public void setGradeInfos(Set gradeInfos) {
		this.gradeInfos = gradeInfos;
	}

	public Set getFinancialRecordses() {
		return this.financialRecordses;
	}

	public void setFinancialRecordses(Set financialRecordses) {
		this.financialRecordses = financialRecordses;
	}

	public Set getDepartmentInfos() {
		return this.departmentInfos;
	}

	public void setDepartmentInfos(Set departmentInfos) {
		this.departmentInfos = departmentInfos;
	}

}