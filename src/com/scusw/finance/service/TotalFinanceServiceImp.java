/**
 * 
 */
package com.scusw.finance.service;

import java.util.List;

import com.scusw.finance.dao.TotalFinanceDao;
import com.scusw.model.FinancialRecords;

/**
 * @author 杨昭远
 * 
 */
public class TotalFinanceServiceImp implements TotalFinanceService {
	private TotalFinanceDao totalFinanceDao;

	public TotalFinanceDao getTotalFinanceDao() {
		return totalFinanceDao;
	}

	public void setTotalFinanceDao(TotalFinanceDao totalFinanceDao) {
		this.totalFinanceDao = totalFinanceDao;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.scusw.finance.service.TotalFinanceService#getTotalMoney()
	 */
	public double getTotalMoney() {
		// TODO Auto-generated method stub
		FinancialRecords financialRecords = totalFinanceDao.getTotalMoney();
		if (null == financialRecords) {
			return 0;
		} else {
			return financialRecords.getTotalMoney();
		}
	}

	public boolean addFinanceRecord(FinancialRecords financialRecords) {
		try {
			totalFinanceDao.addRecord(financialRecords);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	/* (non-Javadoc)
	 * @see com.scusw.finance.service.TotalFinanceService#getHistory()
	 */
	public List<FinancialRecords> getHistory() {
		// TODO Auto-generated method stub
		
		return totalFinanceDao.getAllRecords();
	}

}
