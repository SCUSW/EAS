package com.scusw.admin.action;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.opensymphony.xwork2.ActionContext;
import com.scusw.admin.service.StaffService;
import com.scusw.model.BranchInfo;
import com.scusw.model.DepartmentInfo;
import com.scusw.model.StaffInfo;

/**
 * 
 * @author liu jiahao
 * 
 */

public class StaffAction {
	
	private StaffInfo staff;
	private BranchInfo branchInfo;
	private DepartmentInfo departmentInfo;
	private StaffService staffService;
	private int nextPage = 1;
	private int pageSize = 10;
	private String keyword;
	private String sf;

	private Map<String,Object> request;

	
	
	
	
	
	public DepartmentInfo getDepartmentInfo() {
		return departmentInfo;
	}


	public void setDepartmentInfo(DepartmentInfo departmentInfo) {
		this.departmentInfo = departmentInfo;
	}


	public StaffInfo getStaff() {
		return staff;
	}


	public BranchInfo getBranchInfo() {
		return branchInfo;
	}


	public StaffService getStaffService() {
		return staffService;
	}


	public int getNextPage() {
		return nextPage;
	}


	public int getPageSize() {
		return pageSize;
	}


	public String getKeyword() {
		return keyword;
	}


	public String getSf() {
		return sf;
	}


	public Map<String, Object> getRequest() {
		return request;
	}


	public void setStaff(StaffInfo staff) {
		this.staff = staff;
	}


	public void setBranchInfo(BranchInfo branchInfo) {
		this.branchInfo = branchInfo;
	}


	public void setStaffService(StaffService staffService) {
		this.staffService = staffService;
	}


	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}


	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}


	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}


	public void setSf(String sf) {
		this.sf = sf;
	}


	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}


	/**
	 * query all staff
	 * @return
	 */
	public String listStaff(){
		
		List<StaffInfo> list = staffService.queryAllStaff(nextPage, pageSize);
		request = (Map)ActionContext.getContext().get("request");
		keyword = "";
		request.clear();
		request.put("keyword",keyword);
		request.put("branchs",staffService.queryAllBranch());
		request.put("staffs",list);
		request.put("total",staffService.getTotalStaff());
		request.put("pageSize", pageSize);
		request.put("currentPage", nextPage);
		return "listStaff";
	}
	
	
	/**
	 * del staff (actually is to make it unavaiable
	 * @return
	 */
	public String deleteStaff(){

		staff = staffService.queryStaffById(staff.getStaffId());
		if(staffService.deleteStaff(staff)){
			return listStaff();
		}
		return "delStaffError";
	}
	
	
	/**
	 * search staff by branch
	 * @return
	 */
	public String searchStaff1(){
		
		if(branchInfo.getBranchId() == 0){
			return listStaff();
		}
		List<StaffInfo> list = staffService.queryStaffByBranchId(branchInfo.getBranchId(), nextPage, pageSize);
		request = (Map)ActionContext.getContext().get("request");
		keyword = "";
		request.clear();
		request.put("staffs",list);
		request.put("keyword",keyword);
		request.put("branchs",staffService.queryAllBranch());
		request.put("branch",staffService.queryBranchById(branchInfo.getBranchId()));
		request.put("total",staffService.queryNoStaffByBranchId(branchInfo.getBranchId()));
		request.put("pageSize", pageSize);
		request.put("currentPage", nextPage);
		return "listStaff";
	}
	
	
	/**
	 * search staff by keyword
	 * @return
	 */
	public String searchStaff2(){
		List<StaffInfo> list = staffService.queryStaffByKeyword(keyword,nextPage, pageSize);
		request = (Map)ActionContext.getContext().get("request");
		request.clear();
		request.put("staffs",list);
		request.put("keyword",keyword);
		request.put("branchs",staffService.queryAllBranch());
		request.put("total",staffService.queryNoStaffByKeyword(keyword));
		request.put("pageSize", pageSize);
		request.put("currentPage", nextPage);
		return "listStaff";
	}
	
	

	
	/**
	 * add staff step1:choose branch
	 * @return
	 */
	public String addStaff1(){
		
		request = (Map)ActionContext.getContext().get("request");
		request.put("branchs",staffService.queryAllBranch());
		return "chooseBranch";
	}
	
	
	/**
	 * add staff step1:choose department 
	 * @return
	 */
	public String addStaff2(){
		
		request = (Map)ActionContext.getContext().get("request");
		request.put("departments", staffService.queryDepartmentBybranchId(branchInfo.getBranchId()));
		return "chooseDept";
	}
	
	/**
	 * go to page for add staff 
	 * @return
	 */
	public String addStaff3(){
		
		request = (Map)ActionContext.getContext().get("request");
		request.put("vocations", staffService.queryVocationByDepartmentId(departmentInfo.getDepartmentId()));
		request.put("groups", staffService.queryAllGroup());
		return "addStaff";
	}
	
	
	/**
	 * add info
	 * @return
	 */
	public String addStaff4(){
		
		nextPage=1;
		if(staffService.addStaff(staff)){
			return listStaff();
		}
		return "addStaffError";
	}
	
	
	/**
	 * update sraff by choose its branch
	 * @return
	 */
	public String updateStaff1(){
		
		staff = staffService.queryStaffById(staff.getStaffId());
		request = (Map)ActionContext.getContext().get("request");
		request.put("branchs",staffService.queryAllBranch());
//		branchInfo = staff.getPositionInfo().getDepartmentInfo().getBranchInfo();
//		branchInfo.setBranchId(staff.getPositionInfo().getDepartmentInfo().getBranchInfo().getBranchId());
		request.put("branch", staff.getPositionInfo().getDepartmentInfo().getBranchInfo());
		return "updateStaffBranch";
	}
	
	
	/**
	 * update sraff by choose its department
	 * @return
	 */
	public String updateStaff2(){
		
		request = (Map)ActionContext.getContext().get("request");
		request.put("departments", staffService.queryDepartmentBybranchId(branchInfo.getBranchId()));
//		departmentInfo = staff.getPositionInfo().getDepartmentInfo();
//		departmentInfo.setDepartmentId(staff.getPositionInfo().getDepartmentInfo().getDepartmentId());
		request.put("department", staff.getPositionInfo().getDepartmentInfo());
		return "updateStaffDept";
	}
	
	
	/**
	 * go to page for update staff 
	 * @return
	 */
	public String updateStaff3(){
		
		request = (Map)ActionContext.getContext().get("request");
//		request.put("vocation", staff.getPositionInfo());
		request.put("vocations", staffService.queryVocationByDepartmentId(departmentInfo.getDepartmentId()));
		request.put("groups", staffService.queryAllGroup());
		request.put("staff", staff);
		return "updateStaff";
	}
	
	
	/**
	 * update info
	 * @return
	 */
	public String updateStaff4(){
		
		if(staffService.updateStaff(staff)){
			return listStaff();
		}
		return "updateStaffError";
	}

	
	/**
	 * get departments by branchId
	 * 
	 */
	public String execute() throws Exception {
		 
		List<DepartmentInfo> list = staffService.queryDepartmentBybranchId(Integer.parseInt(sf));

		return "success";
	}
	
}
