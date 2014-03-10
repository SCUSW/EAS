package com.scusw.model;

import java.util.HashSet;
import java.util.Set;

/**
 * ClassInfo entity. @author MyEclipse Persistence Tools
 */

public class ClassInfo implements java.io.Serializable {

	// Fields

	private Integer classId;
	private GradeInfo gradeInfo;
	private String className;
	private Integer classAvai;
	private Set checkInfos = new HashSet(0);
	private Set studentInfos = new HashSet(0);

	// Constructors

	/** default constructor */
	public ClassInfo() {
	}

	/** full constructor */
	public ClassInfo(GradeInfo gradeInfo, String className, Integer classAvai,
			Set checkInfos, Set studentInfos) {
		this.gradeInfo = gradeInfo;
		this.className = className;
		this.classAvai = classAvai;
		this.checkInfos = checkInfos;
		this.studentInfos = studentInfos;
	}

	// Property accessors

	public Integer getClassId() {
		return this.classId;
	}

	public void setClassId(Integer classId) {
		this.classId = classId;
	}

	public GradeInfo getGradeInfo() {
		return this.gradeInfo;
	}

	public void setGradeInfo(GradeInfo gradeInfo) {
		this.gradeInfo = gradeInfo;
	}

	public String getClassName() {
		return this.className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

	public Integer getClassAvai() {
		return this.classAvai;
	}

	public void setClassAvai(Integer classAvai) {
		this.classAvai = classAvai;
	}

	public Set getCheckInfos() {
		return this.checkInfos;
	}

	public void setCheckInfos(Set checkInfos) {
		this.checkInfos = checkInfos;
	}

	public Set getStudentInfos() {
		return this.studentInfos;
	}

	public void setStudentInfos(Set studentInfos) {
		this.studentInfos = studentInfos;
	}

}