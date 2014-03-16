package com.scusw.admin.dao;

import java.util.List;

import com.scusw.model.BranchInfo;

/**
 * manage privilege
 * @author liu jiahao
 *
 */

public interface BranchDao {
	
	// interface to list branchs
	public List<BranchInfo> queryAllBranch();
	
	// query branch by keyword
	public List<BranchInfo> queryBranchByKeyword(String keyword);
	
	// delete branch by id
	public boolean delBranchById(int branchId);
	
	// add branch
	public boolean addBranch(BranchInfo branchInfo);
	
	// query branch by id
	public BranchInfo queryBranchById(int branchId);
	
	// update branch
	public boolean updateBranch(BranchInfo branchInfo);
}
