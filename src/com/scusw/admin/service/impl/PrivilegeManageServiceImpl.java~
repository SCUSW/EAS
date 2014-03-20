package com.scusw.admin.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;

import com.scusw.admin.action.PrivilegeManageAction;
import com.scusw.admin.dao.PrivilegeManageDao;
import com.scusw.admin.service.PrivilegeManageService;
import com.scusw.model.GroupInfo;
import com.scusw.model.GroupPrivilege;
import com.scusw.model.PrivilegeInfo;

/**
 * manage privilege
 * @author liu jiahao
 *
 */

public class PrivilegeManageServiceImpl implements PrivilegeManageService {
	
	private PrivilegeManageDao privMangDao;
	public static Logger logger = Logger.getLogger(PrivilegeManageAction.class);
	

	
	public static Logger getLogger() {
		return logger;
	}

	public static void setLogger(Logger logger) {
		PrivilegeManageServiceImpl.logger = logger;
	}

	public PrivilegeManageDao getPrivMangDao() {
		return privMangDao;
	}

	public void setPrivMangDao(PrivilegeManageDao privMangDao) {
		this.privMangDao = privMangDao;
	}



	/**
	 * query all info of privileges
	 * @return 
	 */
	public List<PrivilegeInfo> queryAllPrivilege() {
		
		return privMangDao.queryAllPrivilege();
		
	}



	/**
	 * add a record of privilege
	 * @return 
	 */
	public boolean addPrivilege(PrivilegeInfo privInfo) {
		
		privMangDao.addPrivilege(privInfo);
		logger.info("Add privilege --- " + "privilegeId: " + privInfo.getPrivilegeId() 
				+ " privilegeName: " + privInfo.getPrivilegeName());
		return true;
		
	}
	

	/**
	 * query all info of groups
	 * @return
	 */
	public List<GroupInfo> queryAllGroup(){
		
		return privMangDao.queryAllGroup();
		
	}


	/**
	 * add a record of group
	 * @return
	 */
	public boolean addGroup(GroupInfo groupInfo){
		
		logger.info("Add GroupInfo --- " + "groupId: " + groupInfo.getGroupId() 
				+ " groupName: " + groupInfo.getGroupName());
		return privMangDao.addGroup(groupInfo);
		
	}
	
	

	/**
	 * add records of groupprivilege
	 * @return
	 */
	public boolean addGroupPrivilege(GroupInfo groupInfo,int[] privileges) {
		
		int i = 0;
		while(i<privileges.length){
			GroupPrivilege gp = new GroupPrivilege();
			PrivilegeInfo pi = new PrivilegeInfo();
			pi = privMangDao.getPrivilegeInfoById(privileges[i]);
			gp.setGroupInfo(groupInfo);
			gp.setPrivilegeInfo(pi);
			i++;
			logger.info("Add groupPrivilege --- " + "groupPrivilegeId: " + gp.getGroupPrivilegeId() 
					+ " groupPrivilegeName: " + gp.getPrivilegeInfo().getPrivilegeName());
			privMangDao.addGroupPrivilege(gp);
			
		}

		return true;
		
	}

	
	/**
	 * query group privilege by groupId
	 * @return
	 */
	public List<PrivilegeInfo> queryPrivilegeByGroupId(int groupId) {
		
		return privMangDao.queryPrivByGroupId(groupId);
		
	}
	
	
	/**
	 * get group by Id
	 * @return
	 */
	public GroupInfo getGroupById(int groupId){
		
		return privMangDao.getGroupById(groupId);
		
	}
	
	
	/**
	 * delete group
	 * actually this is make groupAvai false and del all GroupPrivileges of this group
	 * @param list	all privileges in this group
	 * @return
	 */
	public boolean delGroup(GroupInfo groupInfo) {
		
		List<GroupPrivilege> list = privMangDao.queryGroupPrivlegeByGroupId(groupInfo.getGroupId());
		for(GroupPrivilege gp: list){
			privMangDao.delGroupPrivilege(gp);
		}
		groupInfo.setGroupAvai(0);
		privMangDao.updateGroup(groupInfo);
		logger.info("Delete groupInfo --- " + "groupId: " + groupInfo.getGroupId() 
				+ " groupName: " + groupInfo.getGroupName());
		return true;

	}

	
	/**
	 * delete groupPrivilege
	 */
	public boolean delGroupPrivilege(GroupPrivilege gp) {

		logger.info("Delete GroupPrivilege --- " + "groupPrivilegeId: " + gp.getGroupPrivilegeId());
		return privMangDao.delGroupPrivilege(gp);
	}

	
	/**
	 * update groupInfo
	 */
	public boolean updateGroup(GroupInfo groupInfo) {
		
		logger.info("update groupInfo --- " + "groupId: " + groupInfo.getGroupId() 
				+ " groupName: " + groupInfo.getGroupName());
		return privMangDao.updateGroup(groupInfo);
		
	}

	
	/**
	 * after you update groupInfo ,this method should be exe to update groupPrivilege
	 */
	public boolean updateGroupPrivilege(GroupInfo groupInfo, int[] privileges) {
		
		List<GroupPrivilege> list = privMangDao.queryGroupPrivlegeByGroupId(groupInfo.getGroupId());
		for(GroupPrivilege gp: list){
			logger.info("delete GroupPrivilege:" + gp.getGroupPrivilegeId() + ".");
			privMangDao.delGroupPrivilege(gp);
		}
		return addGroupPrivilege(groupInfo, privileges);
		
	}


}
