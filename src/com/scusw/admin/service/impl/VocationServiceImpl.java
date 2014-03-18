package com.scusw.admin.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.scusw.admin.dao.VocationDao;
import com.scusw.admin.service.BranchService;
import com.scusw.admin.service.DepartmentService;
import com.scusw.admin.service.VocationService;
import com.scusw.model.BranchInfo;
import com.scusw.model.DepartmentInfo;
import com.scusw.model.PositionInfo;

/**
 * manage privilege
 * @author liu jiahao
 *
 */

public class VocationServiceImpl implements VocationService {
	
	private VocationDao vocationDao;
	private BranchService branchService;
	private DepartmentService departmentService;
	
	
	
	public BranchService getBranchService() {
		return branchService;
	}

	public void setBranchService(BranchService branchService) {
		this.branchService = branchService;
	}

	public DepartmentService getDepartmentService() {
		return departmentService;
	}

	public void setDepartmentService(DepartmentService departmentService) {
		this.departmentService = departmentService;
	}

	public VocationDao getVocationDao() {
		return vocationDao;
	}

	public void setVocationDao(VocationDao vocationDao) {
		this.vocationDao = vocationDao;
	}

	public List<PositionInfo> queryAllVocation(int currentPage,int pageSize) {
		return vocationDao.queryAllVocation(currentPage, pageSize);
	}

	public int getTotalVocation() {
		return vocationDao.getTotalVocation();
	}

	public PositionInfo queryVocationById(int vocationId) {
		
		return vocationDao.queryVocationById(vocationId);
	}

	public boolean updateVocation(PositionInfo vocation) {
		
		return vocationDao.updateVocation(vocation);
	}

//	public List<BranchInfo> queryAllBranch() {
//		
//		return vocationDao.queryAllBranch();
//	}

	public BranchInfo queryBranchById(int branchId) {

		return vocationDao.queryBranchById(branchId);
	}

	public List<PositionInfo> queryVocationByBranchId(int branchId,int currentPage,int pageSize) {

		return vocationDao.queryVocationByBranchId(branchId,currentPage,pageSize);
	}

	public List<PositionInfo> queryVocatinByKeyword(String keyword,int currentPage,int pageSize) {

		return vocationDao.queryVocatinByKeyword(keyword,currentPage,pageSize);
	}

	public int queryNoVocationByBranchId(int branchId) {
		return vocationDao.queryNoVocationByBranchId(branchId);
	}

	public int queryNoVocatinByKeyword(String keyword) {
		return vocationDao.queryNoVocatinByKeyword(keyword);
	}
	
	public List<BranchInfo> queryAllBranch(){
		return branchService.queryAllBranch();
	}
	
	
	public Map<Integer,List<DepartmentInfo>> queryAllDepartment(){
		List<BranchInfo> listb = branchService.queryAllBranch();
		Map<Integer,List<DepartmentInfo>> map = new HashMap<Integer, List<DepartmentInfo>>();
		for(BranchInfo bi:listb){
//			System.out.println(departmentService.queryDepartmentByBranchId(bi.getBranchId()).size() + "EEEEEEE");
			map.put(bi.getBranchId(), departmentService.queryDepartmentByBranchId(bi.getBranchId()));
		}
		return map;
		
	}

	public List<DepartmentInfo> queryDepartmentBybranchId(int branchId) {

		return departmentService.queryDepartmentByBranchId(branchId);
	}

	public boolean addVocation(PositionInfo vocation) {
		vocation.setVocationAvai(1);
		return vocationDao.addVocation(vocation);
	}

}
