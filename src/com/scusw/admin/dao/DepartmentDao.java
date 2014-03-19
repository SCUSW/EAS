package com.scusw.admin.dao;

import java.util.List;

import com.scusw.model.BranchInfo;
import com.scusw.model.DepartmentInfo;


/**
 * 
 * @author liu jiahao
 *
 */

public interface DepartmentDao {
	
	// interface to list branchs
	public List<DepartmentInfo> queryAllDepartment(int currentPage,int pageSize);
	
	
	// get total number of Department
	public int queryTotalDepartment();

	// query department by keyword
	public List<DepartmentInfo> queryDepartmentByKeyword(String keyword,int currentPage,int pageSize);
	
	// get total number of Department by keyword
	public int queryNoDepartmentByKeyword(String keyword);
	
	// delete department by id
	public boolean delDepartmentById(int departmentId);
	
	// add department
	public boolean addDepartment(DepartmentInfo departmentInfo);
	
	// query department by id
	public DepartmentInfo queryDepartmentById(int departmentId);
	
	// update department
	public boolean updateDepartment(DepartmentInfo departmentInfo);
	
	// interface to list branchs
	public List<BranchInfo> queryAllBranch();

	public List<DepartmentInfo> queryDepartmentByBranchId(int branchId,
			int currentPage, int pageSize);
	
	public List<DepartmentInfo> queryDepartmentByBranchId(int branchId);

	public int queryNoDepartmentByBranchId(int branchId);
}
