package com.scusw.admin.action;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

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
	
	public static Logger logger = Logger.getLogger(BranchAction.class);
	
	
	
	public BranchInfo getBranchInfo() {
		return branchInfo;
	}
	public void setBranchInfo(BranchInfo branchInfo) {
		this.branchInfo = branchInfo;
	}
	public static Logger getLogger() {
		return logger;
	}
	public static void setLogger(Logger logger) {
		BranchAction.logger = logger;
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
	
	// list all branchs 
	public String listBranch(){
//		System.out.println("lisBranch ....");
		List<BranchInfo> list = branchService.queryAllBranch();
		request = (Map)ActionContext.getContext().get("request");
		request.clear();
		request.put("keyword", keyword);
		request.put("branchs", list);
		return "listBranch";
	}
	
	// query branch by keyword
	public String searchBranch(){
		System.out.println("search branch ...");
		List<BranchInfo> list = branchService.queryBranchByKeyword(keyword);
		request = (Map)ActionContext.getContext().get("request");
		request.clear();
		request.put("keyword", keyword);
		request.put("branchs", list);
		return "listBranch";
	}
	
	// delete branch
	public String delBranch(){
		if(branchService.delBranchById(branchInfo.getBranchId())){
			return listBranch();
		}
		return "delError";
	}
	
	// add branch
	public String addBranch(){
		branchInfo.setBranchAvai(1);
		Timestamp currTime = new Timestamp(System.currentTimeMillis());
		branchInfo.setBranchFoundedTime(currTime);
		if(branchService.addBranch(branchInfo)){
			return listBranch();
		}
		return "addError";
	}
	
	// update branch step 1
	public String updateBranch1(){
		branchInfo = branchService.queryBranchById(branchInfo.getBranchId());
		request = (Map)ActionContext.getContext().get("request");
		request.clear();
		request.put("branchInfo", branchInfo);
		return "updateBranch";
	}
	
	// update branch step 2
	public String updateBranch2(){
		branchService.updateBranch(branchInfo);
		return listBranch();
	}
	
}
