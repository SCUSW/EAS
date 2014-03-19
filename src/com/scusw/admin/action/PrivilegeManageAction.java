package com.scusw.admin.action;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.opensymphony.xwork2.ActionContext;
import com.scusw.admin.service.PrivilegeManageService;
import com.scusw.model.GroupInfo;
import com.scusw.model.PrivilegeInfo;
import com.scusw.util.CheckPrivilege;

/**
 * manage privilege
 * @author liu jiahao
 *
 */

public class PrivilegeManageAction {
	
	private PrivilegeInfo privilegeInfo;
	private GroupInfo groupInfo;
	private int[] privileges;
	private PrivilegeManageService privMangService;
	private Map<String,Object> request;
	
	public static Logger logger = Logger.getLogger(PrivilegeManageAction.class);
	
	
	
	public int[] getPrivileges() {
		return privileges;
	}



	public void setPrivileges(int[] privileges) {
		this.privileges = privileges;
	}



	public GroupInfo getGroupInfo() {
		return groupInfo;
	}



	public void setGroupInfo(GroupInfo groupInfo) {
		this.groupInfo = groupInfo;
	}



	public PrivilegeManageService getPrivMangService() {
		return privMangService;
	}



	public void setPrivMangService(PrivilegeManageService privMangService) {
		this.privMangService = privMangService;
	}



	public static Logger getLogger() {
		return logger;
	}



	public static void setLogger(Logger logger) {
		PrivilegeManageAction.logger = logger;
	}



	public PrivilegeInfo getPrivilegeInfo() {
		return privilegeInfo;
	}



	public void setPrivilegeInfo(PrivilegeInfo privilegeInfo) {
		this.privilegeInfo = privilegeInfo;
	}



	public Map<String, Object> getRequest() {
		return request;
	}



	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}


	/**
	 * list all info of privileges,put result to request and goto list page
	 * @return listPrivilege
	 */
	public String listPrivilege(){
		if (!CheckPrivilege.checkPrivilege(1)) {
			return "no_privilege";
		}
		List<PrivilegeInfo> list = privMangService.queryAllPrivilege();
		request = (Map)ActionContext.getContext().get("request");
		request.put("privileges", list);
		return "listPrivilege";
		
	}
	

	/**
	 * add a record of privilege
	 * @return listPrivilege()
	 */
	public String addPrivilege(){
		if (!CheckPrivilege.checkPrivilege(1)) {
			return "no_privilege";
		}
		if(privMangService.addPrivilege(privilegeInfo))
			return listPrivilege();
		return "addPrivError";
		
	}
	

	/**
	 * list all info of groups
	 * @return listGroup
	 */
	public String listGroup(){
		if (!CheckPrivilege.checkPrivilege(1)) {
			return "no_privilege";
		}
		List<GroupInfo> list = privMangService.queryAllGroup();
		
// 		alist use to get group privileges by traverse list(groups)
		ArrayList<List> alist = new ArrayList<List>();
		for(GroupInfo gi : list){
			alist.add(privMangService.queryPrivilegeByGroupId(gi.getGroupId()));
//			logger.info("groupId:" + gi.getGroupId());
//			logger.info("pri:" + privMangService.queryPrivilegeByGroupId(gi.getGroupId()).size());
		}
		
		request = (Map)ActionContext.getContext().get("request");
		request.put("number", list.size());
		request.put("groups", list);
		request.put("privileges", alist);
		
		return "listGroup";
		
	}
	

	/**
	 * step 1 for add group : put privileges
	 * @return addGroup
	 */
	public String addGroup1(){
		if (!CheckPrivilege.checkPrivilege(1)) {
			return "no_privilege";
		}
		List<PrivilegeInfo> list = privMangService.queryAllPrivilege();
		request = (Map)ActionContext.getContext().get("request");
		request.put("privileges", list);
		return "addGroup";
		
	}
	

	/**
	 * add a record of group,and then goto add its privileges
	 * @return addGroupPrivilege()
	 */
	public String addGroup(){
		if (!CheckPrivilege.checkPrivilege(1)) {
			return "no_privilege";
		}
		logger.info("add group:" + groupInfo.getGroupName() + " # " + groupInfo.getGroupRemark());
		groupInfo.setGroupAvai(1);
		
		if(privMangService.addGroup(groupInfo)){
			return addGroupPrivilege();
		}
		return "addGroupError";
		
	}
	
	
	/**
	 * add group privileges
	 * @return listGroup()
	 */
	public String addGroupPrivilege(){
		if (!CheckPrivilege.checkPrivilege(1)) {
			return "no_privilege";
		}
		if(privMangService.addGroupPrivilege(groupInfo, privileges)){
			return listGroup();
		}
		return "addGroupPrivilegeError";
		
	}
	
	
	/**
	 * update group step 1 ,to put its privileges and current info
	 * @return updateGroup
	 * @param listed	privileges it already have
	 * @param list		privilege it not have
	 */
	public String updateGroup1(){
		if (!CheckPrivilege.checkPrivilege(1)) {
			return "no_privilege";
		}
		groupInfo = privMangService.getGroupById(groupInfo.getGroupId());
		
		List<PrivilegeInfo> listed = privMangService.queryPrivilegeByGroupId(groupInfo.getGroupId());
		List<PrivilegeInfo> list = privMangService.queryAllPrivilege();

		for(int i=listed.size();i>0;i--){
			for(int j=list.size();j>0;j--){
				if(listed.get(i-1).getPrivilegeId().compareTo((list.get(j-1)).getPrivilegeId()) == 0){
					list.remove(j-1);
					continue;
				}
			}
		}
		
		request = (Map) ActionContext.getContext().get("request");
		request.put("groupInfo", groupInfo);
		request.put("privileged", listed);
		request.put("privileges", list);
		return "updateGroup";
		
	}
	

	/**
	 * update group step 2, update group
	 * @return updateGroupPrivilege()
	 */
	public String updateGroup2(){
		if (!CheckPrivilege.checkPrivilege(1)) {
			return "no_privilege";
		}
		privMangService.updateGroup(groupInfo);
		return updateGroupPrivilege();
		
	}
	

	/**
	 * update groupPrivilege
	 * @return listGroup()
	 */
	public String updateGroupPrivilege(){
		if (!CheckPrivilege.checkPrivilege(1)) {
			return "no_privilege";
		}
		privMangService.updateGroupPrivilege(groupInfo, privileges);
		return listGroup();
		
	}
	
	
	/**
	 * delete group actually is to make it unavaiable
	 * @return listGroup()
	 */
	public String delGroup(){
		if (!CheckPrivilege.checkPrivilege(1)) {
			return "no_privilege";
		}
		groupInfo = privMangService.getGroupById(groupInfo.getGroupId());
		if(privMangService.delGroup(groupInfo)){
			return listGroup();
		}
		return "delGroupError";
	}
	
}
