package com.scusw.model;

import java.util.HashSet;
import java.util.Set;

/**
 * TeacherLevel entity. @author MyEclipse Persistence Tools
 */

public class TeacherLevel implements java.io.Serializable {

	// Fields

	private Integer levelId;
	private String levelName;
	private Integer baseClassHour;
	private Float classCost;
	private Integer levelAvai;
	private String levelRemark;
	private Set teacherInfos = new HashSet(0);

	// Constructors

	/** default constructor */
	public TeacherLevel() {
	}

	/** full constructor */
	public TeacherLevel(String levelName, Integer baseClassHour,
			Float classCost, Integer levelAvai, String levelRemark,
			Set teacherInfos) {
		this.levelName = levelName;
		this.baseClassHour = baseClassHour;
		this.classCost = classCost;
		this.levelAvai = levelAvai;
		this.levelRemark = levelRemark;
		this.teacherInfos = teacherInfos;
	}

	// Property accessors

	public Integer getLevelId() {
		return this.levelId;
	}

	public void setLevelId(Integer levelId) {
		this.levelId = levelId;
	}

	public String getLevelName() {
		return this.levelName;
	}

	public void setLevelName(String levelName) {
		this.levelName = levelName;
	}

	public Integer getBaseClassHour() {
		return this.baseClassHour;
	}

	public void setBaseClassHour(Integer baseClassHour) {
		this.baseClassHour = baseClassHour;
	}

	public Float getClassCost() {
		return this.classCost;
	}

	public void setClassCost(Float classCost) {
		this.classCost = classCost;
	}

	public Integer getLevelAvai() {
		return this.levelAvai;
	}

	public void setLevelAvai(Integer levelAvai) {
		this.levelAvai = levelAvai;
	}

	public String getLevelRemark() {
		return this.levelRemark;
	}

	public void setLevelRemark(String levelRemark) {
		this.levelRemark = levelRemark;
	}

	public Set getTeacherInfos() {
		return this.teacherInfos;
	}

	public void setTeacherInfos(Set teacherInfos) {
		this.teacherInfos = teacherInfos;
	}

}