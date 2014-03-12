package com.scusw.model;

import java.sql.Timestamp;

/**
 * StudentFees entity. @author MyEclipse Persistence Tools
 */

public class StudentFees implements java.io.Serializable {

	// Fields

	private Integer feesId;
	private StudentInfo studentInfo;
	private Float feesNum;
	private Timestamp feesTime;
	private String feesFor;

	// Constructors

	/** default constructor */
	public StudentFees() {
	}

	/** minimal constructor */
	public StudentFees(Timestamp feesTime) {
		this.feesTime = feesTime;
	}

	/** full constructor */
	public StudentFees(StudentInfo studentInfo, Float feesNum,
			Timestamp feesTime, String feesFor) {
		this.studentInfo = studentInfo;
		this.feesNum = feesNum;
		this.feesTime = feesTime;
		this.feesFor = feesFor;
	}

	// Property accessors

	public Integer getFeesId() {
		return this.feesId;
	}

	public void setFeesId(Integer feesId) {
		this.feesId = feesId;
	}

	public StudentInfo getStudentInfo() {
		return this.studentInfo;
	}

	public void setStudentInfo(StudentInfo studentInfo) {
		this.studentInfo = studentInfo;
	}

	public Float getFeesNum() {
		return this.feesNum;
	}

	public void setFeesNum(Float feesNum) {
		this.feesNum = feesNum;
	}

	public Timestamp getFeesTime() {
		return this.feesTime;
	}

	public void setFeesTime(Timestamp feesTime) {
		this.feesTime = feesTime;
	}

	public String getFeesFor() {
		return this.feesFor;
	}

	public void setFeesFor(String feesFor) {
		this.feesFor = feesFor;
	}

}