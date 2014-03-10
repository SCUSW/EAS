package com.scusw.model;

import java.sql.Time;
import java.util.HashSet;
import java.util.Set;

/**
 * ClasshourInfo entity. @author MyEclipse Persistence Tools
 */

public class ClasshourInfo implements java.io.Serializable {

	// Fields

	private Integer classhourId;
	private Time classhourStart;
	private Time classhourEnd;
	private Integer classhourAvai;
	private Set courseClasshours = new HashSet(0);

	// Constructors

	/** default constructor */
	public ClasshourInfo() {
	}

	/** full constructor */
	public ClasshourInfo(Time classhourStart, Time classhourEnd,
			Integer classhourAvai, Set courseClasshours) {
		this.classhourStart = classhourStart;
		this.classhourEnd = classhourEnd;
		this.classhourAvai = classhourAvai;
		this.courseClasshours = courseClasshours;
	}

	// Property accessors

	public Integer getClasshourId() {
		return this.classhourId;
	}

	public void setClasshourId(Integer classhourId) {
		this.classhourId = classhourId;
	}

	public Time getClasshourStart() {
		return this.classhourStart;
	}

	public void setClasshourStart(Time classhourStart) {
		this.classhourStart = classhourStart;
	}

	public Time getClasshourEnd() {
		return this.classhourEnd;
	}

	public void setClasshourEnd(Time classhourEnd) {
		this.classhourEnd = classhourEnd;
	}

	public Integer getClasshourAvai() {
		return this.classhourAvai;
	}

	public void setClasshourAvai(Integer classhourAvai) {
		this.classhourAvai = classhourAvai;
	}

	public Set getCourseClasshours() {
		return this.courseClasshours;
	}

	public void setCourseClasshours(Set courseClasshours) {
		this.courseClasshours = courseClasshours;
	}

}