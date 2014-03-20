package com.scusw.admin.service.impl;

import java.sql.Timestamp;
import java.util.List;

import org.apache.log4j.Logger;

import com.scusw.admin.dao.DepartmentDao;
import com.scusw.admin.service.BranchService;
import com.scusw.admin.service.DepartmentService;
import com.scusw.model.BranchInfo;
import com.scusw.model.DepartmentInfo;

/**
 * 
 * @author liu jiahao
 *
 */

public class DepartmentServiceImpl implements DepartmentService {

	private DepartmentDao departmentDao;
	private BranchService branchService;
	public static Logger logger = Logger.getLogger(DepartmentServiceImpl.class);
	
	
	
	public static Logger getLogger() {
		return logger;
	}

	public static void setLogger(Logger logger) {
		DepartmentServiceImpl.logger = logger;
	}

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

	
	/**
	 * query all departments
	 */
	public List<DepartmentInfo> queryAllDepartment(int currentPage,int pageSize) {
		
		return departmentDao.queryAllDepartment(currentPage,pageSize);
	}


	/**
	 * query department by keyword
	 */
	public List<DepartmentInfo> queryDepartmentByKeyword(String keyword,int currentPage,int pageSize) {
		
		return departmentDao.queryDepartmentByKeyword(keyword,currentPage,pageSize);
	}

	
	/**
	 * delete department by id
	 */
	public boolean delDepartment(DepartmentInfo departmentInfo) {
		
		logger.info("Delete departmentInfo --- " + "departmentId: " + departmentInfo.getDepartmentId() 
				+ " departmentName: " + departmentInfo.getDepartmentName());
		departmentInfo = departmentDao.queryDepartmentById(departmentInfo.getDepartmentId());
		departmentInfo.setDepartmentAvai(0);
		return departmentDao.updateDepartment(departmentInfo);
	}


	/**
	 * add department
	 */
	public boolean addDepartment(DepartmentInfo departmentInfo) {
		
		logger.info("Add departmentInfo --- " + "departmentId: " + departmentInfo.getDepartmentId() 
				+ " departmentName: " + departmentInfo.getDepartmentName());
		departmentInfo.setDepartmentAvai(1);
		Timestamp currTime = new Timestamp(System.currentTimeMillis());
		departmentInfo.setDepartmentFoundedTime(currTime);
		return departmentDao.addDepartment(departmentInfo);
	}

	/**
	 * query Department By Id
	 */
	public DepartmentInfo queryDepartmentById(int departmentId) {
		
		return departmentDao.queryDepartmentById(departmentId);
	}


	/**
	 * update Department
	 */
	public boolean updateDepartment(DepartmentInfo departmentInfo) {
		
		logger.info("Update departmentInfo --- " + "departmentId: " + departmentInfo.getDepartmentId() 
				+ " departmentName: " + departmentInfo.getDepartmentName());
		return departmentDao.updateDepartment(departmentInfo);
	}
	
	
	/**
	 * query all branchs
	 */
	public List<BranchInfo> queryAllBranch() {
		
		return branchService.queryAllBranch();
	}

	
	/**
	 * query Total num of Department
	 */
	public int queryTotalDepartment() {
		
		return departmentDao.queryTotalDepartment();
	}

	/**
	 * query Total num of Department by keyword
	 */
	public int queryNoDepartmentByKeyword(String keyword) {

		return departmentDao.queryNoDepartmentByKeyword(keyword);
	}

	
	/**
	 * query all Department by id
	 */
	public List<DepartmentInfo> queryDepartmentByBranchId(int branchId,
			int currentPage, int pageSize) {
		
		return departmentDao.queryDepartmentByBranchId(branchId,currentPage,pageSize);
	}

	
	/**
	 * query Department By Branch Id without pageinfo
	 */
	public List<DepartmentInfo> queryDepartmentByBranchId(int branchId) {
		
		return departmentDao.queryDepartmentByBranchId(branchId);
	}
	
	/**
	 * query Total num of Department by id
	 */
	public int queryNoDepartmentByBranchId(int branchId) {

		return departmentDao.queryNoDepartmentByBranchId(branchId);
	}

}
