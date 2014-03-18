package com.scusw.admin.action;

import java.sql.Timestamp;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.http.HttpRequest;

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
	private int total;
	private int branchId;
	private String keyword;
	private Map<String,Object> request;
	private List<BranchInfo> branchs;
	private List<DepartmentInfo> list;
	
	public static Logger logger = Logger.getLogger(DepartmentAction.class);
	
	
	


	
	
	public DepartmentInfo getDepartmentInfo() {
		return departmentInfo;
	}

	public DepartmentService getDepartmentService() {
		return departmentService;
	}

	public int getNextPage() {
		return nextPage;
	}

	public int getPageSize() {
		return pageSize;
	}

	public int getTotal() {
		return total;
	}

	public int getBranchId() {
		return branchId;
	}

	public String getKeyword() {
		return keyword;
	}

	public Map<String, Object> getRequest() {
		return request;
	}

	public List<DepartmentInfo> getList() {
		return list;
	}

	public static Logger getLogger() {
		return logger;
	}

	public void setDepartmentInfo(DepartmentInfo departmentInfo) {
		this.departmentInfo = departmentInfo;
	}

	public void setDepartmentService(DepartmentService departmentService) {
		this.departmentService = departmentService;
	}

	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public void setBranchId(int branchId) {
		this.branchId = branchId;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}

	public void setBranchs(List<BranchInfo> branchs) {
		this.branchs = branchs;
	}

	public void setList(List<DepartmentInfo> list) {
		this.list = list;
	}

	public static void setLogger(Logger logger) {
		DepartmentAction.logger = logger;
	}

	// list all departments
	public String listDepartment(){
		
		request = (Map)ActionContext.getContext().get("request");
		list = departmentService.queryAllDepartment(nextPage, pageSize);
		//request.put("branchs", departmentService.queryAllBranch());
		ServletActionContext.getRequest().setAttribute("branchs",departmentService.queryAllBranch());
		total=departmentService.queryTotalDepartment();
		request.put("total",total);
		request.put("pageSize", pageSize);
		request.put("currentPage", nextPage);
		
		return "listDepartment";
	}
	
	// query department by keyword
	public String searchDepartment(){
//		List<DepartmentInfo> list = departmentService.queryDepartmentByKeyword(keyword,nextPage, pageSize);
//		request = (Map)ActionContext.getContext().get("request");
//		request.clear();
//		request.put("keyword", keyword);
//		request.put("departments", list);
//		request.put("branchs", departmentService.queryAllBranch());
//		request.put("total",departmentService.queryNoDepartmentByKeyword(keyword));
//		request.put("pageSize", pageSize);
//		request.put("currentPage", nextPage);
		
		request = (Map)ActionContext.getContext().get("request");
		list = departmentService.queryDepartmentByKeyword(keyword,nextPage, pageSize);
		ServletActionContext.getRequest().setAttribute("branchs",departmentService.queryAllBranch());
		total = departmentService.queryNoDepartmentByKeyword(keyword);
		request.put("total",total);
		request.put("pageSize", pageSize);
		request.put("currentPage", nextPage);
		return "listDepartment";
	}
	
	// query department by branchId
	public String searchDepartment2(){
//		List<DepartmentInfo> list = departmentService.queryDepartmentByBranchId(branchId,nextPage, pageSize);
//		request = (Map)ActionContext.getContext().get("request");
//		request.clear();
//		request.put("keyword", keyword);
//		request.put("departments", list);
//		request.put("branchs", departmentService.queryAllBranch());
//		request.put("total",departmentService.queryNoDepartmentByBranchId(branchId));
//		request.put("pageSize", pageSize);
//		request.put("currentPage", nextPage);
		if(branchId == 0){
			return listDepartment();
		}
		request = (Map)ActionContext.getContext().get("request");
		ServletActionContext.getRequest().setAttribute("branchs",departmentService.queryAllBranch());
		list = departmentService.queryDepartmentByBranchId(branchId,nextPage, pageSize);
		total = departmentService.queryNoDepartmentByBranchId(branchId);
		request.put("total",total);
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
//		List<BranchInfo> list = departmentService.queryAllBranch();
		branchs = departmentService.queryAllBranch();
		
//		for(BranchInfo bi:branchs){
//			if(bi.getBranchId().compareTo(departmentInfo.getBranchInfo().getBranchId()) == 0){
//				branchs.remove(bi);
//				break;
//			}
//		}
		ServletActionContext.getRequest().setAttribute("branchs",departmentService.queryAllBranch());
		
//		request = (Map)ActionContext.getContext().get("request");
//		request.clear();
//		request.put("branchs", list);
//		request.put("departmentInfo", departmentInfo);
		
		return "updateDepartment";
	}
	
	// update department step 2
	public String updateDepartment2(){
		departmentService.updateDepartment(departmentInfo);
		return listDepartment();
	}
	
	// get all branch info to request and go to add department page.
	public String getBranchs(){
		
//		List<BranchInfo> list = departmentService.queryAllBranch();
//		request = (Map)ActionContext.getContext().get("request");
//		request.clear();
//		request.put("branchs", list);
		ServletActionContext.getRequest().setAttribute("branchs",departmentService.queryAllBranch());
		return "addDepartment";
	}
	
}
