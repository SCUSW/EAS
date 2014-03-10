package com.scusw.model;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

/**
 * ConsultInfo entity. @author MyEclipse Persistence Tools
 */

public class ConsultInfo implements java.io.Serializable {

	// Fields

	private Integer consultId;
	private SalesmanInfo salesmanInfo;
	private String studentName;
	private Integer studentSex;
	private Integer studentAge;
	private String studentAddr;
	private String studentPhone;
	private String studentSchool;
	private String studentMajor;
	private String consultType;
	private Timestamp consultTime;
	private String studentRemark;
	private Set studentInfos = new HashSet(0);
	private Set studentConsultwaies = new HashSet(0);

	// Constructors

	/** default constructor */
	public ConsultInfo() {
	}

	/** minimal constructor */
	public ConsultInfo(Timestamp consultTime) {
		this.consultTime = consultTime;
	}

	/** full constructor */
	public ConsultInfo(SalesmanInfo salesmanInfo, String studentName,
			Integer studentSex, Integer studentAge, String studentAddr,
			String studentPhone, String studentSchool, String studentMajor,
			String consultType, Timestamp consultTime, String studentRemark,
			Set studentInfos, Set studentConsultwaies) {
		this.salesmanInfo = salesmanInfo;
		this.studentName = studentName;
		this.studentSex = studentSex;
		this.studentAge = studentAge;
		this.studentAddr = studentAddr;
		this.studentPhone = studentPhone;
		this.studentSchool = studentSchool;
		this.studentMajor = studentMajor;
		this.consultType = consultType;
		this.consultTime = consultTime;
		this.studentRemark = studentRemark;
		this.studentInfos = studentInfos;
		this.studentConsultwaies = studentConsultwaies;
	}

	// Property accessors

	public Integer getConsultId() {
		return this.consultId;
	}

	public void setConsultId(Integer consultId) {
		this.consultId = consultId;
	}

	public SalesmanInfo getSalesmanInfo() {
		return this.salesmanInfo;
	}

	public void setSalesmanInfo(SalesmanInfo salesmanInfo) {
		this.salesmanInfo = salesmanInfo;
	}

	public String getStudentName() {
		return this.studentName;
	}

	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}

	public Integer getStudentSex() {
		return this.studentSex;
	}

	public void setStudentSex(Integer studentSex) {
		this.studentSex = studentSex;
	}

	public Integer getStudentAge() {
		return this.studentAge;
	}

	public void setStudentAge(Integer studentAge) {
		this.studentAge = studentAge;
	}

	public String getStudentAddr() {
		return this.studentAddr;
	}

	public void setStudentAddr(String studentAddr) {
		this.studentAddr = studentAddr;
	}

	public String getStudentPhone() {
		return this.studentPhone;
	}

	public void setStudentPhone(String studentPhone) {
		this.studentPhone = studentPhone;
	}

	public String getStudentSchool() {
		return this.studentSchool;
	}

	public void setStudentSchool(String studentSchool) {
		this.studentSchool = studentSchool;
	}

	public String getStudentMajor() {
		return this.studentMajor;
	}

	public void setStudentMajor(String studentMajor) {
		this.studentMajor = studentMajor;
	}

	public String getConsultType() {
		return this.consultType;
	}

	public void setConsultType(String consultType) {
		this.consultType = consultType;
	}

	public Timestamp getConsultTime() {
		return this.consultTime;
	}

	public void setConsultTime(Timestamp consultTime) {
		this.consultTime = consultTime;
	}

	public String getStudentRemark() {
		return this.studentRemark;
	}

	public void setStudentRemark(String studentRemark) {
		this.studentRemark = studentRemark;
	}

	public Set getStudentInfos() {
		return this.studentInfos;
	}

	public void setStudentInfos(Set studentInfos) {
		this.studentInfos = studentInfos;
	}

	public Set getStudentConsultwaies() {
		return this.studentConsultwaies;
	}

	public void setStudentConsultwaies(Set studentConsultwaies) {
		this.studentConsultwaies = studentConsultwaies;
	}

}