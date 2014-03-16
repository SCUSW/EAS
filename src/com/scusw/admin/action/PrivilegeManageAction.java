package com.scusw.admin.action;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.opensymphony.xwork2.ActionContext;
import com.scusw.admin.service.PrivilegeManageService;
import com.scusw.model.GroupInfo;
import com.scusw.model.PrivilegeInfo;

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


	// list all info of privileges,put result to request
	public String listPrivilege(){
		List<PrivilegeInfo> list = privMangService.queryAllPrivilege();
		request = (Map)ActionContext.getContext().get("request");
		request.put("privileges", list);
		return "listPrivilege";
	}
	
	// add a record of privilege
	public String addPrivilege(){
		logger.info("add privilege: " + privilegeInfo.getPrivilegeName() + " # " + privilegeInfo.getPrivilegeDesc() );
		if(privMangService.addPrivilege(privilegeInfo))
			return listPrivilege();
		return "addPrivError";
	}
	
	// list all info of groups
	public String listGroup(){
		List<GroupInfo> list = privMangService.queryAllGroup();
		
		// alist use to get group privileges by traverse list(groups)
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
	
	// step 1 for add group : list privileges
	public String addGroup1(){
		List<PrivilegeInfo> list = privMangService.queryAllPrivilege();
		request = (Map)ActionContext.getContext().get("request");
		request.put("privileges", list);
		return "addGroup";
	}
	
	// add a record of group
	public String addGroup(){
		logger.info("add group:" + groupInfo.getGroupName() + " # " + groupInfo.getGroupRemark());
		groupInfo.setGroupAvai(1);
		
		if(privMangService.addGroup(groupInfo)){
			return addGroupPrivilege();
		}
		return "addGroupError";
	}
	
	public String addGroupPrivilege(){
		if(privMangService.addGroupPrivilege(groupInfo, privileges)){
			return listGroup();
		}
		return "addGroupPrivilegeError";
	}
	
	
	public String updateGroup1(){
		groupInfo = privMangService.getGroupById(groupInfo.getGroupId());
		List<PrivilegeInfo> listed = privMangService.queryPrivilegeByGroupId(groupInfo.getGroupId());
		List<PrivilegeInfo> list = privMangService.queryAllPrivilege();
		
//		logger.info("listed:" + listed.size() + "# list:" + list.size());
		
		// a wrong method for cannot compare object by the method that you donnt rewrite from parents eg.toString 
//		for(PrivilegeInfo pi:listed){ 
//			System.out.println(list.remove(pi));
//		}
		
		for(int i=listed.size();i>0;i--){
			for(int j=list.size();j>0;j--){
				if(listed.get(i-1).getPrivilegeId().compareTo((list.get(j-1)).getPrivilegeId()) == 0){
//					logger.info("removed one privilege from list.");
					list.remove(j-1);
					continue;
				}
			}
		}
		
//		logger.info("listed:" + listed.size() + "# list:" + list.size());
		request = (Map) ActionContext.getContext().get("request");
		request.put("groupInfo", groupInfo);
		request.put("privileged", listed);
		request.put("privileges", list);
		return "updateGroup";
	}
	
	// update group
	public String updateGroup2(){
		privMangService.updateGroup(groupInfo);
		return updateGroupPrivilege();
	}
	
	// update groupPrivilege
	public String updateGroupPrivilege(){
		privMangService.updateGroupPrivilege(groupInfo, privileges);
		return listGroup();
	}
	
	
	public String delGroup(){
		groupInfo = privMangService.getGroupById(groupInfo.getGroupId());
		groupInfo.setGroupAvai(0);
		if(privMangService.delGroup(groupInfo)){
			return listGroup();
		}
		return "delGroupError";
	}
	
}
