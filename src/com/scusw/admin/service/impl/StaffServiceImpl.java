package com.scusw.admin.service.impl;

import java.sql.Timestamp;
import java.util.List;
import org.apache.log4j.Logger;

import com.scusw.admin.dao.StaffDao;
import com.scusw.admin.service.BranchService;
import com.scusw.admin.service.DepartmentService;
import com.scusw.admin.service.PrivilegeManageService;
import com.scusw.admin.service.StaffService;
import com.scusw.admin.service.VocationService;
import com.scusw.model.BranchInfo;
import com.scusw.model.DepartmentInfo;
import com.scusw.model.GroupInfo;
import com.scusw.model.PositionInfo;
import com.scusw.model.StaffInfo;
import com.scusw.util.MD5Util;


/**
 * 
 * @author liu jiahao
 *
 */

public class StaffServiceImpl implements StaffService {
	
	private StaffDao staffDao;
	private BranchService branchService;
	private DepartmentService departmentService;
	private VocationService vocationService;
	private PrivilegeManageService pservice;
	public static Logger logger = Logger.getLogger(StaffServiceImpl.class);
	
	

	public PrivilegeManageService getPservice() {
		return pservice;
	}


	public void setPservice(PrivilegeManageService pservice) {
		this.pservice = pservice;
	}


	public VocationService getVocationService() {
		return vocationService;
	}


	public void setVocationService(VocationService vocationService) {
		this.vocationService = vocationService;
	}


	public StaffDao getStaffDao() {
		return staffDao;
	}


	public BranchService getBranchService() {
		return branchService;
	}


	public DepartmentService getDepartmentService() {
		return departmentService;
	}


	public static Logger getLogger() {
		return logger;
	}


	public void setStaffDao(StaffDao staffDao) {
		this.staffDao = staffDao;
	}


	public void setBranchService(BranchService branchService) {
		this.branchService = branchService;
	}


	public void setDepartmentService(DepartmentService departmentService) {
		this.departmentService = departmentService;
	}


	public static void setLogger(Logger logger) {
		StaffServiceImpl.logger = logger;
	}


	/**
	 * query All Staff
	 */
	public List<StaffInfo> queryAllStaff(int currentPage,int pageSize) {
		
		return staffDao.queryAllStaff(currentPage, pageSize);
	}

	
	/**
	 * get total num of staff
	 */
	public int getTotalStaff() {
		
		return staffDao.getTotalStaff();
	}

	
	/**
	 * query Staff By Id
	 */
	public StaffInfo queryStaffById(int staffId) {
		
		return staffDao.queryStaffById(staffId);
	}

	
	/**
	 * update staff
	 */
	public boolean updateStaff(StaffInfo staff) {
		
		String passwordCoded = MD5Util.MD5(staff.getStaffPass());
		staff.setStaffPass(passwordCoded);
		logger.info("Update staff --- " + "staffId: " + staff.getStaffId() 
				+ " staffName: " + staff.getStaffName());
		return staffDao.updateStaff(staff);
	}

	
	/**
	 * query Branch By branchId
	 */
	public BranchInfo queryBranchById(int branchId) {

		return branchService.queryBranchById(branchId);
	}

	
	/**
	 * query staff By BranchId 
	 */
	public List<StaffInfo> queryStaffByBranchId(int branchId,int currentPage,int pageSize) {

		return staffDao.queryStaffByBranchId(branchId,currentPage,pageSize);
	}

	
	/**
	 * query staff By keyword
	 */
	public List<StaffInfo> queryStaffByKeyword(String keyword,int currentPage,int pageSize) {

		return staffDao.queryStaffByKeyword(keyword,currentPage,pageSize);
	}

	
	/**
	 * query num staff By BranchId
	 */
	public int queryNoStaffByBranchId(int branchId) {
		
		return staffDao.queryNoStaffByBranchId(branchId);
	}

	
	/**
	 * query num staff By keyword
	 */
	public int queryNoStaffByKeyword(String keyword) {
		
		return staffDao.queryNoStaffByKeyword(keyword);
	}
	
	
	/**
	 * query all branch
	 */
	public List<BranchInfo> queryAllBranch(){
		
		return branchService.queryAllBranch();
	}
	


	/**
	 * query Department By branchId
	 */
	public List<DepartmentInfo> queryDepartmentBybranchId(int branchId) {

		return departmentService.queryDepartmentByBranchId(branchId);
	}
	
	
	/**
	 * query vocation By DepartmentId
	 */
	public List<PositionInfo> queryVocationByDepartmentId(int departmentId) {

		return vocationService.queryVocationByDepartmentId(departmentId);
	}

	
	/**
	 * add Vocation
	 */
	public boolean addStaff(StaffInfo staff) {
		
		logger.info("Add staff --- " + "staffId: " + staff.getStaffId() 
				+ " staffName: " + staff.getStaffName());
		Timestamp currTime = new Timestamp(System.currentTimeMillis());
		staff.setStaffEmplTime(currTime);
		staff.setStaffAvai(1);
		String passwordCoded = MD5Util.MD5(staff.getStaffPass());
		staff.setStaffPass(passwordCoded);
		return staffDao.addStaff(staff);
	}
	
	
	/**
	 * query all info of groups
	 * @return
	 */
	public List<GroupInfo> queryAllGroup(){
		
		return pservice.queryAllGroup();
		
	}


	public boolean deleteStaff(StaffInfo staff) {
		
		staff.setStaffAvai(0);
		logger.info("Delete staff --- " + "staffId: " + staff.getStaffId() 
				+ " staffName: " + staff.getStaffName());
		return staffDao.updateStaff(staff);
	}


}
