package com.scusw.model;

import java.util.HashSet;
import java.util.Set;

/**
 * GradeInfo entity. @author MyEclipse Persistence Tools
 */

public class GradeInfo implements java.io.Serializable {

	// Fields

	private Integer gradeId;
	private BranchInfo branchInfo;
	private String gradeName;
	private Integer gradeAvai;
	private String gradeRemark;
	private Set classInfos = new HashSet(0);

	// Constructors

	/** default constructor */
	public GradeInfo() {
	}

	/** full constructor */
	public GradeInfo(BranchInfo branchInfo, String gradeName,
			Integer gradeAvai, String gradeRemark, Set classInfos) {
		this.branchInfo = branchInfo;
		this.gradeName = gradeName;
		this.gradeAvai = gradeAvai;
		this.gradeRemark = gradeRemark;
		this.classInfos = classInfos;
	}

	// Property accessors

	public Integer getGradeId() {
		return this.gradeId;
	}

	public void setGradeId(Integer gradeId) {
		this.gradeId = gradeId;
	}

	public BranchInfo getBranchInfo() {
		return this.branchInfo;
	}

	public void setBranchInfo(BranchInfo branchInfo) {
		this.branchInfo = branchInfo;
	}

	public String getGradeName() {
		return this.gradeName;
	}

	public void setGradeName(String gradeName) {
		this.gradeName = gradeName;
	}

	public Integer getGradeAvai() {
		return this.gradeAvai;
	}

	public void setGradeAvai(Integer gradeAvai) {
		this.gradeAvai = gradeAvai;
	}

	public String getGradeRemark() {
		return this.gradeRemark;
	}

	public void setGradeRemark(String gradeRemark) {
		this.gradeRemark = gradeRemark;
	}

	public Set getClassInfos() {
		return this.classInfos;
	}

	public void setClassInfos(Set classInfos) {
		this.classInfos = classInfos;
	}

}