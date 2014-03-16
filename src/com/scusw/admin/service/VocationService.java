package com.scusw.admin.service;

import java.util.List;
import java.util.Map;

import com.scusw.model.BranchInfo;
import com.scusw.model.DepartmentInfo;
import com.scusw.model.PositionInfo;

/**
 * manage privilege
 * @author liu jiahao
 *
 */

public interface VocationService {
	
	// query all vocation
	public List<PositionInfo> queryAllVocation(int currentPage,int pageSize);
	
	// query total number of vocation
	public int getTotalVocation();
	
	// query vocation by id
	public PositionInfo queryVocationById(int vocationId);
	
	// update vocation
	public boolean updateVocation(PositionInfo vocation);
	
	// query all branchs
	public List<BranchInfo> queryAllBranch();
	
	// query branch by Id
	public BranchInfo queryBranchById(int branchId);
	
	// query vocation by branchId
	public List<PositionInfo> queryVocationByBranchId(int branchId,int currentPage,int pageSize);
	
	// query vocation by keyword
	public List<PositionInfo> queryVocatinByKeyword(String keyword,int currentPage,int pageSize);
	
	// query num of vocation by branchId
	public int queryNoVocationByBranchId(int branchId);
	
	// query num of vocation by keyword
	public int queryNoVocatinByKeyword(String keyword);
	
	public Map<Integer,List<DepartmentInfo>> queryAllDepartment();
}
