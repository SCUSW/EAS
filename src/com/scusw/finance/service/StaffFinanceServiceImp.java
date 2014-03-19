/**
 * 
 */
package com.scusw.finance.service;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.scusw.finance.dao.StaffFinanceDao;
import com.scusw.model.FinancialRecords;
import com.scusw.model.StaffFees;
import com.scusw.model.StaffInfo;

/**
 * @author Administrator
 * 
 */
public class StaffFinanceServiceImp implements StaffFinanceService {
	private StaffFinanceDao staffFinanceDao;
	private TotalFinanceService totalFinanceService;
	private FinancialRecords financialRecords;
	private StaffInfo staffInfo;
	private Map<String, String> lastPayTime;
	
	

	public void setLastPayTime(Map<String, String> lastPayTime) {
		this.lastPayTime = lastPayTime;
	}

	public StaffInfo getStaffInfo() {
		return staffInfo;
	}

	public void setStaffInfo(StaffInfo staffInfo) {
		this.staffInfo = staffInfo;
	}

	public FinancialRecords getFinancialRecords() {
		return financialRecords;
	}

	public void setFinancialRecords(FinancialRecords financialRecords) {
		this.financialRecords = financialRecords;
	}

	public TotalFinanceService getTotalFinanceService() {
		return totalFinanceService;
	}

	public void setTotalFinanceService(TotalFinanceService totalFinanceService) {
		this.totalFinanceService = totalFinanceService;
	}

	public StaffFinanceDao getStaffFinanceDao() {
		return staffFinanceDao;
	}

	public void setStaffFinanceDao(StaffFinanceDao staffFinanceDao) {
		this.staffFinanceDao = staffFinanceDao;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.scusw.finance.service.StaffFinanceService#searchAll()
	 */
	public List<StaffInfo> searchAll() {
		// TODO Auto-generated method stub
		List<StaffInfo> s = staffFinanceDao.queryAllStaff();

		return s;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.scusw.finance.service.StaffFinanceService#conditionSearch(java.lang
	 * .String)
	 */
	public List<StaffInfo> conditionSearch(StaffInfo staffInfo) {
		// TODO Auto-generated method stub
		List<StaffInfo> s = staffFinanceDao
				.queryStaff(staffInfo.getStaffName());
		return s;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.scusw.finance.service.StaffFinanceService#addStaffFees(com.scusw.
	 * model.StaffFees)
	 */
	public void addStaffSalaryFees(StaffFees staffFees) {
		// TODO Auto-generated method stub
		staffFees.setSfeesFrom("支付职工工资");
		staffFinanceDao.addFeesRecord(staffFees);

		double totalMoney = totalFinanceService.getTotalMoney();

		if (staffFees.getSfeesNum() > 0) {
			if (financialRecords == null) {
				financialRecords = new FinancialRecords();
			}
			staffInfo = this.findById(staffFees.getStaffInfo().getStaffId());
			financialRecords.setFinancialNum(0 - staffFees.getSfeesNum());
			totalMoney += financialRecords.getFinancialNum();
			financialRecords.setTotalMoney(totalMoney);
			financialRecords.setFinancialFrom("支付职工工资");
			financialRecords.setFinancialRemark("职工编号："
					+ staffInfo.getStaffNo() + "职工姓名："
					+ staffInfo.getStaffName());

			totalFinanceService.addFinanceRecord(financialRecords , -1);
		}
		
		//对职工业绩进行清零
		this.changeRoyaltyToZero(staffFees);

	}

	/**
	 * 方法描述
	 * param args0 参数0
	 * return
	 */
	private void changeRoyaltyToZero(StaffFees staffFees) {
		// TODO Auto-generated method stub
		staffFinanceDao.updateRoyaltyOfTeacherById(staffFees.getStaffInfo().getStaffId());
		staffFinanceDao.updateRoyaltyOfSalesmanById(staffFees.getStaffInfo().getStaffId());
//		staffFinanceDao.deleteRoyaltyOfSalesManById(staffFees.getStaffInfo().getStaffId());
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.scusw.finance.service.StaffFinanceService#findById(int)
	 */
	public StaffInfo findById(int staffId) {
		// TODO Auto-generated method stub

		return staffFinanceDao.getRecordById(staffId);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.scusw.finance.service.StaffFinanceService#getFeesHistory(int)
	 */
	public List<StaffFees> getFeesHistory(StaffFees staffFees) {
		// TODO Auto-generated method stub
		return staffFinanceDao.getRecordsById(staffFees.getStaffInfo()
				.getStaffId());
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.scusw.finance.service.StaffFinanceService#getLastPayTime(java.util
	 * .Map)
	 */
	public Map<String, String> getLastPayTime() {
		// TODO Auto-generated method stub
		lastPayTime = new HashMap<String, String>();
		for (StaffFees s : staffFinanceDao.getAllFeesRecords()) {
			lastPayTime.put(s.getStaffInfo().getStaffId().toString(), s
					.getSfeesTime().toString());
		}

		System.out.println(lastPayTime.size());

		return lastPayTime;

	}

}
