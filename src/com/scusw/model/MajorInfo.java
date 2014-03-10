package com.scusw.model;

import java.util.HashSet;
import java.util.Set;

/**
 * MajorInfo entity. @author MyEclipse Persistence Tools
 */

public class MajorInfo implements java.io.Serializable {

	// Fields

	private Integer majorId;
	private String majorName;
	private String majorIntr;
	private Integer majorAvai;
	private Set courseInfos = new HashSet(0);

	// Constructors

	/** default constructor */
	public MajorInfo() {
	}

	/** full constructor */
	public MajorInfo(String majorName, String majorIntr, Integer majorAvai,
			Set courseInfos) {
		this.majorName = majorName;
		this.majorIntr = majorIntr;
		this.majorAvai = majorAvai;
		this.courseInfos = courseInfos;
	}

	// Property accessors

	public Integer getMajorId() {
		return this.majorId;
	}

	public void setMajorId(Integer majorId) {
		this.majorId = majorId;
	}

	public String getMajorName() {
		return this.majorName;
	}

	public void setMajorName(String majorName) {
		this.majorName = majorName;
	}

	public String getMajorIntr() {
		return this.majorIntr;
	}

	public void setMajorIntr(String majorIntr) {
		this.majorIntr = majorIntr;
	}

	public Integer getMajorAvai() {
		return this.majorAvai;
	}

	public void setMajorAvai(Integer majorAvai) {
		this.majorAvai = majorAvai;
	}

	public Set getCourseInfos() {
		return this.courseInfos;
	}

	public void setCourseInfos(Set courseInfos) {
		this.courseInfos = courseInfos;
	}

}