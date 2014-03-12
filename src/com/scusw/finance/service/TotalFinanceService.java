/**
 * 
 */
package com.scusw.finance.service;

import java.util.List;

import com.scusw.model.FinancialRecords;

/**
 * @author Administrator
 *
 */
public interface TotalFinanceService {

	/**
	 * 返回总账户的信息
	 * return (double)总金额
	 */
	public double getTotalMoney();

	/**
	 * 添加一条收支信息
	 * param financialRecords 收支的对象
	 * return true 添加成功 false 添加失败
	 */
	public boolean addFinanceRecord(FinancialRecords financialRecords);

}
