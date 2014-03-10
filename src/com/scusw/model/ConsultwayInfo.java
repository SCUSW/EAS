package com.scusw.model;

import java.util.HashSet;
import java.util.Set;

/**
 * ConsultwayInfo entity. @author MyEclipse Persistence Tools
 */

public class ConsultwayInfo implements java.io.Serializable {

	// Fields

	private Integer consultwayId;
	private String consultwayName;
	private Set studentConsultwaies = new HashSet(0);

	// Constructors

	/** default constructor */
	public ConsultwayInfo() {
	}

	/** full constructor */
	public ConsultwayInfo(String consultwayName, Set studentConsultwaies) {
		this.consultwayName = consultwayName;
		this.studentConsultwaies = studentConsultwaies;
	}

	// Property accessors

	public Integer getConsultwayId() {
		return this.consultwayId;
	}

	public void setConsultwayId(Integer consultwayId) {
		this.consultwayId = consultwayId;
	}

	public String getConsultwayName() {
		return this.consultwayName;
	}

	public void setConsultwayName(String consultwayName) {
		this.consultwayName = consultwayName;
	}

	public Set getStudentConsultwaies() {
		return this.studentConsultwaies;
	}

	public void setStudentConsultwaies(Set studentConsultwaies) {
		this.studentConsultwaies = studentConsultwaies;
	}

}