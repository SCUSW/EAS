package com.scusw.model;

import java.util.HashSet;
import java.util.Set;

/**
 * RegisterInfo entity. @author MyEclipse Persistence Tools
 */

public class RegisterInfo implements java.io.Serializable {

	// Fields

	private Integer registerId;
	private StudentInfo studentInfo;
	private CourseInfo courseInfo;
	private Float studentCourseScore;
	private Set studentAttendants = new HashSet(0);

	// Constructors

	/** default constructor */
	public RegisterInfo() {
	}

	/** full constructor */
	public RegisterInfo(StudentInfo studentInfo, CourseInfo courseInfo,
			Float studentCourseScore, Set studentAttendants) {
		this.studentInfo = studentInfo;
		this.courseInfo = courseInfo;
		this.studentCourseScore = studentCourseScore;
		this.studentAttendants = studentAttendants;
	}

	// Property accessors

	public Integer getRegisterId() {
		return this.registerId;
	}

	public void setRegisterId(Integer registerId) {
		this.registerId = registerId;
	}

	public StudentInfo getStudentInfo() {
		return this.studentInfo;
	}

	public void setStudentInfo(StudentInfo studentInfo) {
		this.studentInfo = studentInfo;
	}

	public CourseInfo getCourseInfo() {
		return this.courseInfo;
	}

	public void setCourseInfo(CourseInfo courseInfo) {
		this.courseInfo = courseInfo;
	}

	public Float getStudentCourseScore() {
		return this.studentCourseScore;
	}

	public void setStudentCourseScore(Float studentCourseScore) {
		this.studentCourseScore = studentCourseScore;
	}

	public Set getStudentAttendants() {
		return this.studentAttendants;
	}

	public void setStudentAttendants(Set studentAttendants) {
		this.studentAttendants = studentAttendants;
	}

}