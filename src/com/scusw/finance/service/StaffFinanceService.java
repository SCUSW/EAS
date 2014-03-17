/**
 * 
 */
package com.scusw.finance.service;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

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
	public List<StaffInfo> conditionSearch(StaffInfo staffInfo);

	/**
	 * 方法描述
	 * param args0 参数0
	 * return
	 */
	public void addStaffSalaryFees(StaffFees staffFees);

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
	public List<StaffFees> getFeesHistory(StaffFees staffFees);

	/**
	 * 方法描述
	 * param args0 参数0
	 * return
	 */
	public Map<String, String> getLastPayTime();
	

}
