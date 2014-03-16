package com.scusw.admin.action;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.opensymphony.xwork2.ActionContext;
import com.scusw.admin.service.DepartmentService;
import com.scusw.model.BranchInfo;
import com.scusw.model.DepartmentInfo;


/**
 * manage privilege
 * @author liu jiahao
 *
 */

public class DepartmentAction {
	
	private DepartmentInfo departmentInfo;
	private DepartmentService departmentService;
	private int nextPage = 1;
	private int pageSize = 10;
	private int branchId;
	private String keyword;
	private Map<String,Object> request;
	
	public static Logger logger = Logger.getLogger(DepartmentAction.class);
	
	
	
	
	public int getBranchId() {
		return branchId;
	}

	public void setBranchId(int branchId) {
		this.branchId = branchId;
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

	public DepartmentInfo getDepartmentInfo() {
		return departmentInfo;
	}

	public void setDepartmentInfo(DepartmentInfo departmentInfo) {
		this.departmentInfo = departmentInfo;
	}

	public DepartmentService getDepartmentService() {
		return departmentService;
	}

	public void setDepartmentService(DepartmentService departmentService) {
		this.departmentService = departmentService;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
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
		DepartmentAction.logger = logger;
	}

	// list all departments
	public String listDepartment(){
		List<DepartmentInfo> list = departmentService.queryAllDepartment(nextPage, pageSize);
		request = (Map)ActionContext.getContext().get("request");
		request.clear();
		System.out.println("list.size:" + list.size());
		System.out.println(list.get(1).getDepartmentName());
		request.put("keyword", keyword);
		request.put("departments", list);
		request.put("branchs", departmentService.queryAllBranch());
		request.put("total",departmentService.queryTotalDepartment());
		request.put("pageSize", pageSize);
		request.put("currentPage", nextPage);
		return "listDepartment";
	}
	
	// query department by keyword
	public String searchDepartment(){
		List<DepartmentInfo> list = departmentService.queryDepartmentByKeyword(keyword,nextPage, pageSize);
		request = (Map)ActionContext.getContext().get("request");
		request.clear();
		request.put("keyword", keyword);
		request.put("departments", list);
		request.put("branchs", departmentService.queryAllBranch());
		request.put("total",departmentService.queryNoDepartmentByKeyword(keyword));
		request.put("pageSize", pageSize);
		request.put("currentPage", nextPage);
		return "listDepartment";
	}
	
	// query department by branchId
	public String searchDepartment2(){
		List<DepartmentInfo> list = departmentService.queryDepartmentByBranchId(branchId,nextPage, pageSize);
		request = (Map)ActionContext.getContext().get("request");
		request.clear();
		request.put("keyword", keyword);
		request.put("departments", list);
		request.put("branchs", departmentService.queryAllBranch());
		request.put("total",departmentService.queryNoDepartmentByBranchId(branchId));
		request.put("pageSize", pageSize);
		request.put("currentPage", nextPage);
		return "listDepartment";
	}
	
	// delete department
	public String delDepartment(){
		logger.info("delete department: " + departmentInfo.getDepartmentId() + " # " + departmentInfo.getDepartmentName());
		if(departmentService.delDepartmentById(departmentInfo.getDepartmentId())){
			return listDepartment();
		}
		return "delError";
	}
	
	// add department
	public String addDepartment(){
		departmentInfo.setDepartmentAvai(1);
		Timestamp currTime = new Timestamp(System.currentTimeMillis());
		departmentInfo.setDepartmentFoundedTime(currTime);
		if(departmentService.addDepartment(departmentInfo)){
			return listDepartment();
		}
		return "addError";
	}
	
	// update department step 1
	public String updateDepartment1(){
		departmentInfo = departmentService.queryDepartmentById(departmentInfo.getDepartmentId());
		List<BranchInfo> list = departmentService.queryAllBranch();
		
		for(BranchInfo bi:list){
			if(bi.getBranchId() == departmentInfo.getBranchInfo().getBranchId()){
				list.remove(bi);
				break;
			}
		}
		
		request = (Map)ActionContext.getContext().get("request");
		request.clear();
		request.put("branchs", list);
		request.put("departmentInfo", departmentInfo);
		return "updateDepartment";
	}
	
	// update department step 2
	public String updateDepartment2(){
		departmentService.updateDepartment(departmentInfo);
		return listDepartment();
	}
	
	// get all branch info to request and go to add department page.
	public String getBranchs(){
		
		List<BranchInfo> list = departmentService.queryAllBranch();
		request = (Map)ActionContext.getContext().get("request");
		request.clear();
		request.put("branchs", list);
		return "addDepartment";
	}
	
}
