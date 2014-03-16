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


	// query all info of privileges
	public List<PrivilegeInfo> queryAllPrivilege() {
		return privMangDao.queryAllPrivilege();
	}


	// add a record of privilege
	public boolean addPrivilege(PrivilegeInfo privInfo) {
		privMangDao.addPrivilege(privInfo);
		return true;
	}
	
	// query all info of groups
	public List<GroupInfo> queryAllGroup(){
		return privMangDao.queryAllGroup();
	}

	// add a record of group
	public boolean addGroup(GroupInfo groupInfo){
		return privMangDao.addGroup(groupInfo);
	}
	
	
	// add a record of groupprivilege
	public boolean addGroupPrivilege(GroupInfo groupInfo,int[] privileges) {
		int i = 0;
//		ArrayList<GroupPrivilege> list = new ArrayList<GroupPrivilege>();
		
	
		while(i<privileges.length){
			GroupPrivilege gp = new GroupPrivilege();
			PrivilegeInfo pi = new PrivilegeInfo();
			pi = privMangDao.getPrivilegeInfoById(privileges[i]);
			gp.setGroupInfo(groupInfo);
			gp.setPrivilegeInfo(pi);
			i++;
//			logger.info("add groupprivilege:" + gp.getPrivilegeInfo().getPrivilegeName());
//			list.add(gp);
			privMangDao.addGroupPrivilege(gp);
		}
		
//		logger.info("try to add groupprivilege number:" + list.size());
//		privMangDao.addGroup(groupInfo,list);
		return true;
	}

	// query group privilege by groupId
	public List<PrivilegeInfo> queryPrivilegeByGroupId(int groupId) {
		
		return privMangDao.queryPrivByGroupId(groupId);
	}
	
	// get group by Id
	public GroupInfo getGroupById(int groupId){
		return privMangDao.getGroupById(groupId);
	}
	
	// actually this is make groupAvai false and del all GroupPrivileges of this group
	public boolean delGroup(GroupInfo groupInfo) {
		List<GroupPrivilege> list = privMangDao.queryGroupPrivlegeByGroupId(groupInfo.getGroupId());
		for(GroupPrivilege gp: list){
			logger.info("delete GroupPrivilege:" + gp.getGroupPrivilegeId() + ".");
			privMangDao.delGroupPrivilege(gp);
		}
//		groupInfo = privMangDao.getGroupById(groupInfo.getGroupId());
//		groupInfo.setGroupAvai(0);
		System.out.println("getGroupbyId : " + groupInfo.getGroupId() + " avai: " + groupInfo.getGroupAvai());
		privMangDao.updateGroup(groupInfo);
		logger.info("set GroupInfo to unavailable:" + groupInfo.getGroupId() + "." + groupInfo.getGroupName());
		return true;
//		return privMangDao.delGroupById(groupId);
	}

	public boolean delGroupPrivilege(GroupPrivilege gp) {

		return privMangDao.delGroupPrivilege(gp);
	}

	// delete groupPrivilege before update groupInfo
	public boolean updateGroup(GroupInfo groupInfo) {
		
		return privMangDao.updateGroup(groupInfo);
	}

	// after you update groupInfo ,this method should be exe to update groupPrivilege
	public boolean updateGroupPrivilege(GroupInfo groupInfo, int[] privileges) {
		List<GroupPrivilege> list = privMangDao.queryGroupPrivlegeByGroupId(groupInfo.getGroupId());
		for(GroupPrivilege gp: list){
			logger.info("delete GroupPrivilege:" + gp.getGroupPrivilegeId() + ".");
			privMangDao.delGroupPrivilege(gp);
		}
		return addGroupPrivilege(groupInfo, privileges);
	}



}
