package com.scusw.model;

/**
 * GroupPrivilege entity. @author MyEclipse Persistence Tools
 */

public class GroupPrivilege implements java.io.Serializable {

	// Fields

	private Integer groupPrivilegeId;
	private PrivilegeInfo privilegeInfo;
	private GroupInfo groupInfo;

	// Constructors

	/** default constructor */
	public GroupPrivilege() {
	}

	/** full constructor */
	public GroupPrivilege(PrivilegeInfo privilegeInfo, GroupInfo groupInfo) {
		this.privilegeInfo = privilegeInfo;
		this.groupInfo = groupInfo;
	}

	// Property accessors

	public Integer getGroupPrivilegeId() {
		return this.groupPrivilegeId;
	}

	public void setGroupPrivilegeId(Integer groupPrivilegeId) {
		this.groupPrivilegeId = groupPrivilegeId;
	}

	public PrivilegeInfo getPrivilegeInfo() {
		return this.privilegeInfo;
	}

	public void setPrivilegeInfo(PrivilegeInfo privilegeInfo) {
		this.privilegeInfo = privilegeInfo;
	}

	public GroupInfo getGroupInfo() {
		return this.groupInfo;
	}

	public void setGroupInfo(GroupInfo groupInfo) {
		this.groupInfo = groupInfo;
	}

}