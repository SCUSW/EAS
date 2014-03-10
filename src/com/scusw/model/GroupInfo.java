package com.scusw.model;

import java.util.HashSet;
import java.util.Set;

/**
 * GroupInfo entity. @author MyEclipse Persistence Tools
 */

public class GroupInfo implements java.io.Serializable {

	// Fields

	private Integer groupId;
	private String groupName;
	private Integer groupAvai;
	private String groupRemark;
	private Set studentInfos = new HashSet(0);
	private Set groupPrivileges = new HashSet(0);
	private Set staffInfos = new HashSet(0);

	// Constructors

	/** default constructor */
	public GroupInfo() {
	}

	/** full constructor */
	public GroupInfo(String groupName, Integer groupAvai, String groupRemark,
			Set studentInfos, Set groupPrivileges, Set staffInfos) {
		this.groupName = groupName;
		this.groupAvai = groupAvai;
		this.groupRemark = groupRemark;
		this.studentInfos = studentInfos;
		this.groupPrivileges = groupPrivileges;
		this.staffInfos = staffInfos;
	}

	// Property accessors

	public Integer getGroupId() {
		return this.groupId;
	}

	public void setGroupId(Integer groupId) {
		this.groupId = groupId;
	}

	public String getGroupName() {
		return this.groupName;
	}

	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}

	public Integer getGroupAvai() {
		return this.groupAvai;
	}

	public void setGroupAvai(Integer groupAvai) {
		this.groupAvai = groupAvai;
	}

	public String getGroupRemark() {
		return this.groupRemark;
	}

	public void setGroupRemark(String groupRemark) {
		this.groupRemark = groupRemark;
	}

	public Set getStudentInfos() {
		return this.studentInfos;
	}

	public void setStudentInfos(Set studentInfos) {
		this.studentInfos = studentInfos;
	}

	public Set getGroupPrivileges() {
		return this.groupPrivileges;
	}

	public void setGroupPrivileges(Set groupPrivileges) {
		this.groupPrivileges = groupPrivileges;
	}

	public Set getStaffInfos() {
		return this.staffInfos;
	}

	public void setStaffInfos(Set staffInfos) {
		this.staffInfos = staffInfos;
	}

}