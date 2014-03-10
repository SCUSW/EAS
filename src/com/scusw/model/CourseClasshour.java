package com.scusw.model;

/**
 * CourseClasshour entity. @author MyEclipse Persistence Tools
 */

public class CourseClasshour implements java.io.Serializable {

	// Fields

	private Integer courseClasshourId;
	private CourseInfo courseInfo;
	private ClasshourInfo classhourInfo;
	private ClassroomInfo classroomInfo;

	// Constructors

	/** default constructor */
	public CourseClasshour() {
	}

	/** full constructor */
	public CourseClasshour(CourseInfo courseInfo, ClasshourInfo classhourInfo,
			ClassroomInfo classroomInfo) {
		this.courseInfo = courseInfo;
		this.classhourInfo = classhourInfo;
		this.classroomInfo = classroomInfo;
	}

	// Property accessors

	public Integer getCourseClasshourId() {
		return this.courseClasshourId;
	}

	public void setCourseClasshourId(Integer courseClasshourId) {
		this.courseClasshourId = courseClasshourId;
	}

	public CourseInfo getCourseInfo() {
		return this.courseInfo;
	}

	public void setCourseInfo(CourseInfo courseInfo) {
		this.courseInfo = courseInfo;
	}

	public ClasshourInfo getClasshourInfo() {
		return this.classhourInfo;
	}

	public void setClasshourInfo(ClasshourInfo classhourInfo) {
		this.classhourInfo = classhourInfo;
	}

	public ClassroomInfo getClassroomInfo() {
		return this.classroomInfo;
	}

	public void setClassroomInfo(ClassroomInfo classroomInfo) {
		this.classroomInfo = classroomInfo;
	}

}