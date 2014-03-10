package com.scusw.model;

import java.sql.Timestamp;

/**
 * TeachingManageInfo entity. @author MyEclipse Persistence Tools
 */

public class TeachingManageInfo implements java.io.Serializable {

	// Fields

	private Integer teachingManageId;
	private CourseInfo courseInfo;
	private String teachPlan;
	private String lessonPlan;
	private String teacherSummary;
	private Integer examState;
	private Timestamp setTime;

	// Constructors

	/** default constructor */
	public TeachingManageInfo() {
	}

	/** minimal constructor */
	public TeachingManageInfo(Timestamp setTime) {
		this.setTime = setTime;
	}

	/** full constructor */
	public TeachingManageInfo(CourseInfo courseInfo, String teachPlan,
			String lessonPlan, String teacherSummary,int examState, Timestamp setTime) {
		this.courseInfo = courseInfo;
		this.teachPlan = teachPlan;
		this.lessonPlan = lessonPlan;
		this.teacherSummary = teacherSummary;
		this.examState = examState;
		this.setTime = setTime;
	}

	// Property accessors

	public Integer getTeachingManageId() {
		return this.teachingManageId;
	}

	public void setTeachingManageId(Integer teachingManageId) {
		this.teachingManageId = teachingManageId;
	}

	public CourseInfo getCourseInfo() {
		return this.courseInfo;
	}

	public void setCourseInfo(CourseInfo courseInfo) {
		this.courseInfo = courseInfo;
	}

	public String getTeachPlan() {
		return this.teachPlan;
	}

	public void setTeachPlan(String teachPlan) {
		this.teachPlan = teachPlan;
	}

	public String getLessonPlan() {
		return this.lessonPlan;
	}

	public void setLessonPlan(String lessonPlan) {
		this.lessonPlan = lessonPlan;
	}

	public String getTeacherSummary() {
		return this.teacherSummary;
	}

	public void setTeacherSummary(String teacherSummary) {
		this.teacherSummary = teacherSummary;
	}
	
	
	
	public Integer getExamState() {
		return examState;
	}

	public void setExamState(Integer examState) {
		this.examState = examState;
	}

	public Timestamp getSetTime() {
		return this.setTime;
	}

	public void setSetTime(Timestamp setTime) {
		this.setTime = setTime;
	}

}