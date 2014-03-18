package com.scusw.admin.service;

import java.util.List;

import com.scusw.model.BranchInfo;

/**
 * manage privilege
 * @author liu jiahao
 *
 */

public interface BranchService {
	
	// list branchs
	public List<BranchInfo> queryAllBranch();
	
	// query branch by id
	public BranchInfo queryBranchById(int branchId);
	
	// query branch by keyword
	public List<BranchInfo> queryBranchByKeyword(String keyword);
	
	// delete branch by id
	public boolean delBranch(BranchInfo branchInfo);
	
	// add branch
	public boolean addBranch(BranchInfo branchInfo);
	
	// update branch
	public boolean updateBranch(BranchInfo branchInfo);
}
