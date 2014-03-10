package com.scusw.model;

import java.util.HashSet;
import java.util.Set;

/**
 * RollState entity. @author MyEclipse Persistence Tools
 */

public class RollState implements java.io.Serializable {

	// Fields

	private Integer rollstateId;
	private String rollstateName;
	private String rollstateIntr;
	private Set studentInfos = new HashSet(0);

	// Constructors

	/** default constructor */
	public RollState() {
	}

	/** full constructor */
	public RollState(String rollstateName, String rollstateIntr,
			Set studentInfos) {
		this.rollstateName = rollstateName;
		this.rollstateIntr = rollstateIntr;
		this.studentInfos = studentInfos;
	}

	// Property accessors

	public Integer getRollstateId() {
		return this.rollstateId;
	}

	public void setRollstateId(Integer rollstateId) {
		this.rollstateId = rollstateId;
	}

	public String getRollstateName() {
		return this.rollstateName;
	}

	public void setRollstateName(String rollstateName) {
		this.rollstateName = rollstateName;
	}

	public String getRollstateIntr() {
		return this.rollstateIntr;
	}

	public void setRollstateIntr(String rollstateIntr) {
		this.rollstateIntr = rollstateIntr;
	}

	public Set getStudentInfos() {
		return this.studentInfos;
	}

	public void setStudentInfos(Set studentInfos) {
		this.studentInfos = studentInfos;
	}

}