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

	public boolean addFinanceRecord(FinancialRecords financialRecords , int financeType) {
		try {
			double totalMoney = this.getTotalMoney();
			if (financialRecords != null) {
				if (financialRecords.getFinancialFrom() != null
						&& financialRecords.getFinancialNum() != null) {
					financialRecords.setFinancialNum(financialRecords
							.getFinancialNum()
							* financeType);
					totalMoney += financialRecords.getFinancialNum();
					financialRecords.setTotalMoney(totalMoney);
					System.out.println(financialRecords.getTotalMoney());
					System.out.println(financialRecords.getFinancialNum());
					System.out.println(financialRecords.getFinancialFrom());
					System.out.println(financialRecords.getFinancialRemark());

					totalFinanceDao.addRecord(financialRecords);
					
					return true;
				}
			}
			
			return false;
			
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
