package com.scusw.admin.dao;
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
public interface PrivilegeManageDao {
	
	// interface to query all privileges
	public List<PrivilegeInfo> queryAllPrivilege();
	
	// interface to add a record of privilege
	public boolean addPrivilege(PrivilegeInfo privInfo);
	
	// interface to query all info of groups
	public List<GroupInfo> queryAllGroup();
	
	// interface to add a record of group
//	public boolean addGroup(GroupInfo groupInfo);
//	public int addGroup(GroupInfo groupInfo);
	public boolean addGroup(GroupInfo groupInfo);
	

	// add groupprivilege
	public boolean addGroupPrivilege(GroupPrivilege gp);
	
	// get privileges by groupId.
	public List<PrivilegeInfo> queryPrivByGroupId(int GroupId);
	
	// get privilege by Id
	public PrivilegeInfo getPrivilegeInfoById(int privilegeId);
	
	// get group by Id
	public GroupInfo getGroupById(int groupId);
	
	// delete group by Id (actually to make it unavailable we use updateGroup)
	public boolean delGroupById(int groupId);
	
	// delete groupPrivilege by groupId
	public boolean delGroupPrivilege(GroupPrivilege gp);
	
	// update group
	public boolean updateGroup(GroupInfo groupInfo);
	
	// query GroupPrivilege By groupId
	public List<GroupPrivilege> queryGroupPrivlegeByGroupId(int groupId);
	
}
