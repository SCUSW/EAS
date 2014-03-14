/**
 * 
 */
package com.scusw.finance.service;

import java.util.List;

import com.scusw.model.StaffFees;
import com.scusw.model.StaffInfo;

/**
 * @author Administrator
 *
 */
public interface StaffFinanceService {

	/**
	 * 方法描述
	 * param args0 参数0
	 * return
	 */
	public List<StaffInfo> searchAll();

	/**
	 * 方法描述
	 * param args0 参数0
	 * return
	 */
	public List<StaffInfo> conditionSearch(String staffName);

	/**
	 * 方法描述
	 * param args0 参数0
	 * return
	 */
	public void addStaffFees(StaffFees staffFees);

	/**
	 * 方法描述
	 * param args0 参数0
	 * return
	 */
	public StaffInfo findById(int staffId);

	/**
	 * 方法描述
	 * param args0 参数0
	 * return
	 * @param staffid 
	 */
	public List<StaffFees> getFeesHistory(int staffId);
	

}
