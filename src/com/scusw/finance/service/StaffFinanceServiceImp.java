/**
 * 
 */
package com.scusw.finance.service;

import java.util.List;

import com.scusw.finance.dao.StaffFinanceDao;
import com.scusw.model.StaffFees;
import com.scusw.model.StaffInfo;

/**
 * @author Administrator
 *
 */
public class StaffFinanceServiceImp implements StaffFinanceService{
	private StaffFinanceDao staffFinanceDao;

	public StaffFinanceDao getStaffFinanceDao() {
		return staffFinanceDao;
	}

	public void setStaffFinanceDao(StaffFinanceDao staffFinanceDao) {
		this.staffFinanceDao = staffFinanceDao;
	}

	/* (non-Javadoc)
	 * @see com.scusw.finance.service.StaffFinanceService#searchAll()
	 */
	public List<StaffInfo> searchAll() {
		// TODO Auto-generated method stub
		List<StaffInfo> s = staffFinanceDao.queryAllStaff();
		
		return s;
	}

	/* (non-Javadoc)
	 * @see com.scusw.finance.service.StaffFinanceService#conditionSearch(java.lang.String)
	 */
	public List<StaffInfo> conditionSearch(String staffName) {
		// TODO Auto-generated method stub
		List<StaffInfo> s = staffFinanceDao.queryStaff(staffName);
		return s;
	}

	/* (non-Javadoc)
	 * @see com.scusw.finance.service.StaffFinanceService#addStaffFees(com.scusw.model.StaffFees)
	 */
	public void addStaffFees(StaffFees staffFees) {
		// TODO Auto-generated method stub
		staffFinanceDao.addRecord(staffFees);
		
	}

	/* (non-Javadoc)
	 * @see com.scusw.finance.service.StaffFinanceService#findById(int)
	 */
	public StaffInfo findById(int staffId) {
		// TODO Auto-generated method stub
		
		return staffFinanceDao.getRecordById(staffId);
	}

	/* (non-Javadoc)
	 * @see com.scusw.finance.service.StaffFinanceService#getFeesHistory(int)
	 */
	public List<StaffFees> getFeesHistory(int staffId) {
		// TODO Auto-generated method stub
		return staffFinanceDao.getRecordsById(staffId);
	}
	
	
}
