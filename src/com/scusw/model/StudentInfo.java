package com.scusw.model;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

/**
 * StudentInfo entity. @author MyEclipse Persistence Tools
 */

public class StudentInfo implements java.io.Serializable {

	// Fields

	private Integer studentId;
	private RollState rollState;
	private GroupInfo groupInfo;
	private ClassInfo classInfo;
	private ConsultInfo consultInfo;
	private String studentPass;
	private String studentNo;
	private String studentName;
	private Integer studentSex;
	private Integer studentAge;
	private String studentAddr;
	private String studentPhone;
	private Float studentBalance;
	private String studentSchool;
	private String studentMajor;
	private Timestamp attendTime;
	private Integer studentState;
	private String studentRemark;
	private Set registerInfos = new HashSet(0);

	// Constructors

	/** default constructor */
	public StudentInfo() {
	}

	/** minimal constructor */
	public StudentInfo(String studentPass, Timestamp attendTime) {
		this.studentPass = studentPass;
		this.attendTime = attendTime;
	}

	/** full constructor */
	public StudentInfo(RollState rollState, GroupInfo groupInfo,
			ClassInfo classInfo, ConsultInfo consultInfo, String studentPass,
			String studentNo, String studentName, Integer studentSex,
			Integer studentAge, String studentAddr, String studentPhone,
			Float studentBalance, String studentSchool, String studentMajor,
			Timestamp attendTime, Integer studentState, String studentRemark,
			Set registerInfos) {
		this.rollState = rollState;
		this.groupInfo = groupInfo;
		this.classInfo = classInfo;
		this.consultInfo = consultInfo;
		this.studentPass = studentPass;
		this.studentNo = studentNo;
		this.studentName = studentName;
		this.studentSex = studentSex;
		this.studentAge = studentAge;
		this.studentAddr = studentAddr;
		this.studentPhone = studentPhone;
		this.studentBalance = studentBalance;
		this.studentSchool = studentSchool;
		this.studentMajor = studentMajor;
		this.attendTime = attendTime;
		this.studentState = studentState;
		this.studentRemark = studentRemark;
		this.registerInfos = registerInfos;
	}

	// Property accessors

	public Integer getStudentId() {
		return this.studentId;
	}

	public void setStudentId(Integer studentId) {
		this.studentId = studentId;
	}

	public RollState getRollState() {
		return this.rollState;
	}

	public void setRollState(RollState rollState) {
		this.rollState = rollState;
	}

	public GroupInfo getGroupInfo() {
		return this.groupInfo;
	}

	public void setGroupInfo(GroupInfo groupInfo) {
		this.groupInfo = groupInfo;
	}

	public ClassInfo getClassInfo() {
		return this.classInfo;
	}

	public void setClassInfo(ClassInfo classInfo) {
		this.classInfo = classInfo;
	}

	public ConsultInfo getConsultInfo() {
		return this.consultInfo;
	}

	public void setConsultInfo(ConsultInfo consultInfo) {
		this.consultInfo = consultInfo;
	}

	public String getStudentPass() {
		return this.studentPass;
	}

	public void setStudentPass(String studentPass) {
		this.studentPass = studentPass;
	}

	public String getStudentNo() {
		return this.studentNo;
	}

	public void setStudentNo(String studentNo) {
		this.studentNo = studentNo;
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

	public Float getStudentBalance() {
		return this.studentBalance;
	}

	public void setStudentBalance(Float studentBalance) {
		this.studentBalance = studentBalance;
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

	public Timestamp getAttendTime() {
		return this.attendTime;
	}

	public void setAttendTime(Timestamp attendTime) {
		this.attendTime = attendTime;
	}

	public Integer getStudentState() {
		return this.studentState;
	}

	public void setStudentState(Integer studentState) {
		this.studentState = studentState;
	}

	public String getStudentRemark() {
		return this.studentRemark;
	}

	public void setStudentRemark(String studentRemark) {
		this.studentRemark = studentRemark;
	}

	public Set getRegisterInfos() {
		return this.registerInfos;
	}

	public void setRegisterInfos(Set registerInfos) {
		this.registerInfos = registerInfos;
	}

}