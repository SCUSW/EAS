package com.scusw.admin.dao;

import java.util.List;

import com.scusw.model.StaffInfo;


/**
 * 
 * @author liu jiahao
 *
 */

public interface StaffDao {

	// query all staff
	public List<StaffInfo> queryAllStaff(int currentPage,int pageSize);
	
	// get total number of staff
	public int getTotalStaff();
	
	// update staff
	public boolean updateStaff(StaffInfo staff);
	
	// query staff by Id
	public StaffInfo queryStaffById(int staffId);
	
	// query staff by branchId
	public List<StaffInfo> queryStaffByBranchId(int branchId,int currentPage,int pageSize);
	
	// query num of staff by branchId
	public int queryNoStaffByBranchId(int branchId);
	
	// query staff by keyword
	public List<StaffInfo> queryStaffByKeyword(String keyword,int currentPage,int pageSize);
	
	// query num of staff by keyword
	public int queryNoStaffByKeyword(String keyword);

	// add staff
	public boolean addStaff(StaffInfo vocation);

}
