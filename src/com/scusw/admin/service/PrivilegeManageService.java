package com.scusw.admin.service;

import java.util.ArrayList;
import java.util.List;

import com.scusw.model.GroupInfo;
import com.scusw.model.GroupPrivilege;
import com.scusw.model.PrivilegeInfo;

/**
 * interface of management of privilege
 * @author liu jiahao
 *
 */
public interface PrivilegeManageService {
	
	// interface to query all info of privileges
	public List<PrivilegeInfo> queryAllPrivilege();
	
	// interface to add a record of privilege
	public boolean addPrivilege(PrivilegeInfo privInfo);
	
	// interface to query all info of groups
	public List<GroupInfo> queryAllGroup();
	
	// interface to add a record of group
	public boolean addGroup(GroupInfo groupInfo);
	
	// add groupprivilege
	public boolean addGroupPrivilege(GroupInfo groupInfo,int[] privileges);
	
	// update groupPrivilege
	public boolean updateGroupPrivilege(GroupInfo groupInfo,int[] privileges);
	
	// interface to get group privileges by groupId
	public List<PrivilegeInfo> queryPrivilegeByGroupId(int groupId);
	
	// get group by Id
	public GroupInfo getGroupById(int groupId);
	
	// delete group by Id (actually to make it unavailable we use updateGroup)
	public boolean delGroup(GroupInfo groupInfo);
	
	// delete groupPrivilege by groupId
	public boolean delGroupPrivilege(GroupPrivilege gp);
	
	// update group
	public boolean updateGroup(GroupInfo groupInfo);
	
}
