package com.scusw.admin.service.impl;

import java.sql.Timestamp;
import java.util.List;

import org.apache.log4j.Logger;

import com.scusw.admin.dao.BranchDao;
import com.scusw.admin.service.BranchService;
import com.scusw.model.BranchInfo;

/**
 * 
 * @author liu jiahao
 *
 */

public class BranchServiceImpl implements BranchService {

	private BranchDao branchDao;
	public static Logger logger = Logger.getLogger(BranchServiceImpl.class);
	
	
	
	public static Logger getLogger() {
		return logger;
	}


	public static void setLogger(Logger logger) {
		BranchServiceImpl.logger = logger;
	}


	public BranchDao getBranchDao() {
		return branchDao;
	}


	public void setBranchDao(BranchDao branchDao) {
		this.branchDao = branchDao;
	}


	/**
	 * query all branchs
	 */
	public List<BranchInfo> queryAllBranch() {
		
		return branchDao.queryAllBranch();
	}

	
	/**
	 * query branch by keyword
	 */
	public List<BranchInfo> queryBranchByKeyword(String keyword) {
		
		return branchDao.queryBranchByKeyword(keyword);
	}

	
	/**
	 * delete branch by id:make it unavaiable
	 */
	public boolean delBranch(BranchInfo branchInfo) {
		
		branchInfo.setBranchAvai(0);
		logger.info("Delete BranchInfo --- " + "branchId: " + branchInfo.getBranchId() 
				+ " branchName: " + branchInfo.getBranchName());
		return branchDao.updateBranch(branchInfo);
	}


	/**
	 * add branch
	 */
	public boolean addBranch(BranchInfo branchInfo) {
		
		branchInfo.setBranchAvai(1);
		Timestamp currTime = new Timestamp(System.currentTimeMillis());
		branchInfo.setBranchFoundedTime(currTime);
		logger.info("Add BranchInfo --- " + "branchId: " + branchInfo.getBranchId() 
				+ " branchName: " + branchInfo.getBranchName());
		return branchDao.addBranch(branchInfo);
	}


	/**
	 * query all branch by branchId
	 */
	public BranchInfo queryBranchById(int branchId) {
		
		return branchDao.queryBranchById(branchId);
	}


	/**
	 * update branchInfo
	 */
	public boolean updateBranch(BranchInfo branchInfo) {
		
		logger.info("update BranchInfo --- " + "branchId: " + branchInfo.getBranchId() 
				+ " branchName: " + branchInfo.getBranchName());
		return branchDao.updateBranch(branchInfo);
	}

}
