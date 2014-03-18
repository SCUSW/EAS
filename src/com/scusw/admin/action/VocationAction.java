package com.scusw.admin.action;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.opensymphony.xwork2.ActionContext;
import com.scusw.admin.service.VocationService;
import com.scusw.model.BranchInfo;
import com.scusw.model.PositionInfo;


/**
 * manage privilege
 * @author liu jiahao
 *
 */

public class VocationAction {
	
	private PositionInfo vocation;
	private BranchInfo branchInfo;
	private VocationService vocationService;
	private int nextPage = 1;
	private int pageSize = 10;
	private String keyword;
	
	private Map<String,Object> request;
	public static Logger logger = Logger.getLogger(TeaLevelAction.class);
	
	
	
	public BranchInfo getBranchInfo() {
		return branchInfo;
	}
	public void setBranchInfo(BranchInfo branchInfo) {
		this.branchInfo = branchInfo;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public VocationService getVocationService() {
		return vocationService;
	}
	public void setVocationService(VocationService vocationService) {
		this.vocationService = vocationService;
	}
	public PositionInfo getVocation() {
		return vocation;
	}
	public void setVocation(PositionInfo vocation) {
		this.vocation = vocation;
	}
	public int getNextPage() {
		return nextPage;
	}
	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public Map<String, Object> getRequest() {
		return request;
	}
	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}
	public static Logger getLogger() {
		return logger;
	}
	public static void setLogger(Logger logger) {
		VocationAction.logger = logger;
	}
	
	// query all vocation
	public String listVocation(){
		List<PositionInfo> list = vocationService.queryAllVocation(nextPage, pageSize);
		request = (Map)ActionContext.getContext().get("request");
		keyword = "";
		request.clear();
		request.put("keyword",keyword);
		request.put("branchs",vocationService.queryAllBranch());
//		request.put("branch",vocationService.queryBranchById(branchInfo.getBranchId()));
		request.put("vocations",list);
		request.put("total",vocationService.getTotalVocation());
		request.put("pageSize", pageSize);
		request.put("currentPage", nextPage);
		return "listVocation";
	}
	
	// del vocation (actually is to make it unavaiable
	public String delVocation(){
//		nextPage = 1;
//		pageSize = 10;
		vocation = vocationService.queryVocationById(vocation.getVocationId());
		vocation.setVocationAvai(0);
		logger.info("delVocation:" + vocation.getVocationId());
		if(vocationService.updateVocation(vocation)){
			return listVocation();
		}
		return "delVocationError";
	}
	
	public String searchVocation1(){
		if(branchInfo.getBranchId() == 0){
			return listVocation();
		}
		List<PositionInfo> list = vocationService.queryVocationByBranchId(branchInfo.getBranchId(), nextPage, pageSize);
		request = (Map)ActionContext.getContext().get("request");
		keyword = "";
		request.clear();
		request.put("vocations",list);
		request.put("keyword",keyword);
		request.put("branchs",vocationService.queryAllBranch());
		request.put("branch",vocationService.queryBranchById(branchInfo.getBranchId()));
		request.put("total",vocationService.queryNoVocationByBranchId(branchInfo.getBranchId()));
		request.put("pageSize", pageSize);
		request.put("currentPage", nextPage);
		return "listVocation";
	}
	
	public String searchVocation2(){
		List<PositionInfo> list = vocationService.queryVocatinByKeyword(keyword,nextPage, pageSize);
		request = (Map)ActionContext.getContext().get("request");
		request.clear();
		request.put("vocations",list);
		request.put("keyword",keyword);
		request.put("branchs",vocationService.queryAllBranch());
//		request.put("branch",branchInfo);
		request.put("total",vocationService.queryNoVocatinByKeyword(keyword));
		request.put("pageSize", pageSize);
		request.put("currentPage", nextPage);
		return "listVocation";
	}
	
//	public String addVocation1(){
//		request = (Map)ActionContext.getContext().get("request");
//		request.clear();
//		request.put("branchs", vocationService.queryAllBranch());
//		request.put("departments", vocationService.queryAllDepartment());
//		return "addVocation";
//	}
	
	// choose branch
	public String addVocation1(){
		
		request = (Map)ActionContext.getContext().get("request");
		request.put("branchs",vocationService.queryAllBranch());
		return "chooseBranch";
	}
	
	// go to page for add vocation 
	public String addVocation2(){
		
		request = (Map)ActionContext.getContext().get("request");
		request.put("departments", vocationService.queryDepartmentBybranchId(branchInfo.getBranchId()));
		return "addVocation";
	}
	
	// go to page for add vocation 
	public String addVocation3(){
		nextPage=1;
		if(vocationService.addVocation(vocation)){
			return listVocation();
		}
		return "addVocationError";
	}
	
	// update vocation by choose its branch
	public String updateVocation1(){
		
		vocation = vocationService.queryVocationById(vocation.getVocationId());
		request = (Map)ActionContext.getContext().get("request");
		request.put("branchs",vocationService.queryAllBranch());
		return "updateVocationBranch";
	}
	
	// go to page for update vocation 
	public String updateVocation2(){
		
		request = (Map)ActionContext.getContext().get("request");
		request.put("departments", vocationService.queryDepartmentBybranchId(branchInfo.getBranchId()));
		return "updateVocation";
	}
	
	// update vocation
	public String updateVocation3(){
		
		if(vocationService.updateVocation(vocation)){
			return listVocation();
		}
		return "updateVocationError";
	}
	
}
