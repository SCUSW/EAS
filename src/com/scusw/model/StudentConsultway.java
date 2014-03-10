package com.scusw.model;

/**
 * StudentConsultway entity. @author MyEclipse Persistence Tools
 */

public class StudentConsultway implements java.io.Serializable {

	// Fields

	private Integer studentConsultwayId;
	private ConsultInfo consultInfo;
	private ConsultwayInfo consultwayInfo;

	// Constructors

	/** default constructor */
	public StudentConsultway() {
	}

	/** full constructor */
	public StudentConsultway(ConsultInfo consultInfo,
			ConsultwayInfo consultwayInfo) {
		this.consultInfo = consultInfo;
		this.consultwayInfo = consultwayInfo;
	}

	// Property accessors

	public Integer getStudentConsultwayId() {
		return this.studentConsultwayId;
	}

	public void setStudentConsultwayId(Integer studentConsultwayId) {
		this.studentConsultwayId = studentConsultwayId;
	}

	public ConsultInfo getConsultInfo() {
		return this.consultInfo;
	}

	public void setConsultInfo(ConsultInfo consultInfo) {
		this.consultInfo = consultInfo;
	}

	public ConsultwayInfo getConsultwayInfo() {
		return this.consultwayInfo;
	}

	public void setConsultwayInfo(ConsultwayInfo consultwayInfo) {
		this.consultwayInfo = consultwayInfo;
	}

}