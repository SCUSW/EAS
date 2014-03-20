package com.scusw.admin.service;

import java.util.List;

import com.scusw.model.BranchInfo;
import com.scusw.model.DepartmentInfo;
import com.scusw.model.GroupInfo;
import com.scusw.model.PositionInfo;
import com.scusw.model.StaffInfo;

/**
 * 
 * @author liu jiahao
 *
 */

public interface StaffService {
	
	// query all staff
	public List<StaffInfo> queryAllStaff(int currentPage,int pageSize);
	
	// query total number of staff
	public int getTotalStaff();
	
	// query staff by id
	public StaffInfo queryStaffById(int staffId);
	
	// update staff
	public boolean updateStaff(StaffInfo staff);
	
	// query all branchs
	public List<BranchInfo> queryAllBranch();
	
	// query branch by Id
	public BranchInfo queryBranchById(int branchId);
	
	// query staff by branchId
	public List<StaffInfo> queryStaffByBranchId(int branchId,int currentPage,int pageSize);
	
	// query staff by keyword
	public List<StaffInfo> queryStaffByKeyword(String keyword,int currentPage,int pageSize);
	
	// query num of staff by branchId
	public int queryNoStaffByBranchId(int branchId);
	
	// query num of staff by keyword
	public int queryNoStaffByKeyword(String keyword);
	
	// return all departments by matched branchId
	public List<DepartmentInfo> queryDepartmentBybranchId(int branchId);

	// add staff
	public boolean addStaff(StaffInfo staff);
	
	// query all group
	public List<GroupInfo> queryAllGroup();
	
	// query vocatin by departmentId
	public List<PositionInfo> queryVocationByDepartmentId(int departmentId);

	public boolean deleteStaff(StaffInfo staff);
	
}
