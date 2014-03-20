package com.scusw.admin.action;

import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.scusw.admin.service.BranchService;
import com.scusw.model.BranchInfo;

/**
 * manage privilege
 * @author liu jiahao
 *
 */

public class BranchAction {
	
	private BranchInfo branchInfo;
	private BranchService branchService;
	private String keyword;
	private Map<String,Object> request;
	
	
	
	public BranchInfo getBranchInfo() {
		return branchInfo;
	}
	
	public void setBranchInfo(BranchInfo branchInfo) {
		this.branchInfo = branchInfo;
	}

	public Map<String, Object> getRequest() {
		return request;
	}
	
	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}
	
	public BranchService getBranchService() {
		return branchService;
	}
	
	public void setBranchService(BranchService branchService) {
		this.branchService = branchService;
	}
	
	public String getKeyword() {
		return keyword;
	}
	
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	
	/**
	 * list all branchs 
	 * @return
	 */
	public String listBranch(){

		List<BranchInfo> list = branchService.queryAllBranch();
		request = (Map)ActionContext.getContext().get("request");
		request.clear();
		request.put("keyword", keyword);
		request.put("branchs", list);
		return "listBranch";
		
	}
	
	
	/**
	 * query branch by keyword
	 * @return
	 */
	public String searchBranch(){

		List<BranchInfo> list = branchService.queryBranchByKeyword(keyword);
		request = (Map)ActionContext.getContext().get("request");
		request.clear();
		request.put("keyword", keyword);
		request.put("branchs", list);
		return "listBranch";
		
	}
	
	
	/**
	 * delete branch actually to make it unavaiavble
	 * @return
	 */
	public String delBranch(){
		
		branchInfo = branchService.queryBranchById(branchInfo.getBranchId());
		if(branchService.delBranch(branchInfo)){
			return listBranch();
		}
		return "delError";
	}
	
	
	/**
	 * add branch
	 * @return
	 */
	public String addBranch(){
		
		if(branchService.addBranch(branchInfo)){
			return listBranch();
		}
		return "addError";
	}
	
	
	/**
	 * update branch step 1:to put its current info
	 * @return
	 */
	public String updateBranch1(){
		
		branchInfo = branchService.queryBranchById(branchInfo.getBranchId());
		request = (Map)ActionContext.getContext().get("request");
		request.clear();
		request.put("branchInfo", branchInfo);
		return "updateBranch";
		
	}
	
	
	/**
	 * update branch step 2:update its info
	 * @return
	 */
	public String updateBranch2(){
		
		branchService.updateBranch(branchInfo);
		return listBranch();
		
	}
	
}
