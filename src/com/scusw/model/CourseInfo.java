package com.scusw.model;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * CourseInfo entity. @author MyEclipse Persistence Tools
 */

public class CourseInfo implements java.io.Serializable {

	// Fields

	private Integer courseId;
	private TeacherInfo teacherInfo;
	private MajorInfo majorInfo;
	private String courseName;
	private Date courseStart;
	private Date courseEnd;
	private Float coursePrice;
	private Integer courseTimes;
	private Integer courseAvai;
	private String courseDesc;
	private Set registerInfos = new HashSet(0);
	private Set courseClasshours = new HashSet(0);
	private Set teachingManageInfos = new HashSet(0);

	// Constructors

	/** default constructor */
	public CourseInfo() {
	}

	/** full constructor */
	public CourseInfo(TeacherInfo teacherInfo, MajorInfo majorInfo,
			String courseName, Date courseStart, Date courseEnd,
			Float coursePrice, Integer courseTimes, Integer courseAvai,
			String courseDesc, Set registerInfos, Set courseClasshours,
			Set teachingManageInfos) {
		this.teacherInfo = teacherInfo;
		this.majorInfo = majorInfo;
		this.courseName = courseName;
		this.courseStart = courseStart;
		this.courseEnd = courseEnd;
		this.coursePrice = coursePrice;
		this.courseTimes = courseTimes;
		this.courseAvai = courseAvai;
		this.courseDesc = courseDesc;
		this.registerInfos = registerInfos;
		this.courseClasshours = courseClasshours;
		this.teachingManageInfos = teachingManageInfos;
	}

	// Property accessors

	public Integer getCourseId() {
		return this.courseId;
	}

	public void setCourseId(Integer courseId) {
		this.courseId = courseId;
	}

	public TeacherInfo getTeacherInfo() {
		return this.teacherInfo;
	}

	public void setTeacherInfo(TeacherInfo teacherInfo) {
		this.teacherInfo = teacherInfo;
	}

	public MajorInfo getMajorInfo() {
		return this.majorInfo;
	}

	public void setMajorInfo(MajorInfo majorInfo) {
		this.majorInfo = majorInfo;
	}

	public String getCourseName() {
		return this.courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

	public Date getCourseStart() {
		return this.courseStart;
	}

	public void setCourseStart(Date courseStart) {
		this.courseStart = courseStart;
	}

	public Date getCourseEnd() {
		return this.courseEnd;
	}

	public void setCourseEnd(Date courseEnd) {
		this.courseEnd = courseEnd;
	}

	public Float getCoursePrice() {
		return this.coursePrice;
	}

	public void setCoursePrice(Float coursePrice) {
		this.coursePrice = coursePrice;
	}

	public Integer getCourseTimes() {
		return this.courseTimes;
	}

	public void setCourseTimes(Integer courseTimes) {
		this.courseTimes = courseTimes;
	}

	public Integer getCourseAvai() {
		return this.courseAvai;
	}

	public void setCourseAvai(Integer courseAvai) {
		this.courseAvai = courseAvai;
	}

	public String getCourseDesc() {
		return this.courseDesc;
	}

	public void setCourseDesc(String courseDesc) {
		this.courseDesc = courseDesc;
	}

	public Set getRegisterInfos() {
		return this.registerInfos;
	}

	public void setRegisterInfos(Set registerInfos) {
		this.registerInfos = registerInfos;
	}

	public Set getCourseClasshours() {
		return this.courseClasshours;
	}

	public void setCourseClasshours(Set courseClasshours) {
		this.courseClasshours = courseClasshours;
	}

	public Set getTeachingManageInfos() {
		return this.teachingManageInfos;
	}

	public void setTeachingManageInfos(Set teachingManageInfos) {
		this.teachingManageInfos = teachingManageInfos;
	}

}