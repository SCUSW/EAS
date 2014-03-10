package com.scusw.model;

import java.util.HashSet;
import java.util.Set;

/**
 * TeacherInfo entity. @author MyEclipse Persistence Tools
 */

public class TeacherInfo implements java.io.Serializable {

	// Fields

	private Integer staffId;
	private TeacherLevel teacherLevel;
	private StaffInfo staffInfo;
	private String teacherNo;
	private String teacherMajor;
	private String teacherGraduate;
	private Float teacherSalary;
	private Integer teacherType;
	private String teacherRemark;
	private Set courseInfos = new HashSet(0);

	// Constructors

	/** default constructor */
	public TeacherInfo() {
	}

	/** minimal constructor */
	public TeacherInfo(Integer staffId, StaffInfo staffInfo) {
		this.staffId = staffId;
		this.staffInfo = staffInfo;
	}

	/** full constructor */
	public TeacherInfo(Integer staffId, TeacherLevel teacherLevel,
			StaffInfo staffInfo, String teacherNo, String teacherMajor,
			String teacherGraduate, Float teacherSalary, Integer teacherType,
			String teacherRemark, Set courseInfos) {
		this.staffId = staffId;
		this.teacherLevel = teacherLevel;
		this.staffInfo = staffInfo;
		this.teacherNo = teacherNo;
		this.teacherMajor = teacherMajor;
		this.teacherGraduate = teacherGraduate;
		this.teacherSalary = teacherSalary;
		this.teacherType = teacherType;
		this.teacherRemark = teacherRemark;
		this.courseInfos = courseInfos;
	}

	// Property accessors

	public Integer getStaffId() {
		return this.staffId;
	}

	public void setStaffId(Integer staffId) {
		this.staffId = staffId;
	}

	public TeacherLevel getTeacherLevel() {
		return this.teacherLevel;
	}

	public void setTeacherLevel(TeacherLevel teacherLevel) {
		this.teacherLevel = teacherLevel;
	}

	public StaffInfo getStaffInfo() {
		return this.staffInfo;
	}

	public void setStaffInfo(StaffInfo staffInfo) {
		this.staffInfo = staffInfo;
	}

	public String getTeacherNo() {
		return this.teacherNo;
	}

	public void setTeacherNo(String teacherNo) {
		this.teacherNo = teacherNo;
	}

	public String getTeacherMajor() {
		return this.teacherMajor;
	}

	public void setTeacherMajor(String teacherMajor) {
		this.teacherMajor = teacherMajor;
	}

	public String getTeacherGraduate() {
		return this.teacherGraduate;
	}

	public void setTeacherGraduate(String teacherGraduate) {
		this.teacherGraduate = teacherGraduate;
	}

	public Float getTeacherSalary() {
		return this.teacherSalary;
	}

	public void setTeacherSalary(Float teacherSalary) {
		this.teacherSalary = teacherSalary;
	}

	public Integer getTeacherType() {
		return this.teacherType;
	}

	public void setTeacherType(Integer teacherType) {
		this.teacherType = teacherType;
	}

	public String getTeacherRemark() {
		return this.teacherRemark;
	}

	public void setTeacherRemark(String teacherRemark) {
		this.teacherRemark = teacherRemark;
	}

	public Set getCourseInfos() {
		return this.courseInfos;
	}

	public void setCourseInfos(Set courseInfos) {
		this.courseInfos = courseInfos;
	}

}