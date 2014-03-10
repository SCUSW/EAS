package com.scusw.model;

import java.util.HashSet;
import java.util.Set;

/**
 * ClassroomInfo entity. @author MyEclipse Persistence Tools
 */

public class ClassroomInfo implements java.io.Serializable {

	// Fields

	private Integer classroomId;
	private String classroomAddr;
	private Boolean classroomAvai;
	private String classroomType;
	private Integer classroomCapacity;
	private String classroomRemark;
	private Set courseClasshours = new HashSet(0);

	// Constructors

	/** default constructor */
	public ClassroomInfo() {
	}

	/** full constructor */
	public ClassroomInfo(String classroomAddr, Boolean classroomAvai,
			String classroomType, Integer classroomCapacity,
			String classroomRemark, Set courseClasshours) {
		this.classroomAddr = classroomAddr;
		this.classroomAvai = classroomAvai;
		this.classroomType = classroomType;
		this.classroomCapacity = classroomCapacity;
		this.classroomRemark = classroomRemark;
		this.courseClasshours = courseClasshours;
	}

	// Property accessors

	public Integer getClassroomId() {
		return this.classroomId;
	}

	public void setClassroomId(Integer classroomId) {
		this.classroomId = classroomId;
	}

	public String getClassroomAddr() {
		return this.classroomAddr;
	}

	public void setClassroomAddr(String classroomAddr) {
		this.classroomAddr = classroomAddr;
	}

	public Boolean getClassroomAvai() {
		return this.classroomAvai;
	}

	public void setClassroomAvai(Boolean classroomAvai) {
		this.classroomAvai = classroomAvai;
	}

	public String getClassroomType() {
		return this.classroomType;
	}

	public void setClassroomType(String classroomType) {
		this.classroomType = classroomType;
	}

	public Integer getClassroomCapacity() {
		return this.classroomCapacity;
	}

	public void setClassroomCapacity(Integer classroomCapacity) {
		this.classroomCapacity = classroomCapacity;
	}

	public String getClassroomRemark() {
		return this.classroomRemark;
	}

	public void setClassroomRemark(String classroomRemark) {
		this.classroomRemark = classroomRemark;
	}

	public Set getCourseClasshours() {
		return this.courseClasshours;
	}

	public void setCourseClasshours(Set courseClasshours) {
		this.courseClasshours = courseClasshours;
	}

}