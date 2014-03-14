/**
 * 
 */
package com.scusw.finance.dao;

import java.util.List;

import com.scusw.model.FinancialRecords;

/**
 * @author 杨昭远
 *
 */
public interface TotalFinanceDao {
	public FinancialRecords getTotalMoney();

	/**
	 * 往金融收支表中添加一条数据
	 * param 
	 * return
	 * @throws Exception 
	 */
	public void addRecord(FinancialRecords financialRecords) throws Exception;
	
	public List<FinancialRecords> getAllRecords();
	

}
