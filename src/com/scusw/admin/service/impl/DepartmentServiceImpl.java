package com.scusw.admin.service.impl;

import java.util.List;

import com.scusw.admin.dao.DepartmentDao;
import com.scusw.admin.service.BranchService;
import com.scusw.admin.service.DepartmentService;
import com.scusw.model.BranchInfo;
import com.scusw.model.DepartmentInfo;

/**
 * manage privilege
 * @author liu jiahao
 *
 */

public class DepartmentServiceImpl implements DepartmentService {

	private DepartmentDao departmentDao;
	private BranchService branchService;

	
	
	public BranchService getBranchService() {
		return branchService;
	}

	public void setBranchService(BranchService branchService) {
		this.branchService = branchService;
	}

	public DepartmentDao getDepartmentDao() {
		return departmentDao;
	}

	public void setDepartmentDao(DepartmentDao departmentDao) {
		this.departmentDao = departmentDao;
	}

	// query all departments
	public List<DepartmentInfo> queryAllDepartment(int currentPage,int pageSize) {
		return departmentDao.queryAllDepartment(currentPage,pageSize);
	}

	// query department by keyword
	public List<DepartmentInfo> queryDepartmentByKeyword(String keyword,int currentPage,int pageSize) {
		
		return departmentDao.queryDepartmentByKeyword(keyword,currentPage,pageSize);
	}

	// delete department by id
	public boolean delDepartmentById(int departmentId) {
		return departmentDao.delDepartmentById(departmentId);
	}


	// add department
	public boolean addDepartment(DepartmentInfo departmentInfo) {
		return departmentDao.addDepartment(departmentInfo);
	}


	public DepartmentInfo queryDepartmentById(int departmentId) {
		return departmentDao.queryDepartmentById(departmentId);
	}


	public boolean updateDepartment(DepartmentInfo departmentInfo) {
		return departmentDao.updateDepartment(departmentInfo);
	}
	
	// query all branchs
	public List<BranchInfo> queryAllBranch() {
//		return departmentDao.queryAllBranch();
		return branchService.queryAllBranch();
	}

	public int queryTotalDepartment() {
		
		return departmentDao.queryTotalDepartment();
	}

	public int queryNoDepartmentByKeyword(String keyword) {

		return departmentDao.queryNoDepartmentByKeyword(keyword);
	}

	public List<DepartmentInfo> queryDepartmentByBranchId(int branchId,
			int currentPage, int pageSize) {
		
		return departmentDao.queryDepartmentByBranchId(branchId,currentPage,pageSize);
	}

	public List<DepartmentInfo> queryDepartmentByBranchId(int branchId) {
		
		return departmentDao.queryDepartmentByBranchId(branchId);
	}
	
	public int queryNoDepartmentByBranchId(int branchId) {

		return departmentDao.queryNoDepartmentByBranchId(branchId);
	}

}
