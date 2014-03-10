package com.scusw.model;

import java.util.HashSet;
import java.util.Set;

/**
 * PrivilegeInfo entity. @author MyEclipse Persistence Tools
 */

public class PrivilegeInfo implements java.io.Serializable {

	// Fields

	private Integer privilegeId;
	private String privilegeName;
	private String privilegeDesc;
	private Set groupPrivileges = new HashSet(0);

	// Constructors

	/** default constructor */
	public PrivilegeInfo() {
	}

	/** full constructor */
	public PrivilegeInfo(String privilegeName, String privilegeDesc,
			Set groupPrivileges) {
		this.privilegeName = privilegeName;
		this.privilegeDesc = privilegeDesc;
		this.groupPrivileges = groupPrivileges;
	}

	// Property accessors

	public Integer getPrivilegeId() {
		return this.privilegeId;
	}

	public void setPrivilegeId(Integer privilegeId) {
		this.privilegeId = privilegeId;
	}

	public String getPrivilegeName() {
		return this.privilegeName;
	}

	public void setPrivilegeName(String privilegeName) {
		this.privilegeName = privilegeName;
	}

	public String getPrivilegeDesc() {
		return this.privilegeDesc;
	}

	public void setPrivilegeDesc(String privilegeDesc) {
		this.privilegeDesc = privilegeDesc;
	}

	public Set getGroupPrivileges() {
		return this.groupPrivileges;
	}

	public void setGroupPrivileges(Set groupPrivileges) {
		this.groupPrivileges = groupPrivileges;
	}

}