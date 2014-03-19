package com.scusw.admin.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.scusw.admin.action.TeaLevelAction;
import com.scusw.admin.dao.VocationDao;
import com.scusw.admin.service.BranchService;
import com.scusw.admin.service.DepartmentService;
import com.scusw.admin.service.VocationService;
import com.scusw.model.BranchInfo;
import com.scusw.model.DepartmentInfo;
import com.scusw.model.PositionInfo;

/**
 * 
 * @author liu jiahao
 *
 */

public class VocationServiceImpl implements VocationService {
	
	private VocationDao vocationDao;
	private BranchService branchService;
	private DepartmentService departmentService;
	public static Logger logger = Logger.getLogger(TeaLevelAction.class);
	
	
	
	public static Logger getLogger() {
		return logger;
	}

	public static void setLogger(Logger logger) {
		VocationServiceImpl.logger = logger;
	}

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
	
	
	

	/**
	 * query All Vocation
	 */
	public List<PositionInfo> queryAllVocation(int currentPage,int pageSize) {
		
		return vocationDao.queryAllVocation(currentPage, pageSize);
	}

	
	/**
	 * get total num of vocation
	 */
	public int getTotalVocation() {
		
		return vocationDao.getTotalVocation();
	}

	
	/**
	 * query Vocation By Id
	 */
	public PositionInfo queryVocationById(int vocationId) {
		
		return vocationDao.queryVocationById(vocationId);
	}

	
	/**
	 * update Vocation
	 */
	public boolean updateVocation(PositionInfo vocation) {
		
		logger.info("Update vocation --- " + "vocationId: " + vocation.getVocationId() 
				+ " vocationName: " + vocation.getVocationName());
		return vocationDao.updateVocation(vocation);
	}

	
	/**
	 * query Branch By branchId
	 */
	public BranchInfo queryBranchById(int branchId) {

		return branchService.queryBranchById(branchId);
	}

	
	/**
	 * query Vocation By BranchId 
	 */
	public List<PositionInfo> queryVocationByBranchId(int branchId,int currentPage,int pageSize) {

		return vocationDao.queryVocationByBranchId(branchId,currentPage,pageSize);
	}

	
	/**
	 * query Vocation By keyword
	 */
	public List<PositionInfo> queryVocatinByKeyword(String keyword,int currentPage,int pageSize) {

		return vocationDao.queryVocatinByKeyword(keyword,currentPage,pageSize);
	}

	
	/**
	 * query num Vocation By BranchId
	 */
	public int queryNoVocationByBranchId(int branchId) {
		
		return vocationDao.queryNoVocationByBranchId(branchId);
	}

	
	/**
	 * query num Vocation By keyword
	 */
	public int queryNoVocatinByKeyword(String keyword) {
		
		return vocationDao.queryNoVocatinByKeyword(keyword);
	}
	
	public List<BranchInfo> queryAllBranch(){
		
		return branchService.queryAllBranch();
	}
	
	
	/**
	 * get all branch-departments
	 * not used yet
	 */
	public Map<Integer,List<DepartmentInfo>> queryAllDepartment(){
		List<BranchInfo> listb = branchService.queryAllBranch();
		Map<Integer,List<DepartmentInfo>> map = new HashMap<Integer, List<DepartmentInfo>>();
		for(BranchInfo bi:listb){
			map.put(bi.getBranchId(), departmentService.queryDepartmentByBranchId(bi.getBranchId()));
		}
		return map;
		
	}

	/**
	 * query Department By branchId
	 */
	public List<DepartmentInfo> queryDepartmentBybranchId(int branchId) {

		return departmentService.queryDepartmentByBranchId(branchId);
	}

	
	/**
	 * add Vocation
	 */
	public boolean addVocation(PositionInfo vocation) {
		
		logger.info("Add vocation --- " + "vocationId: " + vocation.getVocationId() 
				+ " vocationName: " + vocation.getVocationName());
		vocation.setVocationAvai(1);
		return vocationDao.addVocation(vocation);
	}

}
