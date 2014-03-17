/**
 * 
 */
package com.scusw.finance.dao;

import java.util.List;

import com.scusw.model.StaffFees;
import com.scusw.model.StaffInfo;

/**
 * @author Administrator
 *
 */
public interface StaffFinanceDao {
	public List<StaffInfo> queryAllStaff();

	/**
	 * 方法描述
	 * param args0 参数0
	 * return
	 */
	public List<StaffInfo> queryStaff(String staffName);

	/**
	 * 方法描述
	 * param args0 参数0
	 * return
	 */
	public void addFeesRecord(StaffFees staffFees);

	/**
	 * 方法描述
	 * param args0 参数0
	 * return
	 */
	public StaffInfo getRecordById(int staffId);

	/**
	 * 方法描述
	 * param args0 参数0
	 * return
	 * @param staffid 
	 */
	public List<StaffFees> getRecordsById(int staffId);
	
	public List<StaffFees> getAllFeesRecords();
}
