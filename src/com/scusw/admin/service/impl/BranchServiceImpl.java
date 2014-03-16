package com.scusw.admin.service.impl;

import java.util.List;

import com.scusw.admin.dao.BranchDao;
import com.scusw.admin.service.BranchService;
import com.scusw.model.BranchInfo;

/**
 * manage privilege
 * @author liu jiahao
 *
 */

public class BranchServiceImpl implements BranchService {

	private BranchDao branchDao;
	
	
	public BranchDao getBranchDao() {
		return branchDao;
	}


	public void setBranchDao(BranchDao branchDao) {
		this.branchDao = branchDao;
	}


	// query all branchs
	public List<BranchInfo> queryAllBranch() {
		return branchDao.queryAllBranch();
	}

	// query branch by keyword
	public List<BranchInfo> queryBranchByKeyword(String keyword) {
		
		return branchDao.queryBranchByKeyword(keyword);
	}

	// delete branch by id
	public boolean delBranchById(int branchId) {
		return branchDao.delBranchById(branchId);
	}


	// add branch
	public boolean addBranch(BranchInfo branchInfo) {
		return branchDao.addBranch(branchInfo);
	}


	public BranchInfo queryBranchById(int branchId) {
		return branchDao.queryBranchById(branchId);
	}


	public boolean updateBranch(BranchInfo branchInfo) {
		return branchDao.updateBranch(branchInfo);
	}

}
