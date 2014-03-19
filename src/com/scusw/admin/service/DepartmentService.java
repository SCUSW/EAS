package com.scusw.admin.service;

import java.util.List;

import com.scusw.model.BranchInfo;
import com.scusw.model.DepartmentInfo;

/**
 * 
 * @author liu jiahao
 *
 */

public interface DepartmentService {
	
	// list departments
	public List<DepartmentInfo> queryAllDepartment(int currentPage,int pageSize);
	
	// get total number of Department
	public int queryTotalDepartment();
	
	// query department by id
	public DepartmentInfo queryDepartmentById(int departmentId);
	
	// query department by keyword
	public List<DepartmentInfo> queryDepartmentByKeyword(String keyword,int currentPage,int pageSize);
	
	// get total number of Department by keyword
	public int queryNoDepartmentByKeyword(String keyword);
	
	// delete department by id
	public boolean delDepartment(DepartmentInfo departmentInfo);
	
	// add department
	public boolean addDepartment(DepartmentInfo departmentInfo);
	
	// update department
	public boolean updateDepartment(DepartmentInfo departmentInfo);
	
	// list branchs
	public List<BranchInfo> queryAllBranch();

	// list department by branchId
	public List<DepartmentInfo> queryDepartmentByBranchId(int branchId,
			int currentPage, int pageSize);

	// list department by branchId
	public List<DepartmentInfo> queryDepartmentByBranchId(int branchId);
	
	// list num of department by branchId
	public int queryNoDepartmentByBranchId(int branchId);
	
	
}
