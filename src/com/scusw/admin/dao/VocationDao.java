package com.scusw.admin.dao;

import java.util.List;

import com.scusw.model.BranchInfo;
import com.scusw.model.PositionInfo;

/**
 * manage privilege
 * @author liu jiahao
 *
 */

public interface VocationDao {

	// query all vocatioin
	public List<PositionInfo> queryAllVocation(int currentPage,int pageSize);
	
	// get total number of vocation
	public int getTotalVocation();
	
	// update vocation
	public boolean updateVocation(PositionInfo vocation);
	
	// query vocatin by Id
	public PositionInfo queryVocationById(int vocationId);

	// query all branchs
	public List<BranchInfo> queryAllBranch();
	
	// query branch by Id
	public BranchInfo queryBranchById(int branchId);
	
	// query vocation by branchId
	public List<PositionInfo> queryVocationByBranchId(int branchId,int currentPage,int pageSize);
	
	// query num of vocation by branchId
	public int queryNoVocationByBranchId(int branchId);
	
	// query vocation by keyword
	public List<PositionInfo> queryVocatinByKeyword(String keyword,int currentPage,int pageSize);
	
	// query num of vocation by keyword
	public int queryNoVocatinByKeyword(String keyword);

	public boolean addVocation(PositionInfo vocation);

}
